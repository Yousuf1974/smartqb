<?php

namespace App\Http\Controllers;

use App\Models\OnlinePayment;
use App\Models\OnlinePaymentDetails;
use App\Models\Student;
use App\Models\StudentPayment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use DB;
use Barryvdh\DomPDF\Facade\Pdf;

class StudentPanelController extends Controller
{
    public function index()
    {
        if(auth()->guard('student')->check())
        {
            $student = Student::with(['batch', 'institution'])->where('id', auth()->guard('student')->user()->id)->firstOrFail();
            if($student->user_profile){
                $user_profile_path = Storage::url("students/".$student->user_profile);
                if(file_exists(public_path("storage/students/".$student->user_profile))){
                    $user_profile = $user_profile_path;
                }else {
                    $user_profile = asset("/dist/img/profile_avatar.png");
                }
            }else
                $user_profile = asset("/dist/img/profile_avatar.png");
    
            return view('pages.student_panel.index', compact('student', 'user_profile'));
        }
        
        
    }

    public function payment(Request $request)
    {
        $student = Student::with(['batch', 'institution'])->where('id', auth()->guard('student')->user()->id)->firstOrFail();
        return view('pages.student_panel.payment', compact('student'));
    }

    public function payment_store(Request $request) 
    {
        
        if(auth()->guard('student')->user()->batch->batch_type == 1) {
            $request->validate([
                'monthly_fee' => 'required',
                'year' => 'required|numeric',
                'month' => 'required|array|min:1',
                'paid_amount' => 'required|numeric',
                'transaction_id' => 'required',
            ]);

            DB::beginTransaction();
            try {
                $reference = substr(rand(), 0, 6);
                $check_if_exists = OnlinePayment::where('reference', $reference)->first();
                while($check_if_exists) {
                    $reference = substr(rand(), 0, 6);
                    $check_if_exists = OnlinePayment::where('reference', $reference)->first();
                }
    
                $data = [
                    'reference' => $reference,
                    'payment_year' => $request->year,
                    'student_id' => auth()->guard('student')->user()->id,
                    'total_amount' => $request->total_amount,
                    'paid_amount' => $request->paid_amount,
                    'phone_number' => $request->phone_number,
                    'transaction_id' => $request->transaction_id,
                ];
    
                $online_payment = OnlinePayment::create($data);
    
                foreach($request->month_fee as $month => $fee) {
                    OnlinePaymentDetails::create([
                        'online_payment_id' => $online_payment->id,
                        'payment_year' => $request->year,
                        'month' => $month, 
                        'amount' => $fee,
                    ]);
                }
                DB::commit();
            }catch(\Exception $e) {
                DB::rollback();
                abort(505, "Something went worng!");
                return;
            }
        }else {
            $request->validate([
                'amount' => 'required',
                'transaction_id' => 'required',
                'phone_number' => 'required',
            ]);

            DB::beginTransaction();
            try{
                $reference = substr(rand(), 0, 6);
                $check_if_exists = OnlinePayment::where('reference', $reference)->first();
                while($check_if_exists) {
                    $reference = substr(rand(), 0, 6);
                    $check_if_exists = OnlinePayment::where('reference', $reference)->first();
                }
    
                $data = [
                    'reference' => $reference,
                    'payment_year' => date("Y"),
                    'student_id' => auth()->guard('student')->user()->id,
                    'total_amount' => $request->amount,
                    'paid_amount' => $request->amount,
                    'phone_number' => $request->phone_number,
                    'transaction_id' => $request->transaction_id,
                ];    
                $online_payment = OnlinePayment::create($data);
                OnlinePaymentDetails::create([
                    'online_payment_id' => $online_payment->id,
                    'payment_year' => date('Y'),
                    'month' => null, 
                    'amount' => $request->amount,
                ]);
                DB::commit();
            }catch(\Exception $e) {
                DB::rollback();
                abort(505, "Something went worng!");
                return;
            }
        }
        return redirect()->route('student_panel.invoice', ['reference' => $online_payment->reference])->with('success', 'Payment create successful!');        
    }

    public function invoice($reference) 
    {
        $online_payment = OnlinePayment::with(['online_payment_details'])
        ->where('student_id', auth()->guard('student')->user()->id)
        ->where('reference', $reference)->first();
        return view('pages.student_panel.online_invoice', compact('online_payment'));
    }

    // download pdf invoice
    public function invoice_download($reference)
    {
        $online_payment = OnlinePayment::with(['online_payment_details'])
        ->where('student_id', auth()->guard('student')->user()->id)
        ->where('reference', $reference)->first();
        $pdf = Pdf::loadView('pages.student_panel.invoice_pdf', compact('online_payment'));
        return $pdf->download('invoice_'.date('dmY').'_'.$online_payment->reference.'.pdf');
    }

    public function payment_history()
    {
        if(auth()->guard('student')->user()->batch->batch_type == 1){
            $student_payments = StudentPayment::where("student_id", auth()->guard('student')->user()->id)->get();
        }else {
            $student_payments = StudentPayment::where("student_id", auth()->guard('student')->user()->id)->first();
        }
        $payment_histories = OnlinePayment::with(['student'])
        ->where('student_id', auth()->guard('student')->user()->id)
        ->where('is_approved', false)
        ->orderBy('id', 'desc')
        ->get();
        return view('pages.student_panel.payment_history', compact('student_payments', 'payment_histories'));
    }

    public function login_page(Request $request)
    {
        return view('auth.student_login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'unique_id' => 'required|integer',
            'pin' => 'required|integer',
        ]);
        $student = Student::where('unique_id', $request->unique_id)->first();
        if(!$student){
            return back()->with('message', 'Unique Id is invalid!');
        }elseif($student->pin != $request->pin) {
            return back()->with('message', 'Pin is invalid!');
        }else {
            Auth::guard('student')->login($student);
            return redirect()->route('student_panel');
        }        
        return back()->withInput($request->only('unique_id'));
    }

    public function logout(Request $request)
    {
        Auth::guard('student')->logout(); 
        $request->session()->invalidate();    
        $request->session()->regenerateToken();    
        return redirect()->route('student.login');
    }
}
