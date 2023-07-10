<?php

namespace App\Http\Controllers;

use App\Models\Batch;
use App\Models\InsSms;
use App\Models\Institution;
use App\Models\SMS;
use App\Models\SmsHistory;
use App\Models\SMSPurchase;
use App\Models\Student;
use App\Notifications\CustomNotification;
use App\Traits\InstitutionTrait;
use App\Traits\SmsTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use DataTables;

class SMSController extends Controller
{
    use InstitutionTrait, SmsTrait;
    public function __construct()
    {
        // user permission check
        // $this->middleware('permission:sms-index')->only(['index', 'show']);
        // $this->middleware('permission:sms-create')->only(['store']);
        // $this->middleware('permission:sms-update')->only(['update']);
        // $this->middleware('permission:sms-destroy')->only(['destroy']);
        $this->middleware('permission:miscellaneous-custom_sms_send')->only(['custom_sms_send','custom_sms_send_req']);
        $this->middleware('permission:miscellaneous-sms_history')->only(['sms_history', 'retry_to_send']);
        $this->middleware('permission:miscellaneous-sms_buy')->only(['sms_buy', 'sms_buy_store']);
        $this->middleware('permission:miscellaneous-sms_purchase_history')->only(['sms_purchase_history']);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function sms_balance_check()
    {
        return total_sms();
    }

    public function sms_purchase_history()
    {
        if(auth()->guard('admin')->check()) {
            $sms_purchase_histories = SMSPurchase::orderBy('id', 'desc')->get();
            return view('pages.admin.sms.sms_purhcase_history', compact('sms_purchase_histories'));
        }else {
            $sms_purchase_histories = SMSPurchase::where('institution_id', auth()->user()->institution_id)
                ->orderBy('id', 'desc')->get();
                return view('pages.sms.sms_purhcase_history', compact('sms_purchase_histories'));
        }
    }

    public function dataTable($request)
    {
        $sms_histories = SmsHistory::with(['student', 'send_by'])
            ->where('institution_id', auth()->user()->institution_id)
            ->orderBy('id', 'desc');
        return DataTables::eloquent($sms_histories)
            ->addIndexColumn()
            ->addColumn('status', function(SmsHistory $smsHistory){
                $status = '';
                if($smsHistory->is_send) {
                    $status .= '<span class="badge badge-success">Delivered</span>';
                }else {
                    $status .= '<span class="badge badge-danger">Failed</span>';
                }
                $status .= '<br/><small class="text-muted">SMS: '.$smsHistory->sms_count.'</small>';
                return $status;
            })
            ->addColumn('date', function(SmsHistory $smsHistory){
                return date('d/m/Y g:i a', strtotime($smsHistory->created_at));
            })
            ->addColumn('message', function(SmsHistory $smsHistory){
                return '<a href="javascript:void(0)" class="view_message" data-message="'.$smsHistory->message.'">view message</a>';
            })
            ->addColumn('action', function(SmsHistory $smsHistory){
                if(!$smsHistory->is_send)
                    return '<button class="btn btn-xs btn-success retry_to_send" data-id="'.$smsHistory->id.'">Resend</button>';
                else
                    return '&nbsp;';
            })
            ->rawColumns(['status', 'message', 'action'])
            ->make(true);
    }

    public function sms_history(Request $request)
    {
        if(request()->ajax())
        {
            return $this->dataTable($request);
        }
        return view('pages.sms.sms_history');
    }

    public function retry_to_send(Request $request)
    {
        if(!(valid_sms() && total_sms() > 0)){
            abort(505, "Insufficient Sms. Please Buy!");
        }
        $sms_history = SmsHistory::find($request->id);
        $this->post($sms_history->message, $sms_history->mobile_nmber, $sms_history->student_id, $sms_history);
        return response()->json(["text"=> 'Message successfully delivered!', "success" => true]);
    }

    public function custom_sms_send()
    {
        $students = null;
        $batches = Batch::where('institution_id', auth()->user()->institution_id)->get();
        $institution = Institution::select('custom_sms_template', 'name')->where('id', auth()->user()->institution_id)->first();
        if(request()->filter == 'yes') {
            $students = Student::with(['batch'])->select('*')->where('institution_id', auth()->user()->institution_id);
            if(request()->batch) {
                $students->where('batch_id', request()->batch);
            }
            if(request()->search) {
                $students->where(function($query){
                    return $query->where('student_name', 'LIKE', '%'.request()->search.'%')
                    ->orWhere('student_contact', request()->search);
                });
            }
            $students = $students->get();
        }
        return view('pages.sms.custom_sms_send', compact('students', 'batches', 'institution'));
    }

    public function custom_sms_send_req(Request $request)
    {
        $request->validate([
            'selected_id' => 'required|array|min:1',
        ]);

        if(valid_sms() && total_sms() > 0) {

            foreach($request->selected_id as $key => $student_id) {
                try{
                    $student = Student::with(['institution', 'batch'])->find($student_id);
                    if($student->institution_id == auth()->user()->institution_id)
                    {
                        $student->notify(new CustomNotification([
                            'ins_name' => $student->institution->name,
                            'student_name' => $student->student_name,
                            'student_batch' => $student->batch->batch_name,
                            'student_class' => $student->student_class,
                            'admission_date' => date('d/m/y', strtotime($student->admission_date)),
                        ], $request->message[$key], ($request->custom[$key] ?? false)));
                    }
                }catch(\Exception $e) {
                    abort(501, 'Something is wrong!');
                }
            }
            return redirect()->route('custom_sms_send')->with('success', 'Message sent successfully!');
        }
        return redirect()->route('custom_sms_send')->with('success', 'Message sent failed!');
    }

    public function sms_buy()
    {
        // $sms_packages = SMS::where('is_active', true)->get();
        // return view('pages.sms.sms_buy', compact('sms_packages'));
        $ins_id = auth()->user()->institution_id ?? 0;
        return redirect()->away("https://sms.smartqb.info/validate_link.php?link_id=$ins_id&user_type=C");
    }

    public function sms_buy_store(Request $request)
    {
        if($request->ajax())
        {
            $request->validate([
                'id' => 'required',
                'price' => 'required',
                'validity' => 'required',
                'quantity' => 'required',
            ]);
            Session::put('sms_package', [
                'id' => $request->id,
                'price' => $request->price,
                'validity' => $request->validity,
                'quantity' => $request->quantity,
                'user_id' => auth()->user()->id,
            ]);
            return view('pages.sms.sms_buy_form');
        }

        $request->validate([
            'id' => 'required',
            'quantity' => 'required',
            'validity' => 'required',
            'price' => 'required',
        ]);

        SMSPurchase::create([
            'sms_package_id' => $request->id,
            'institution_id' => $this->institution_id(),
            'validity' => $request->validity,
            'quantity' => $request->quantity,
            'price' => $request->price,
        ]);

        $ins_sms = InsSms::where('institution_id', $this->institution_id())->first();
        if($ins_sms)
        {
            $ins_sms->update([
                'total_sms' => $ins_sms->total_sms + $request->quantity,
                'valid_till' => date('Y-m-d', strtotime('+' . $request->validity . ' day')),
            ]);
        }else {
            InsSms::create([
                'institution_id' => $this->institution_id(),
                'valid_till' => date('Y-m-d', strtotime('+' . $request->validity . ' day')),
                'total_sms' => $request->quantity,
            ]);
        }
        return redirect()->back()->with('created', 'SMS Purchase successfull!');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $sms_packages = SMS::all();
        return view('pages.admin.sms.create', compact('sms_packages'));
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
            'quantity' => 'required|min:0|numeric',
            'validity' => 'required|min:0|numeric',
            'price' => 'required|min:0|numeric',
        ]);
        SMS::create([
            'quantity'  => $request->quantity,
            'validity'  => $request->validity,
            'price'     => $request->price,
        ]);
        return redirect()->back()->with('created', 'SMS Package created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SMS  $sMS
     * @return \Illuminate\Http\Response
     */
    public function show(SMS $sMS)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\SMS  $sMS
     * @return \Illuminate\Http\Response
     */
    public function edit(SMS $sMS, $sms)
    {
        $sMS = SMS::findOrFail($sms);
        return view('pages.admin.sms.edit', compact('sMS'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\SMS  $sMS
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $sms)
    {
        $request->validate([
            'quantity' => 'required|min:0|numeric',
            'validity' => 'required|min:0|numeric',
            'price' => 'required|min:0|numeric',
        ]);
        $sMS = SMS::findOrFail($sms);
        $data = $request->all();
        if($request->active_status)
            $data['is_active'] = true;
        else
            $data['is_active'] = false;
        $sMS->update($data);
        return redirect()->back()->with('updated', 'SMS Package created!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SMS  $sMS
     * @return \Illuminate\Http\Response
     */
    public function destroy($sms)
    {
        $sMS = SMS::findOrFail($sms);
        $sMS->delete();
        return redirect()->back()->with('deleted', 'SMS Deleted!');
    }
}
