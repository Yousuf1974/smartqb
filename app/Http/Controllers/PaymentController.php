<?php

namespace App\Http\Controllers;

use App\Models\Batch;
use App\Models\InsSms;
use App\Models\OnlinePayment;
use App\Models\Payment;
use App\Models\PaymentDetail;
use App\Models\Student;
use App\Models\StudentPayment;
use App\Notifications\PaymentNotification;
use App\Traits\AdminTrait;
use App\Traits\InstitutionTrait;
use App\Traits\SuperAdminTrait;
use App\Traits\UserTrait;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use DataTables;
use DB;

class PaymentController extends Controller
{
    use InstitutionTrait, AdminTrait, SuperAdminTrait, UserTrait;
    public function __construct()
    {
        // check/set permission
        $this->middleware('permission:payment-index')->only(['index', 'show']);
        $this->middleware('permission:payment-create')->only(['create', 'store', 'quick_payment']);
        $this->middleware('permission:payment-update')->only(['edit', 'update']);
        $this->middleware('permission:payment-destroy')->only(['destroy']);
    }

    public function dataTable()
    {
        $search = request()->search['value'];
        // this data for admin
        $payments = Payment::with(['student', 'student.batch'])
        ->whereRelation('student', 'institution_id', $this->institution_id());
        if(!empty($search)) {
            $payments = $payments->whereHas('student', function(Builder $query)use($search){
                return $query->where('student_name', 'LIKE', '%'.$search.'%');
            });
        }
        $payments = $payments->skip(request()->start)->take(request()->length)
        ->orderBy('id', 'desc')
        ->get();
        $user = $this->user();
        return DataTables::of($payments)
                ->addIndexColumn()
                ->editColumn('due', '{{$due ??  0}}')
                ->editColumn('discount', '{{$discount ?? 0}}')
                ->editColumn('payment_date', '{{date("d-M-y", strtotime($payment_date))}}')
                ->addColumn('action', function(Payment $payment)use($user){
                    if($user->canany(['user-index', 'user-create', 'user-update', 'user-destroy'])){
                        $output = '<div class="btn-group dropleft">';
                        $output .= '<button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                            Action <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu" role="menu">';
                        if($user->can('user-index'))
                            $output .= '<a class="dropdown-item view_btn" href="javascript:void(0)" data-link="'.route('payments.show', ['payment' => $payment->id]).'"><i class="fas fa-eye"></i> View</a>';
                        if($user->can('user-update'))
                            $output .= '<a class="dropdown-item edi_btn" href="javascript:void(0)" data-link="'.route('payments.edit', ['payment' => $payment->id]).'"><i class="fas fa-edit"></i> Edit</a>';
                        if($user->can('user-destroy'))
                        {
                            $output .= '<form id="destroy-'.$payment->id.'" method="POST" action="'.route('payments.destroy', ['payment' => $payment->id]).'">';
                            $output .= csrf_field() . method_field('DELETE');
                            $output .= '</form>';
                            $output .= '<button class="dropdown-item delete" data-id="'.$payment->id.'" type="button"><i class="fas fa-trash"></i> Delete</button>';
                        }
                        $output .= '</div></div>';
                    }
                    return $output ?? "N/A";
                })
                ->rawColumns(['action'])
                ->toJson();
        
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(request()->ajax()) 
        {
            return $this->dataTable();
        }
        return view('pages.payments.index');
    }

    // online payment list
    public function online_payment()
    {
        $online_payments = OnlinePayment::with(['student', 'student.batch'])
        ->whereIn('student_id', function($query){
            $query->select('id')->from('students')->where('institution_id', auth()->user()->institution_id);
        })
        ->orderBy('id', 'desc');
        if(request()->status)  {
            $online_payments = $online_payments->where('is_approved', true);
        }

        if(!request()->status)  {
            $online_payments = $online_payments->where('is_approved', !true);
        }        
        $online_payments = $online_payments->get();

        $pending_count = OnlinePayment::whereIn('student_id', function($query){
            $query->select('id')->from('students')->where('institution_id', auth()->user()->institution_id);
        })
        ->where('is_approved', false)
        ->count();

        $approved_count = OnlinePayment::whereIn('student_id', function($query){
            $query->select('id')->from('students')->where('institution_id', auth()->user()->institution_id);
        })
        ->where('is_approved', true)
        ->count();
        
        return view('pages.payments.online_payment', compact('online_payments', 'pending_count', 'approved_count'));
    }

