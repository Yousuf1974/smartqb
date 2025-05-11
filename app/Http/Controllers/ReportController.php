<?php

namespace App\Http\Controllers;

use App\Models\Batch;
use App\Models\Payment;
use App\Models\Student;
use App\Models\StudentPayment;
use App\Traits\InstitutionTrait;
use Illuminate\Database\Eloquent\Collection;
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
                $payments = $payments->where('created_by', $loggedInUser->id)->get();
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
                $payments = $payments->where('created_by', $loggedInUser->id)->get();
            }

            $pdf = Pdf::loadView('pages.reports.payment_pdf', compact('payments'));
            return $pdf->download('student_payment_'.date('dmy').'_'.substr(rand(), 5).'.pdf');
        }
    }

    public function student_payment(Request $request)
    {
        $student_payments = collect();
        $filter = false;
        $monthly = false;
        $yearly = false;

        if ($request->filter) {
            $request->validate([
                'batch' => 'required|exists:batches,id',
                'student' => 'nullable|exists:students,id',
                'month' => 'nullable',
                'year' => 'nullable|integer',
                'payment_type' => 'required|string|in:paid,due,unpaid',
            ], [
                'batch.required' => 'Please select a batch',
                'batch.exists' => 'Batch not found',
                'student.exists' => 'Student not found',
                'payment_type.required' => 'Please select a payment type',
                'payment_type.in' => 'Invalid payment type',
            ]);

            $filter = true;
            $batchId = $request->batch;
            $studentId = $request->student;
            $month = $request->month;
            $year = $request->year;
            $paymentType = $request->payment_type;

            // Detect batch type
            $batch = Batch::find($batchId);
            $isYearlyBatch = $batch && $batch->batch_type == 2;

            if ($paymentType == 'unpaid') {
                // Step 1: Get all students in the selected batch
                $allBatchStudents = Student::where('batch_id', $request->batch)
                    ->where('institution_id', $this->institution_id());

                if ($studentId) {
                    $allBatchStudents = $allBatchStudents->where('id', $studentId);
                }

                $allBatchStudents = $allBatchStudents->get();

                // Step 2: Get student IDs who have any payment record for the selected month
                $query = StudentPayment::whereIn('student_id', $allBatchStudents->pluck('id'))
                    ->where('is_paid', '>=', 0); // consider both paid and due

                if ($isYearlyBatch && $year) {
                    $query->where('pay_year', $year);
                } elseif (!$isYearlyBatch && $request->filled('month')) {
                    $query->where('pay_month', $month);
                }

                $paidOrDueStudentIds = $query->pluck('student_id')->unique();

                // Step 3: Get students who didn't pay at all for that month
                $unpaidStudents = $allBatchStudents->whereNotIn('id', $paidOrDueStudentIds);

                // Step 4: Simulate fake payment records
                $simulatedPayments = $unpaidStudents->map(function ($student)  use ($month, $year, $isYearlyBatch) {
                    $fakePayment = new StudentPayment([
                        'student_id' => $student->id,
                        'pay_year' => $isYearlyBatch ? $year : null,
                        'pay_month' => $isYearlyBatch ? null : $month,
                        'need_to_pay' => 0,
                        'pay_amount' => 0,
                        'pay_discount' => 0,
                        'pay_due' => 0,
                        'is_paid' => -1,
                    ]);

                    $fakePayment->setRelation('student', $student);

                    return $fakePayment;
                });

                $student_payments = new Collection($simulatedPayments);
            } else {
                // For 'paid' and 'due'
                $query = StudentPayment::with(['student', 'student.batch'])
                    ->whereHas('student', function ($q) use ($batchId, $studentId) {
                        $q->where('institution_id', $this->institution_id())
                            ->where('batch_id', $batchId);

                        if ($studentId) {
                            $q->where('id', $studentId);
                        }
                    });

                if ($isYearlyBatch && $year) {
                    $query->where('pay_year', $year);
                    $monthly = false;
                    $yearly = true;
                } elseif (!$isYearlyBatch && $request->filled('month')) {
                    $query->where('pay_month', $month);
                    $monthly = true;
                    $yearly = false;
                }

                if ($paymentType === 'paid') {
                    $query->where('is_paid', 1);
                } elseif ($paymentType === 'due') {
                    $query->where('is_paid', 0);
                }

                $student_payments = $query->get();
            }
        }

        $batches = Batch::select(['id', 'batch_name', 'batch_type', 'batch_year'])
            ->institution($this->institution_id())
            ->orderBy('batch_year')
            ->get();

        $availableYear = $batches->pluck('batch_year')->unique()->values()->toArray();

        return view('pages.reports.student_payment', compact(
            'batches',
            'student_payments',
            'filter',
            'monthly',
            'yearly',
            'availableYear'
        ));
    }

}
