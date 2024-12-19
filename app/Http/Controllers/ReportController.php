<?php

namespace App\Http\Controllers;

use App\Models\Batch;
use App\Models\Payment;
use App\Models\Student;
use App\Models\StudentPayment;
use App\Traits\InstitutionTrait;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class ReportController extends Controller
{
    use InstitutionTrait;


    public function student_report(Request $request)
    {
        $students = null;
        $filter = false;
        if($request->filter == 'yes')
        {
            $filter = true;
            $students = Student::with(['batch'])->institution($this->institution_id());
            if($request->has('status'))
                $students = $students->active($request->status ?? null);
            if($request->batch_id)
                $students = $students->where('batch_id', $request->batch_id);
            if($request->admission_date)
                $students = $students->whereDate('admission_date', $request->admission_date);
            $students = $students->get();

        }
        $batches = Batch::select(['id', 'batch_name'])->institution($this->institution_id())->get();
        return view('pages.reports.student', compact('batches', 'filter', 'students'));
    }

    public function student_report_pdf(Request $request)
    {
        if($request->filter == 'yes')
        {
            $filter = true;
            $students = Student::with(['batch'])->institution($this->institution_id());
            if($request->has('status'))
                $students = $students->active($request->status ?? null);
            if($request->batch_id)
                $students = $students->where('batch_id', $request->batch_id);
            if($request->admission_date)
                $students = $students->whereDate('admission_date', $request->admission_date);
            $students = $students->get();
            // return view('pages.reports.student_pdf', compact('students'));
            $pdf = Pdf::loadView('pages.reports.student_pdf', compact('students'));
            return $pdf->download('student_report_'.date('dmY').'_'.substr(rand(), 5).'.pdf');
        }
    }

    /**
     * payment report
     */
    public function payment_report(Request $request)
    {
        $filter = false;
        $payments = null;

        $loggedInUser = auth()->user();
        $loggedInUserRoles = $loggedInUser->getRoleNames()->toArray();

        if($request->filter)
        {
            $filter = true;
            $payments = Payment::with(['student', 'student.batch', 'payment_received']);
            // batch type
            if($request->type)
            {
                $payments = $payments->whereRelation('student.batch', 'batch_type', $request->type);
            }

            // student batch id
            if($request->batch)
            {
                $payments = $payments->whereRelation('student', 'batch_id', $request->batch);
            }
            // student id
            if($request->student)
            {
                $payments = $payments->where('student_id', $request->student);
            }
            // payment date
            if($request->date)
            {
                $payments = $payments->whereDate('payment_date', $request->date);
            }
            // sorting
            if($request->sort)
            {
                $payments = $payments->orderBy('id', $request->sort);
            }

            if(in_array("Admin", $loggedInUserRoles)){
                $payments = $payments->institution($this->institution_id())->get();
            }
            else{
                $payments = $payments->where('created_by', $loggedInUser)->get();
            }
        }
        $students = Student::select(['id', 'student_name', 'batch_id'])->institution($this->institution_id())->get();
        $batches = Batch::select(['id', 'batch_name', 'batch_type'])->institution($this->institution_id())->get();
        return view('pages.reports.payment', compact('batches', 'students', 'filter', 'payments'));
    }

    public function payment_report_pdf(Request $request)
    {
        $loggedInUser = auth()->user();
        $loggedInUserRoles = $loggedInUser->getRoleNames()->toArray();

        if($request->filter)
        {
            $filter = true;
            $payments = Payment::with(['student', 'student.batch', 'payment_received']);
            // batch type
            if ($request->type) {
                $payments = $payments->whereRelation('student.batch', 'batch_type', $request->type);
            }
            // student batch id
            if ($request->batch) {
                $payments = $payments->whereRelation('student', 'batch_id', $request->batch);
            }
            // student id
            if ($request->student) {
                $payments = $payments->where('student_id', $request->student);
            }
            // payment date
            if ($request->date) {
                $payments = $payments->whereDate('payment_date', $request->date);
            }
            // sorting
            if ($request->sort) {
                $payments = $payments->orderBy('id', $request->sort);
            }

            if (in_array("Admin", $loggedInUserRoles)) {
                $payments = $payments->institution($this->institution_id())->get();
            } else {
                $payments = $payments->where('created_by', $loggedInUser)->get();
            }

            $pdf = Pdf::loadView('pages.reports.payment_pdf', compact('payments'));
            return $pdf->download('student_payment_'.date('dmy').'_'.substr(rand(), 5).'.pdf');
        }
    }

    public function student_payment(Request $request)
    {
        $student_payments = null;
        $filter = false;
        $monthly = false;
        if($request->filter)
        {
            $data = [];
            $filter = true;
            foreach(explode('&', $_SERVER['QUERY_STRING']) as $string)
            {
                $val = explode('=', $string);
                $key = $val[0];
                $val = $val[1];
                if(array_key_exists($key, $data))
                {
                    if(is_array($data[$key]))
                        array_push($data[$key], $val);
                    else
                        $data[$key] = [$data[$key], $val];
                } else
                    $data[$key] = $val;
            }
            $student_payments = StudentPayment::with(['student', 'student.batch']);
            if($request->batch)
                $student_payments = $student_payments->whereRelation('student', 'batch_id', $request->batch);
            if($request->student)
                $student_payments = $student_payments->where('student_id', $request->student);
            if($request->has('month')){
                if(is_array($data['month']))
                    $student_payments = $student_payments->whereIn('pay_month', $data['month']);
                else
                    $student_payments = $student_payments->where('pay_month', $request->month);
                $monthly=true;
            }
            $student_payments = $student_payments->get();
        }
        $students = Student::select(['id', 'student_name', 'batch_id'])->institution($this->institution_id())->get();
        $batches = Batch::select(['id', 'batch_name', 'batch_type'])->institution($this->institution_id())->get();
        return view('pages.reports.student_payment', compact('batches', 'students', 'student_payments', 'filter', 'monthly'));
    }
}