    // online payment view 
    public function online_payment_view($id)
    {
        $online_payment = OnlinePayment::with(['student', 'student.batch', 'online_payment_details'])
        ->where('id', $id)
        ->first();
        return view('pages.payments.online_payment_view', compact('online_payment'));
    }

    // payment approved 
    public function approved($id)
    {
        $online_payment = OnlinePayment::with(['online_payment_details', 'student', 'student.batch'])->findOrFail($id);

        $this->authorize('online_payment_approved', [Payment::class, $online_payment]);

        DB::beginTransaction();
        try {
            $data = [];
            $last_payment = Payment::whereRelation('student', 'institution_id', $this->institution_id())->latest()->first();
            $data['ref_no'] = '001';
            if($last_payment) 
            {
                $ref_no = $last_payment->ref_no + 1;
                if($ref_no <= 9)
                    $data['ref_no'] = "00{$ref_no}";
                elseif($ref_no <= 99)
                    $data['ref_no'] = "0{$ref_no}";
                else
                    $data['ref_no'] = $ref_no;
            }            
            $data['payment_date'] = date('Y-m-d');
            $data['payment_year'] = $online_payment->payment_year;
            $data['student_id'] = $online_payment->student_id;
            $data['method'] = 2; // online
            $data['amount'] = $online_payment->total_amount;
            $data['total_amount'] = $online_payment->paid_amount;
            $data['is_paid'] = true;
            $data['created_by'] = auth()->user()->id;
            $data['note'] = 'Payment take from online!';
            $payment = Payment::create($data);

            // if($online_payment->student->batch->batch_type == 1) {
                foreach($online_payment->online_payment_details as $payment_detail) {
                    $data_detail = [];
                    $data_detail['payment_id'] = $payment->id;
                    $data_detail['amount'] = $payment_detail->amount;
                    $data_detail['discount'] = 0;
                    $data_detail['due'] = 0;
                    $data_detail['month'] = $payment_detail->month;
                    $payment_details = PaymentDetail::create($data_detail);

                    $year = $payment_detail->payment_year;
                    $month = $payment_detail->month;
                    $student_id = $payment->student_id;
                    $batch_fee = $online_payment->student->batch->batch_fee;
                    $paid_amount = $payment_detail->amount;
                    $student_payment = StudentPayment::where('student_id', $student_id)
                                        ->where('pay_year', $year)
                                        ->where('pay_month', $month)
                                        ->first();
                    if(is_null($student_payment)) 
                    {
                        StudentPayment::create([
                            'student_id' => $student_id,
                            'pay_year' => $year,
                            'pay_month' => $month,
                            'need_to_pay' => $batch_fee,
                            'pay_amount' => $paid_amount ?? 0,
                            'pay_discount' =>0,
                            'pay_due' => 0,
                            'is_paid' => $batch_fee == $paid_amount,
                        ]);
                    } 
                    else 
                    {
                        $student_payment->pay_amount = ($paid_amount ?? 0) + $student_payment->pay_amount;
                        $student_payment->is_paid = $student_payment->pay_amount + $student_payment->pay_discount == $batch_fee &&  $student_payment->pay_due  == 0;
                        $student_payment->save();
                    }
                }
            // }
            $online_payment->is_approved = true;
            $online_payment->save();
            DB::commit();
        }catch(\Exception $e) {
            DB::rollback();
            abort(505, "Something went worng!");
            return;
        }
        return redirect()->back()->with('success', 'Payment approved successfull');
    }

    // online payment delete
    public function online_payment_delete(Request $request, $id) 
    {
        $online_payment = OnlinePayment::findOrFail($id);
        $this->authorize('online_payment_delete', [Payment::class, $online_payment]);
        $online_payment->delete();
        return redirect()->back()->with('deleted', 'Payment deleted successfull!');
    }

