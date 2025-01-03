<?php

namespace App\Http\Controllers;

use App\Models\Batch;
use App\Models\InsSms;
use App\Models\Student;
use App\Notifications\StudentNotification;
use App\Traits\AdminTrait;
use App\Traits\CameraTrait;
use App\Traits\InstitutionTrait;
use App\Traits\SuperAdminTrait;
use App\Traits\UserTrait;
use Illuminate\Http\Request;
use DataTables;
use Illuminate\Support\Facades\Storage;
use DB;

class StudentController extends Controller
{
    use InstitutionTrait, SuperAdminTrait, AdminTrait, UserTrait, CameraTrait;

    public function __construct()
    {
        // user permission check
        $this->middleware('permission:student-index')->only(['index', 'show']);
        $this->middleware('permission:student-create')->only(['create', 'store']);
        $this->middleware('permission:student-update')->only(['edit', 'update']);
        $this->middleware('permission:student-destroy')->only(['destroy']);
    }

    // ajax data for datatable table
    public function datatable($request) {
        if($this->admin()) {
            // this data for admin
            $students = Student::where('institution_id', $this->institution()->id)
                        ->with(['batch', 'institution'])
                        ->whereRelation('batch', 'is_active', true)
                        ->orderBy('id', 'desc')
                        ->get();
        } elseif($this->super_admin()) {
            // this data for super admin
            $students = Student::with(['batch', 'institution'])
                        ->orderBy('id', 'desc')
                        ->get();
        }
        $user = $this->user();
        return DataTables::of($students)
        ->addIndexColumn()
        ->addColumn('student_name', function(Student $student){
            if($student->is_active)
                return $student->student_name . '<br/>' . '<span class="badge badge-success">Active</span>';
            else
                return $student->student_name . '<br/>' . '<span class="badge badge-danger">Deactive</span>';
        })
        ->addColumn('unique_id', function(Student $student) {
            $output = '';
            if($student->unique_id) {
                $output .= '<span class="badge badge-success">Id: '.$student->unique_id.'</span><br/>';
                $output .= '<span class="badge badge-info">Pin: '.$student->pin.'</span>';
            }else {
                $output .= 'N/A';
            }
            return $output;
        })
        ->addColumn('admission_date', '{{date("d-M,y", strtotime($admission_date))}}')
        ->addColumn('batch', function(Student $student){
            return $student->batch->batch_name;
        })
        ->addColumn('institution', function(Student $student){
            return $student->institution->name;
        })
        ->addColumn('student_contact', function(Student $student){
            $string = '';
            if($student->student_contact)
                $string .= $student->student_contact . '(St) <span role="button" class="badge badge-info"><a class="text-light" href="tel:'.$student->student_contact.'"><i class="fas fa-phone-alt"></i></a></span><br/>';
            if($student->guardian_contact)
               $string .= $student->guardian_contact . '(Gr)' . '<span role="button" class="badge badge-info"><a class="text-light" href="tel:'.$student->guardian_contact.'"><i class="fas fa-phone-alt"></i></a></span>';
            return $string;
        })
        ->editColumn('user_profile', function(Student $student){
            if($student->user_profile){
                $user_profile_path = asset("storage/students/".$student->user_profile);

                if(file_exists(storage_path("app/public/students/".$student->user_profile))){
                    return '<img src="'.$user_profile_path.'" width="60" height="60" class="img-circle elevation-2" alt="User Image">';
                }else {
                    return '<img src="'.asset("/dist/img/profile_avatar.png").'" width="60" height="60" class="img-circle elevation-2" alt="User Image">';
                }
            }else
                return '<img src="'.asset("/dist/img/profile_avatar.png").'" width="60" height="60" class="img-circle elevation-2" alt="User Image">';
        })
        ->addColumn('action', function(Student $student)use($user){
            // action button
            if($user->canany(['student-index', 'student-create', 'student-update', 'student-destroy'])){
                $action = '<div class="btn-group dropleft">
                    <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                    Action <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu" role="menu">';
                if($user->can('student-index'))
                    $action.= '<a class="dropdown-item show_btn" href="javascript:void(0)" data-link="'.route('students.show', ['student' => $student->id]).'"><i class="fas fa-eye"></i> View</a>';
                if($user->can('student-update'))
                    $action .= '<a class="dropdown-item" href="'.route('students.edit', ['student' => $student->id]).'"><i class="fas fa-edit"></i> Edit</a>';
                if(!$student->unique_id){
                    $action .= '<a class="dropdown-item generate_id" href="javascript:void(0)" data-id="'.$student->id.'"><i class="fas fa-square"></i> Generate Id</a>';
                }
                if($user->can('student-destroy')) {
                    $action .= '<form id="destroy-'.$student->id.'" action="'.route('students.destroy', ['student' => $student->id]).'" method="POST">';
                    $action .= '<input type="hidden" name="_token" value="'.csrf_token().'" />';
                    $action .= method_field('DELETE');
                    $action .= '</form>';
                    $action .= '<button class="dropdown-item delete_btn" data-id="'.$student->id.'" type="button"><i class="fas fa-trash"></i> Delete</button>';
                }
                $action .= '</div></div>';
            }else {
                $action = "N/A";
            }

            return $action;
        })
        ->rawColumns(['student_name', 'student_contact', 'user_profile', 'action', 'unique_id'])
        ->toJson();
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->ajax()) {
            return $this->datatable($request);
        }
        return view('pages.students.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        // check authorized action
        $this->authorize('create', Student::class);

        $batches = Batch::where('is_active', true)->where('institution_id', $this->institution()->id)->get();
        return view('pages.students.create', compact('batches'));
    }

