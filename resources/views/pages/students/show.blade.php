<table class="table table-striped">
    <tbody>
        <tr>
            <td colspan="3" class="text-center">
                <img src="{{$user_profile}}" width="80" height="80" class="img-rounded elevation-2" alt="User Image">
            </td>
        </tr>
        <tr>
            <td>Name: {{$student->student_name}}</td>
            <td>Admission: {{date('d-M,y', strtotime($student->admission_date))}}</td>
            <td>Class: {{$student->student_class ?? "N/A"}}</td>
        </tr>
        <tr>
            <td>Student Contact: {{$student->student_contact ?? "N/A"}}</td>
            <td>Guardian Contact: {{$student->guardian_contact ?? "N/A"}}</td>
            <td>College: {{$student->clg_name ?? "N/A"}}</td>
        </tr>
        <tr>
            <td>Batch: {{$student->batch->batch_name ?? "N/A"}}</td>
            <td>Institution: {{$student->institution->name ?? "N/A"}}</td>
            <td>Active Status: {{$student->is_active ? "Active" : "Deactive"}}</td>
        </tr>
        <tr>
            <td>Note</td>
            <td colspan="2">{{$student->note_address ?? "N/A"}}</td>
        </tr>
    </tbody>
</table>

<h5 class="text-center text-success">Course Fee Details(Monthly/Contract)</h5>

@if($student->student_payment_details->isNotEmpty())
    {{-- student payment details --}}
    @if($student->batch->batch_type == 1)
    <table class="table table-bordered table-sm text-center">
        <thead>
            <tr>
                <th>Month-Year</th>
                <th>Payable Amount</th>
                <th>Discount</th>
                <th>Due</th>
                <th>Paid Amount</th>
            </tr>
        </thead>
        <tbody>
            
            @foreach ($student->student_payment_details as $payment_detail)
            <tr>
                <td>
                    {{date('M-y', strtotime($payment_detail->pay_year.'-'.($payment_detail->pay_month + 1).'-01'))}}
                    @if($payment_detail->is_paid)
                        <span class="badge badge-success">Paid</span>
                    @else 
                        <span class="badge badge-danger">Due</span>
                    @endif
                </td>
                <td>{{$payment_detail->need_to_pay}}</td>
                <td>{{$payment_detail->pay_discount}}</td>
                <td>{{$payment_detail->pay_due}}</td>
                <td>{{$payment_detail->pay_amount}}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="2">Total</th>
                <th>{{$student->student_payment_details->sum('pay_discount') ?? 0.00}}</th>
                <th>{{$student->student_payment_details->sum('pay_due') ?? 0.00}}</th>
                <th>{{$student->student_payment_details->sum('pay_amount') ?? 0.00}}</th>
            </tr>
        </tfoot>
    </table>
    @elseif($student->batch->batch_type == 2)
    <table class="table table-bordered table-sm text-center">
        <thead>
            <tr>
                <th>Year</th>
                <th>Payable Amount</th>
                <th>Discount</th>
                <th>Due</th>
                <th>Paid Amount</th>
            </tr>
        </thead>
        <tbody>
            
            @foreach ($student->student_payment_details as $payment_detail)
            <tr>
                <td>
                    {{date('Y', strtotime($payment_detail->pay_year.'-01-01'))}}
                    @if($payment_detail->is_paid)
                        <span class="badge badge-success">Paid</span>
                    @else 
                        <span class="badge badge-danger">Due</span>
                    @endif
                </td>
                <td>{{$payment_detail->need_to_pay}}</td>
                <td>{{$payment_detail->pay_discount ?? "0"}}</td>
                <td>{{$payment_detail->pay_due ?? 0}}</td>
                <td>{{$payment_detail->pay_amount ?? 0}}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="2">Total</th>
                <th>{{$student->student_payment_details->sum('pay_discount') ?? 0.00}}</th>
                <th>{{$student->student_payment_details->sum('pay_due') ?? 0.00}}</th>
                <th>{{$student->student_payment_details->sum('pay_amount') ?? 0.00}}</th>
            </tr>
        </tfoot>
    </table>
    @endif
    {{-- payment details from payments table --}}
    @if($student->payments->isNotEmpty())
    <h5 class="text-center text-success">Payments Record</h5>
    <table class="table table-sm table-bordered text-center">
        <thead>
            <tr>
                <th>Ref. No</th>
                <th>Date</th>
                <th>Year</th>
                <th>Method</th>
                <th>Due</th>
                <th>Discount</th>
                <th>Total Amount</th>
                <th>Received By</th>
            </tr>
        </thead>
        <tbody>
            @foreach($student->payments as $payment)
            <tr>
                <td>
                    <a href="javascript:void(0)">{{$payment->ref_no}}</a>
                </td>
                <td>{{date('d-M,y', strtotime($payment->payment_date))}}</td>
                <td>{{$payment->payment_year}}</td>
                <td>{{$payment->method == 1 ? "Cash" : "Other"}}</td>
                <td>{{$payment->due ?? 0}}</td>
                <td>{{$payment->discount ?? 0}}</td>
                <td>{{$payment->total_amount ?? 0}}</td>
                <td>{{$payment->payment_received->name ?? "N/A"}}</td>
            </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="4">Total</th>
                <th>{{$student->payments->sum('due') ?? 0}}</th>
                <th>{{$student->payments->sum('discount') ?? 0}}</th>
                <th>{{$student->payments->sum('total_amount') ?? 0}}</th>
                <th>&nbsp;</th>
            </tr>
        </tfoot>
    </table>
    @endif
@else 
<p class="text-center text-danger">No Payment Record Found!</p>
@endif