    /**
     * Show the form for quick payment
     * @return \Illuminate\Http\Response
     */
    public function quick_payment(Request $request) 
    {
        // check authorized action
        $this->authorize('create', Payment::class);

        if($request->ajax() && $request->has('query')) 
        {
            $search_query = $request->input('query');
            $year = $request->input('year');
            // search student
            $students = Student::with('batch')
                    ->where('institution_id', $this->institution_id())
                    ->where('is_active', true);
                if(is_string($search_query)) {
                    $students = $students->where('student_name', 'LIKE', '%'. $search_query . '%')
                    ->orWhere(function(Builder $query) use($search_query){
                        return $query->whereRelation('batch', 'batch_name', 'LIKE', '%'. $search_query . '%');
                    })
                    ->where('institution_id', $this->institution_id());
                }

                if(is_numeric($search_query)) {
                    $students = $students->orWhere(function(Builder $query)use($search_query){
                        $query->orWhere('student_contact', $search_query)
                        ->orWhere('guardian_contact', $search_query);
                    })->where('institution_id', $this->institution_id());           
                }

            $students = $students->get();
            
            return view('pages.payments.search_list', compact('students', 'year'));
        }

        if($request->ajax() && $request->has('student_id')) 
        {
            $year = $request->input('year');
            $months = $request->input('months');
            $student = Student::with(['batch'])
                    ->where('is_active', true)
                    ->find($request->input('student_id'));
            if($student->batch->batch_type == 2 && $student->is_paid_this_month($year))
            {
                return view('pages.payments.payment_complete', compact('year', 'student'));
            }
            return view('pages.payments.quick_payment_form', compact('student', 'year', 'months'));
        }
        $year = date('Y');
        return view('pages.payments.quick_payment', compact('year'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        // check authorized action
        $this->authorize('create', Payment::class);

        // for student select in add payment
        if($request->ajax() && $request->has('batch_id')) {
            $students = Student::where('batch_id', $request->batch_id)
                        ->where('institution_id', $this->institution_id())
                        ->where('is_active', true)->get(['id', 'student_name']);
            return response()->json(["students" => $students]);
        }

        // for student serach in add payment
        $student = null;
        $year = date('Y');
        if(!$request->ajax() && ($request->has('batch_id') && $request->has('student_id')) && $request->has('phone')) {
            $student = Student::with(['batch', 'payments', 'institution.ins_sms'])->where('institution_id', $this->institution_id());
            if($request->phone)
                $student = $student->where('student_contact', $request->phone);
            if($request->batch_id && $request->student_id){
                $student = $student->where('institution_id', $this->institution_id())
                        ->where('id', $request->student_id);
            }
            $student = $student->first();
            $year = $request->year;
        }

        $batches = Batch::where('is_active', true)->where('institution_id', $this->institution_id())->get(['id', 'batch_name']);
        return view('pages.payments.create', compact('batches', 'student', 'year'));
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
        $this->authorize('create', Payment::class);

        if($request->batch_type == 1) 
        {
            $request->validate([
                'student_id' => 'required|numeric',
                'batch_type' => 'required|numeric',
                'payment_date' => 'required',
                'select_month' => 'required|array',
                'amount' => 'required', 
                'sub_amount' => 'required|numeric',
                'sub_discount' => 'nullable|numeric',
                'sub_due' => 'nullable|numeric',
                'total_amount' => 'nullable|numeric',
            ]);
        }

        if($request->batch_type == 2) 
        {
            $request->validate([
                'student_id' => 'required|numeric',
                'batch_type' => 'required|numeric',
                'payment_date' => 'required',
                'amount' => 'required|numeric',
                'total_amount' => 'required|numeric',
            ]);
        }

        $student = Student::with(['batch', 'institution'])->findOrFail($request->student_id);

        DB::beginTransaction();
        try {
            $data = $request->all();
            // get last payment 
            $last_payment = Payment::whereRelation('student', 'institution_id', $this->institution_id())->latest()->first();
            $data['ref_no'] = '001';
            if($last_payment) 
            {
                $ref_no = $last_payment->ref_no + 1;
                if($ref_no <= 9)
                    $data['ref_no'] = "00{$ref_no}";
                elseif($ref_no <= 99)
                    $data['ref_no'] = "0{$ref_no}";
                else
                    $data['ref_no'] = $ref_no;
            }

            $data['created_by'] = \Auth::id(); // set creator id | uesr id
            if($request->batch_type == 1) 
            {
                $data['amount'] = $data['sub_amount'];
                $data['discount'] = $data['sub_discount'];
                $data['due'] = $data['sub_due'];
            }
            $data['is_paid'] = ($data['due'] ?? 0) == 0;
            $payment = Payment::create($data); // payment collection create
            
            if($request->batch_type == 1) 
            {
                
                // insert payment details
                foreach($request->select_month as $month) {
                    $paid_amount = ($request->amount[$month] ?? 0) - (($request->discount[$month] ?? 0) + ($request->due[$month] ?? 0));
                    // create or store payment detail collection
                    PaymentDetail::create([
                        'payment_id' => $payment->id,
                        'amount' => $paid_amount,
                        'discount' => $request->discount[$month] ?? 0,
                        'due' => $request->due[$month] ?? 0,
                        'month' => $month,
                    ]);

                    // create student payment collection
                    $year = $request->payment_year;
                    $student_payment = StudentPayment::where('student_id', $request->student_id)
                                        ->where('pay_year', $year)
                                        ->where('pay_month', $month)
                                        ->first();
                    if(is_null($student_payment)) 
                    {
                        StudentPayment::create([
                            'student_id' => $request->student_id,
                            'pay_year' => $year,
                            'pay_month' => $month,
                            'need_to_pay' => $request->batch_fee,
                            'pay_amount' => $paid_amount ?? 0,
                            'pay_discount' => $request->discount[$month] ?? 0,
                            'pay_due' => $request->due[$month] ?? 0,
                            'is_paid' => $request->batch_fee == $paid_amount + ($request->discount[$month] ?? 0) &&  ($request->due[$month] ?? 0) == 0,
                        ]);
                    } 
                    else 
                    {
                        $student_payment->update([
                            'pay_amount' => ($paid_amount ?? 0) + $student_payment->pay_amount,
                            'pay_discount' => ($request->discount[$month] ?? 0) + $student_payment->pay_discount,
                            'pay_due' => ($request->due[$month] ?? 0),
                        ]);
                        $student_payment->is_paid = $student_payment->pay_amount + $student_payment->pay_discount == $request->batch_fee &&  $student_payment->pay_due  == 0;
                        $student_payment->save();
                    }
                }
            }
            elseif($request->batch_type == 2)
            {
                $paid_amount = ($request->amount ?? 0) - ($request->discount ?? 0);
                // payment detail collection create
                PaymentDetail::create([
                    'payment_id' => $payment->id,
                    'amount' => $paid_amount,
                    'discount' => $request->discount ?? 0,
                ]);
                // student payment collection create
                $year = date('Y');
                $student_payment = StudentPayment::where('student_id', $request->student_id)
                                        ->where('pay_year', $year)
                                        ->first();
                if(is_null($student_payment)) 
                {
                    StudentPayment::create([
                        'student_id' => $request->student_id,
                        'pay_year' => $year,
                        'need_to_pay' => $request->batch_fee,
                        'pay_amount' => $paid_amount,
                        'pay_discount' => $request->discount ?? 0,
                        'is_paid' => $request->batch_fee == ($paid_amount ?? 0) + ($request->discount ?? 0),
                    ]);
                } 
                else 
                {
                    $student_payment->update([
                        'pay_amount' => ($request->amount ?? 0) + $student_payment->pay_amount,
                        'pay_discount' => ($request->discount ?? 0) + $student_payment->pay_discount,
                        'is_paid' => $request->batch_fee == ($paid_amount ?? 0) + ($request->discount ?? 0),
                    ]);
                }
            }
        
            DB::commit();
        }catch(\Exception $e) {
            DB::rollback();
            abort(505, "Something went worng!");
            return;
        }
        
        if($request->send_sms && valid_sms()) {
            $month_list = '';
            if($student->batch->batch_type == 1) {
                $payment_months = $payment->payment_details;
                foreach($payment_months as $payment_details) {
                    $month_list .= MONTH_LIST[$payment_details->month] . ',';
                }
                $month_list = substr($month_list, 0, -1) . ' (' . $payment->payment_year . ')';
            }
            
            
            $result = $student->notify(new PaymentNotification([
                'ins_name' => $student->institution->name,
                'student_name' => $student->student_name,
                'student_batch' => $student->batch->batch_name,
                'payment_ref' => $payment->ref_no,
                'payment_date' => date('d/m/y', strtotime($payment->payment_date)),
                'paid_amount' => number_format($payment->total_amount, 2),
                'total_amount' => number_format($payment->amount, 2),
                'total_discount' => $payment->discount,
                'total_due' => $payment->due,
                'received_by' => $payment->payment_received->name,
                'per_month_fee' => $student->batch->batch_fee,
                'month_list' => $month_list,
            ]));
        }
        
        return redirect()->route('payments.create')->with('created', 'Payment create successfully!');

    }

    /**
     * Store a newly created resource 
     */
    public function quick_store(Request $request)
    {
        
        // check authorized action
        $this->authorize('create', Payment::class);
        
        if($request->batch_type == 1) 
        {
            $request->validate([
                'student_id' => 'required|numeric',
                'batch_type' => 'required|numeric',
                'payment_year' => 'required',
                'select_month' => 'required|array',
                'amount' => 'required',
                'need_to_pay' => 'required|numeric',
            ]);
        }

        if($request->batch_type == 2) 
        {
            $request->validate([
                'student_id' => 'required|numeric',
                'batch_type' => 'required|numeric',
                'payment_year' => 'required',
                'amount' => 'required|numeric',
            ]);
        }

        // get student
        $student = Student::with(['batch', 'institution'])->findOrFail($request->student_id);

        DB::beginTransaction();
        try{            
            $data = $request->all();
            // get last payment 
            $last_payment = Payment::whereRelation('student', 'institution_id', $this->institution_id())->latest()->first();
            $data['ref_no'] = '001';
            if($last_payment) 
            {
                $ref_no = $last_payment->ref_no + 1;
                if($ref_no <= 9)
                    $data['ref_no'] = "00{$ref_no}";
                elseif($ref_no <= 99)
                    $data['ref_no'] = "0{$ref_no}";
                else
                    $data['ref_no'] = $ref_no;
            }
        
            $data['payment_date'] = today();
            $data['total_amount'] = (double)($request->amount ?? 0);

            if($student->batch->batch_type == 1) {
                $total_need_to_pay = $request->need_to_pay;
                if($total_need_to_pay >= ($request->amount ?? 0)) {
                    $data['is_paid'] = true;
                }else {
                    $data['is_paid'] = false;
                }
            }else {
                $data['is_paid'] = true;
            }

            $data['created_by'] = \Auth::id(); // assign user id, who's created this payment

            // create payment
            $payment = Payment::create($data);

            if($student->batch->batch_type == 1) {

                foreach($request->month_fee as $month => $month_fee) {
                    // create payment details
                    PaymentDetail::create([
                        'payment_id' => $payment->id,
                        'amount' => $month_fee,
                        'month' => $month,
                    ]);

                    // create student payment collection
                    $year = $request->payment_year;
                    $student_payment = StudentPayment::where('student_id', $request->student_id)
                                        ->where('pay_year', $year)
                                        ->where('pay_month', $month)
                                        ->first();
                    if(is_null($student_payment)) 
                    {
                        StudentPayment::create([
                            'student_id' => $request->student_id,
                            'pay_year' => $year,
                            'pay_month' => $month,
                            'need_to_pay' => $month_fee ?? 0,
                            'pay_amount' => $month_fee ?? 0,
                            'is_paid' => true,
                        ]);
                    } 
                    else 
                    {
                        $pay_amount = ($month_fee ?? 0) + $student_payment->pay_amount;
                        
                        $student_payment->update([
                            'pay_amount' => $pay_amount,
                            'pay_due' => $pay_amount == $student_payment->need_to_pay ? 0 : $student_payment->due - $month_fee,
                        ]);
                        $student_payment->is_paid = $student_payment->pay_amount == $student_payment->need_to_pay &&  $student_payment->pay_due  == 0;
                        $student_payment->save();
                    }
                }
            } else {
                // create payment details
                PaymentDetail::create([
                    'payment_id' => $payment->id,
                    'amount' => $payment->amount,
                    'discount' => $payment->discount,
                    'month' => null,
                ]);

                    $year = $request->payment_year;
                    $student_payment = StudentPayment::where('student_id', $request->student_id)
                                        ->where('pay_year', $year)
                                        ->first();
                    if(is_null($student_payment)) 
                    {
                        StudentPayment::create([
                            'student_id' => $request->student_id,
                            'pay_year' => $year,
                            'need_to_pay' => $request->batch_fee ?? 0,
                            'pay_amount' => $request->amount ?? 0,
                            'is_paid' => $request->batch_fee == $request->amount,
                            'pay_due' => $request->amount == $request->batch_fee ? 0 : $request->batch_fee - $request->amount,
                        ]);
                    } 
                    else 
                    {
                        $pay_amount = $student_payment->pay_amount + $request->amount ?? 0;
                        $student_payment->update([
                            'pay_amount' => $pay_amount,
                            'pay_due' => $pay_amount == $request->batch_fee ? 0 : $student_payment->pay_due - $request->amount,
                        ]);
                        $student_payment->is_paid = $student_payment->pay_amount == $student_payment->need_to_pay &&  $student_payment->pay_due  == 0;
                        $student_payment->save();
                    }
            }
            DB::commit();
        }catch(\Exception $e) {
            DB::rollback();
            abort(505, "Something went wrong!");
            return;
        }

        // send sms if has
        if(valid_sms() && $request->send_sms)
        {
            $month_list = '';
            if($student->batch->batch_type == 1) {
                $payment_months = $payment->payment_details;
                foreach($payment_months as $payment_details) {
                    $month_list .= MONTH_LIST[$payment_details->month] . ',';
                }
                $month_list = substr($month_list, 0, -1) . ' (' . $payment->payment_year . ')';
            }
            
            $student->notify(new PaymentNotification([
                'ins_name' => $student->institution->name,
                'student_name' => $student->student_name,
                'student_batch' => $student->batch->batch_name,
                'payment_ref' => $payment->ref_no,
                'payment_date' => date('d/m/y', strtotime($payment->payment_date)),
                'paid_amount' => $payment->total_amount,
                'total_amount' => $payment->amount,
                'total_discount' => $payment->discount,
                'total_due' => $payment->due,
                'received_by' => $payment->payment_received->name,
                'per_month_fee' => $student->batch->batch_fee,
                'month_list' => $month_list,
            ]));
        }
        

        return response()->json([
            'message'   => 'Payment create succssfully!',
            'success'   => true,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $payment = Payment::with(['payment_details', 'student', 'student.batch'])->find($id);
        return view('pages/payments/view', compact('payment'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $payment = Payment::with(['student', 'student.batch'])
                    ->whereRelation('student', 'institution_id', $this->institution_id())
                    ->find($id);
        return view('pages.payments.edit', compact('payment'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if($request->batch_type == 1) 
        {
            $request->validate([
                'student_id' => 'required|numeric',
                'batch_type' => 'required|numeric',
                'payment_date' => 'required',
                'select_month' => 'required|array',
                'amount' => 'required', 
                'sub_amount' => 'required|numeric',
                'sub_discount' => 'nullable|numeric',
                'sub_due' => 'nullable|numeric',
                'total_amount' => 'nullable|numeric',
            ]);
        }

        if($request->batch_type == 2) 
        {
            $request->validate([
                'student_id' => 'required|numeric',
                'batch_type' => 'required|numeric',
                'payment_date' => 'required',
                'amount' => 'required|numeric',
                'total_amount' => 'required|numeric',
            ]);
        }

        $payment = Payment::with(['student', 'student.batch', 'payment_details'])->find($id);
        $this->authorize('update', $payment); // authorize

        DB::beginTransaction();
        try{
            $data = $request->all();
            $data['updated_by'] = \Auth::id(); // set creator id | uesr id
            if($request->batch_type == 1) 
            {
                $data['amount'] = $data['sub_amount'];
                $data['discount'] = $data['sub_discount'];
                $data['due'] = $data['sub_due'];
            }
            $data['is_paid'] = ($data['due'] ?? 0) == 0;

            // update student payments table
            foreach($payment->payment_details as $payment_detail){
                $student_payment = StudentPayment::where('pay_year', $payment->payment_year);
                if($payment->student->batch->batch_type == 1)
                    $student_payment->where('pay_month', $payment_detail->month);
                elseif($payment->student->batch->batch_type == 2)
                    $student_payment->whereNull('pay_month');
                $student_payment = $student_payment->where('student_id', $payment->student_id)->first();
                if($student_payment) {
                    $student_payment->update([
                        'pay_amount' => ($student_payment->pay_amount ?? 0) - ($payment_detail->amount ?? 0),
                        'pay_discount' => ($student_payment->pay_discount ?? 0) - ($payment_detail->discount ?? 0),
                        'pay_due' => ($student_payment->pay_due ?? 0) - ($payment_detail->due ?? 0),
                        'is_paid' => false,
                    ]);
                }
                // delete payment detail
                $payment_detail->delete();
            }

            // update payment collection
            $payment->update($data);

            if($payment->student->batch->batch_type == 1)
            {
                foreach($request->select_month as $month) {
                    // create payment details
                    $paid_amount = ($request->amount[$month] ?? 0) - (($request->discount[$month] ?? 0) + ($request->due[$month] ?? 0));
                    // create or store payment detail collection
                    PaymentDetail::create([
                        'payment_id' => $payment->id,
                        'amount' => $paid_amount,
                        'discount' => $request->discount[$month] ?? 0,
                        'due' => $request->due[$month] ?? 0,
                        'month' => $month,
                    ]);            

                    /**
                     * check student payment is exists, if not exists
                     * then create a new collection or update the existing data
                     */
                    $year = $payment->payment_year;
                    $student_payment = StudentPayment::where('student_id', $payment->student_id)
                                        ->where('pay_year', $year)
                                        ->where('pay_month', $month)
                                        ->first();  
                    if($student_payment) {     
                        $student_payment->update([
                            'pay_amount' => ($paid_amount ?? 0) + $student_payment->pay_amount,
                            'pay_discount' => ($request->discount[$month] ?? 0) + $student_payment->pay_discount,
                            'pay_due' => ($request->due[$month] ?? 0),
                        ]);
                        
                    }else {
                        // create student payment details
                        $student_payment = StudentPayment::create([
                            'student_id' => $payment->student_id,
                            'pay_year' => $year,
                            'pay_month' => $month,
                            'need_to_pay' => $payment->student->batch->batch_fee,
                            'pay_amount' => $paid_amount,
                            'pay_discount' => $request->discount[$month] ?? 0,
                            'pay_due' => $request->due[$month] ?? 0,
                        ]);
                    }

                    // payment paid update
                    $student_payment->is_paid = $student_payment->pay_amount + $student_payment->pay_discount == $request->batch_fee &&  $student_payment->pay_due  == 0;
                    $student_payment->save(); 
                     
                }
            }
            elseif($payment->student->batch->batch_type == 2)
            {
                $paid_amount = ($request->amount ?? 0) - ($request->discount ?? 0);
                // payment detail collection create
                PaymentDetail::create([
                    'payment_id' => $payment->id,
                    'amount' => $paid_amount,
                    'discount' => $request->discount ?? 0,
                ]);

                $year = $payment->payment_year;
                $student_payment = StudentPayment::where('student_id', $payment->student_id)
                                    ->where('pay_year', $year)
                                    ->first();
                $student_payment->update([
                    'pay_amount' => ($request->amount ?? 0) + $student_payment->pay_amount,
                    'pay_discount' => ($request->discount ?? 0) + $student_payment->pay_discount,
                    'is_paid' => $request->batch_fee == ($paid_amount ?? 0) + ($request->discount ?? 0),
                ]); 
                $student_payment->is_paid = $student_payment->pay_amount == $student_payment->need_to_pay &&  $student_payment->pay_due  == 0;
                $student_payment->save();   
            }
            DB::commit();
            return response()->json(['success' => true, 'text' => 'Payment updated successful!']);
        }catch(\Exception $e) {
            DB::rollback();
            abort(505, 'Something went worng!');
            return;
        }
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, Payment $payment)
    {
        if(!$request->password) {
            abort(401, 'Please enter password');
        }

        if(!Hash::check($request->password, $this->user()->password)) {
            abort(401, "Wrong password!");
        }

        $this->authorize('delete', $payment);

        DB::beginTransaction();
        try{
            foreach($payment->payment_details as $payment_detail) {
                $student_payment = $payment->student->get_student_payment_by_month_year($payment->payment_year, $payment_detail->month);
                if($student_payment)
                {
                    $student_payment->update([
                        'pay_amount' => $student_payment->pay_amount - $payment_detail->amount,
                        'pay_discount' => ($student_payment->pay_discount ?? 0) - ($payment_detail->discount ?? 0),
                    ]);

                    $student_payment->is_paid = false;
                    $student_payment->pay_due = ($student_payment->need_to_pay ?? 0) - ($student_payment->pay_amount ?? 0 + $student_payment->pay_discount ?? 0);
                    $student_payment->save();
                    if(
                        ($student_payment->need_to_pay == $student_payment->pay_due) && !$student_payment->is_paid &&
                        $student_payment->pay_amount == 0 
                    ){
                        $student_payment->delete();
                    }
                }
            }
            $payment->delete();
            DB::commit();
        }catch(\Exception $e) {
            DB::rollback();
            abort(505, 'Something went wrong!');
        }
        return response()->json(['success' => true, 'message' => 'Payment delete successfull!']);
        
    }
}