    public function generate_unique_id(Request $request)
    {

        $request->validate([
            'student_id' => 'required',
        ]);
        // check has sms or validity
        if(!(valid_sms() && total_sms() > 0)) {
            return response()->json([
                "success" => false,
                "text" => "You didn\'t have enough SMS. Please buy sms!",
            ]);
        }

        $student = Student::with(['institution', 'batch'])->findOrFail($request->student_id);
        if($student->unique_id && $student->pin) {
            return response()->json([
                "success" => false,
                "text" => "Sorry! You have already a unique id!",
            ]);
        }

        $this->authorize('update', $student); // authorized
        $gen_id = substr(rand(), 0, 6);
        $check = Student::where('unique_id', $gen_id)->first();
        while($check != null) {
            $gen_id = substr(rand(), 0, 6);
            $check = Student::where('unique_id', $gen_id)->first();
        }

        $pin = substr(rand(), 0, 4);
        $student->unique_id = $gen_id;
        $student->pin = $pin;
        $student->save();
        try {
            // send notification
            $student->notify(new StudentNotification([
                'ins_name' => $student->institution->name,
                'student_name' => $student->student_name,
                'student_batch' => $student->batch->batch_name,
                'student_class' => $student->student_class,
                'admission_date' => date('d/m/y', strtotime($student->admission_date)),
                'unique_id' => $student->unique_id,
                'pin_number' => $student->pin,
                'login_link' => route('student.login'),
            ]));
        }catch(\Exception $e) {

        }

        return response()->json([
            "text" => 'Student unique id generated successfull!',
            "success" => true,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // check authorized action
        $this->authorize('create', Student::class);

        $request->validate([
            'student_name' => 'required|string',
            'admission_date' => 'required|date',
            'student_class' => 'required|string',
            'student_contact' => 'required|numeric|min:11',
            'guardian_contact' => 'nullable|numeric|min:11',
            'clg_name' => 'nullable|string',
            'batch' => 'required|numeric',
            'user_profile' => 'nullable|mimes:jpg,JPEG,png,PNG,JPG|max:100'
        ]);

        // store image
        $file_name = null;
        if($request->file('user_profile')) {
            $file_name = rand()."_".date('d_m_y').".".$request->file('user_profile')->getClientOriginalExtension(); // set file name
            if(!$request->file('user_profile')->storeAs('public/students/', $file_name)) // store image
                $file_name = null; // if fail to store image then set file name null
        }

        if($request->camera_phone_input)
        {
            $file_name = rand()."_".date('d_m_y').".jpg"; // set file name
            if(!$this->store_camera_image($request->camera_phone_input, public_path('/storage/students/'.$file_name))) // store image
                $file_name = null;
        }

        $data = $request->all();
        $data['user_profile'] = $file_name;
        if($request->batch)
            $data['batch_id'] = $request->batch;
        $data['institution_id'] = $this->institution()->id;
        Student::create($data);
        return redirect()->route('students.index')->with('created', 'Student create successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student)
    {
        if($student->user_profile){
            $user_profile_path = Storage::url("students/".$student->user_profile);
            if(file_exists(public_path("storage/students/".$student->user_profile))){
                $user_profile = $user_profile_path;
            }else {
                $user_profile = asset("/dist/img/profile_avatar.png");
            }
        }else
            $user_profile = asset("/dist/img/profile_avatar.png");
        return view('pages.students.show', compact('student', 'user_profile'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function edit(Student $student)
    {
        // check data owner authentication
        $this->authorize('view', $student);

        $batches = Batch::where('is_active', true)->where('institution_id', $this->institution()->id)->get();
        return view('pages.students.edit', compact('student', 'batches'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
        // authorized user action
        $this->authorize('update', $student);

        // validate input data
        $request->validate([
            'student_name' => 'required|string',
            'admission_date' => 'required|date',
            'student_class' => 'required|string',
            'student_contact' => 'required|numeric|min:11',
            'guardian_contact' => 'nullable|numeric|min:11',
            'clg_name' => 'nullable|string',
            'batch' => 'required|numeric',
            'user_profile' => 'nullable|mimes:jpg,JPEG,png,PNG,JPG|max:100'
        ]);

        // store image
        $file_name = $student->user_profile;
        if(($request->file('user_profile') || $request->camera_phone_input) && $student->user_profile)
        {
            // remove previous image if exists
            // check if exists file in storage
            if(file_exists(public_path('storage/students/'.$student->user_profile))) {
                // unlink file from storage
                unlink(public_path('storage/students/'.$student->user_profile));
            }
        }

        if($request->file('user_profile'))
        {
            // store new file
            $file_name = rand()."_".date('d_m_y').".".$request->file('user_profile')->getClientOriginalExtension();
            if(!$request->file('user_profile')->storeAs('students/', $file_name, 'public')) {
                // if fail to store image in local storage then set name empty
                $file_name = null;
            }
        }

        if($request->camera_phone_input)
        {
            $file_name = rand()."_".date('d_m_y').".jpg"; // set file name
            if(!$this->store_camera_image($request->camera_phone_input, public_path('/storage/students/'.$file_name))) // store image
                $file_name = null;
        }

        $data = $request->all();
        $data['user_profile'] = $file_name;
        if($request->batch)
            $data['batch_id'] = $request->batch;

        if($request->is_active)
            $data['is_active'] = true;
        else
            $data['is_active'] = false;

        $student->update($data);
        return redirect()->route('students.index')->with('updated', 'Student updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        // check policy
        $this->authorize('delete', $student);
        DB::beginTransaction();
        try{
            // delete user profile
            if($student->user_profile) {
                // check if exists file in storage
                if(file_exists(public_path('storage/students/'.$student->user_profile))) {
                    // unlink file from storage
                    unlink(public_path('storage/students/'.$student->user_profile));
                }
            }
            $student->delete();
            DB::commit();
            return response()->json([
                "text" => 'Student delete successfully',
                "success" => true,
            ]);
        }catch(\Exception $e) {
            DB::rollback();
            return $e->getMessage();
        }
    }

    public function removeImage(Student $student)
    {
        try{
            $this->authorize('update', $student);

            if (file_exists(public_path('storage/students/' . $student->user_profile))) {
                unlink(public_path('storage/students/' . $student->user_profile));
            }
            $data['user_profile'] = null;
            $student->update($data);
            return response()->json([
                "text" => 'Student profile image remove successfully!',
                "success" => true,
            ]);
        }
        catch (\Exception $e) {
            return response()->json([
                "text" => 'Something went wrong!',
                "success" => false,
            ]);
        }
    }
}
