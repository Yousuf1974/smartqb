<table class="table table-striped w-100">
    <tbody>
        <tr class="text-center">
            <th colspan="5">Payment Info. ({{$payment->payment_year}})</th>
        </tr>
        <tr>
            <td colspan="2">Student Name: {{$payment->student->student_name}}</td>
            <td colspan="2">Batch: {{$payment->student->batch->batch_name}}</td>
            <td>Join Date: {{date('d-M,y', strtotime($payment->student->admission_date))}}</td>
        </tr>        
        <tr>
            <td colspan="2">Reference No: <b>{{$payment->ref_no}}</b></td>
            <td colspan="2">Payment Date: <b>{{date('d-M,y', strtotime($payment->payment_date))}}</b></td>
            <td>Payment Method: @if($payment->method == 1)<b>Cash</b>@endif</td>
        </tr>
        <tr>
            <td colspan="2">Total Paid: <b>{{$payment->total_amount ?? "N/A"}}</b></td>
            <td colspan="2">Total Discount: <b>{{$payment->discount ?? "N/A"}}</b></td>
            <td>Total Due: <b>{{$payment->due ?? "N/A"}}</b></td>
        </tr>
        <tr class="text-center">
            <th>Month</th>
            <th>Fee</th>
            <th>Discount</th>
            <th>Due</th>
            <th>Paid</th>
        </tr>
        @if($payment->student->batch->batch_type == 1)
            @foreach ($payment->payment_details as $payment_detail)
                <?php
                    $month = $payment_detail->month+1;
                    $date = "{$payment->payment_year}-{$month}-01";
                ?>
                <tr class="text-center">
                    <td>{{date("M-y", strtotime($date))}}</td>
                    <td>{{$payment_detail->total_paidable()}}</td>
                    <td>{{$payment_detail->discount ?? "N/A"}}</td>
                    <td>{{$payment_detail->due ?? "N/A"}}</td>
                    <td>{{$payment_detail->amount ?? "N/A"}}</td>
                </tr>
            @endforeach
        @endif

        @if($payment->student->batch->batch_type == 2)
            @foreach ($payment->payment_details as $payment_detail)
                <tr class="text-center">
                    <td>{{$payment->payment_year}}</td>
                    <td>{{$payment_detail->total_paidable()}}</td>
                    <td>{{$payment_detail->discount ?? "N/A"}}</td>
                    <td>{{$payment_detail->due ?? "N/A"}}</td>
                    <td>{{$payment_detail->amount ?? "N/A"}}</td>
                </tr>
            @endforeach
        @endif
        <tr class="text-center">
            <th>Total</th>
            <th>&nbsp;</td>
            <th>{{$payment->payment_details->sum('discount') ?? 0}}</th>
            <th>{{$payment->payment_details->sum('due') ?? 0}}</th>
            <th>{{$payment->payment_details->sum('amount') ?? 0}}</th>
        </tr>
        <tr>
            <td>Note: </td>
            <td colspan="4" class="text-justify">{{$payment->note ?? "N/A"}}</td>
        </tr>
        <tr>
            <td colspan="5">Payment Received By- <b>{{$payment->payment_received->name}}</b></td>
        </tr>
        @if($payment->updated_by)
        <tr>
            <td colspan="5">Payment Updated By- <b>{{$payment->payment_updated->name}}</b></td>
        </tr>
        @endif
    </tbody>
</table>