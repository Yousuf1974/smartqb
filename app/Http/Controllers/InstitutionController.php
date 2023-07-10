<?php

namespace App\Http\Controllers;

use App\Models\Institution;
use Illuminate\Http\Request;
use DataTables;
use App\Notifications\InstitutionNotification;

class InstitutionController extends Controller
{
    // set permission
    public function __construct()
    {
        // institution permission
        // $this->middleware('permission:institution-index')->only(['index', 'show']);
        // $this->middleware('permission:institution-update', ['only' => ['edit', 'update']]);
        // $this->middleware('permission:institution-destroy', ['only' => ['destroy']]);
        $this->middleware('permission:miscellaneous-sms_template', ['only' => ['sms_template', 'sms_template_store']]);
        
    }
    
    public function datatables() 
    {
        $institutions = Institution::select('*')->with(['students'])->orderBy('id', 'desc');
        return DataTables::eloquent($institutions)
        ->addIndexColumn()
        ->editColumn('created_at', function(Institution $institution) {
            return date('d/m/y', strtotime($institution->created_at));
        })
        ->editColumn('email', function(Institution $institution) {
            return $institution->email ?? "N/A";
        })
        ->addColumn('total_student', function(Institution $institution) {
            return $institution->students->count() ?? 0;
        })
        ->addColumn('user_psw', function(Institution $institution) {
            return $institution->admin()->raw_psw;
            // return "N/A";
        })
        ->editColumn('phone', function(Institution $institution) {
             return $institution->phone . ' <span role="button" class="badge badge-info"><a class="text-light" href="tel:'.$institution->phone.'"><i class="fas fa-phone-alt"></i></a></span>';
        })
        ->addColumn('primary_id', function(Institution $institution) {
            return $institution->id;
        })
        ->addColumn('active', function(Institution $institution) {
            if($institution->is_active){
                return '<span class="badge badge-success">Active</span>';
            }else{
                return '<span class="badge badge-danger">Deactive</span>';
            }
        })
        ->addColumn('action', function(Institution $institution) {
            $output = '<form id="destroy-'.$institution->id.'" action="'.route('institution.destroy', ['institution' => $institution->id]).'" method="post">';
            $output .= '<input type="hidden" name="_token" value="'.csrf_token().'" />'. method_field('DELETE');
            $output .= '</form>';
            $output .= '<div class="btn-group dropleft">
                <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                Action <span class="sr-only">Toggle Dropdown</span>
                </button>
                <div class="dropdown-menu" role="menu">';
            $output .= '<a class="dropdown-item" href="'.route('institution.show', ['institution' => $institution->id]).'"><i class="fas fa-eye"></i> View</a>';
            // $output .= '<a class="dropdown-item send_sms" href="javascript:void(0)" data-id="'.$institution->id.'"><i class="fas fa-sms"></i> Send SMS</a>';
            $output .= '<a class="dropdown-item" href="'.route('institution.edit', ['institution' => $institution->id]).'"><i class="fas fa-edit"></i> Edit</a>';
            $output .= '<button type="button" data-id="{{$institution->id}}" class="dropdown-item delete_btn" ><i class="fas fa-trash"></i>  Delete</button>';
            $output .= '</div></div>';
            return $output;
        })
        ->rawColumns(['phone', 'active', 'action'])
        ->make();
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {        
        if($request->ajax()) {
            return $this->datatables();
        }
        return view('pages.admin.institution.index');
    }
    
    public function comment(Request $request, Institution $institution) 
    {
        $institution->comment = $request->comment;
        $institution->save();
        return redirect()->back()->with('created',  'Comment Saved!');
    }
    
    public function send_sms(Request $request) 
    {
        $institutions = null;
        if($request->send) {
            $institutions = Institution::select('*');
            if(!is_null($request->phone)) {
                $institutions = $institutions->where('phone',  $request->phone);
            }
            $institutions = $institutions->get();
        }
        
        return view('pages.admin.institution.send_sms', compact('institutions'));
    }
    
    public function send_sms_submit(Request $request) 
    {
        $request->validate([
           'selected_id' => 'required|array|min:1',
        ]);
        
        foreach($request->selected_id as $key => $select_id) {
            $institution = Institution::find($select_id);
            $institution->notify(new InstitutionNotification($request->message[$key]));
        }
        
        return redirect()->back()->with('created', 'Message sent successfull!');
    }
    

    public function sms_template()
    {
        $institution = Institution::select('payment_sms_template', 'id', 'id_sms', 'custom_sms_template')->where('id', auth()->user()->institution_id)->first();
        return view('pages.sms.sms_template', compact('institution'));
    }

    public function sms_template_store(Request $request)
    {
        $request->validate([
            'sms_template' => 'required',
            'type' => 'required',
        ]);
        $institution = Institution::find(auth()->user()->institution_id);
        // payment sms template save
        if($request->type == 'payment') 
        {
            $institution->payment_sms_template = $request->sms_template;
        }
        // student id sms generate message
        if($request->type == 'student_id_sms')
        {
            $institution->id_sms = $request->sms_template;
        }

        // custom sms template
        if($request->type == 'custom_sms_template') {
            $institution->custom_sms_template = $request->sms_template;
        }

        $institution->save();
        return redirect()->route('sms.template')->with('updated', 'SMS Template Update Successfull!');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        return view("pages.admin.institution.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'institution_name' => 'required|string',
            'head_of_institution' => 'required|string',
            'phone' => 'required|unique:institutions,phone|min:11',
            'email' => 'nullable|email:rfc,filter|unique:institutions,email',
            'address' => 'required',
        ]);
        $data = $request->all();
        $data['name'] = $request->institution_name;
        $institution = Institution::create($data);
        return back()
        ->with('create', true)
        ->with('message', 'Institution create successfully!')
        ->with('institution_id', $institution->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($institution)
    {
        $institution = Institution::with(['users'])->findOrFail($institution);
        return view('pages.admin.institution.view', compact('institution'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($institution)
    {
        $institution = Institution::find($institution);
        return view('pages.admin.institution.edit', compact('institution'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $institution)
    {
        $request->validate([
            'institution_name' => 'required|string',
            'head_of_institution' => 'required|string',
            'phone' => 'required|min:11|unique:institutions,phone,'.$institution,
            'email' => 'nullable|email:rfc,filter|unique:institutions,email,'.$institution,
            'address' => 'required',
        ]);
        
        $data = $request->all();
        $data['name'] = $request->institution_name;

        if($request->is_active) {
            $data['is_active'] = true;
        } else {
            $data['is_active'] = false;
        }

        $institution = Institution::find($institution)->update($data);

        return redirect()->route('institution.index')->with('updated', 'Institution updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Institution $institution)
    {
        $institution->delete();
        return redirect()->route('institution.index')->with('deleted', "Institution delete successfull!");
    }
}
