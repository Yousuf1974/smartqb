<table class="table table-sm table-striped">
    <tbody>
        <tr>
            <th>Date</th>
            <td>{{date('d/m/y', strtotime($online_payment->created_at))}}</td>
            <th>Student Name</th>
            <td>{{$online_payment->student->student_name}}</td>
            <th>Student Batch</th>
            <td>{{$online_payment->student->batch->batch_name}}</td>
        </tr>
        <tr>
            <th>Payment Year</th>
            <td>{{$online_payment->payment_year}}</td>
            <th>Total Amount</th>
            <td>{{$online_payment->total_amount ?? 0}}</td>
            <th>Total Paid</th>
            <td>{{$online_payment->paid_amount ?? 0}}</td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td>{{$online_payment->phone_number ?? "N/A"}}</td>
            <th>Status</th>
            <td colspan="3">
                @if(!$online_payment->is_approved)
                    <span class="badge badge-warning">Pending</span>
                @endif
            </td>
        </tr>
        <tr>
            <th>Transaction Id/ Message</th>
            <td colspan="5">{{$online_payment->transaction_id ?? "N/A"}}</td>
        </tr>
    </tbody>
</table>

@if($online_payment->student->batch->batch_type == 1)
{{-- online payment details --}}
<table class="table table-sm table-striped text-center">
    <thead>
        <tr>
            <th>SL</th>
            <th>Month-Year</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
        @if($online_payment->online_payment_details->isNotEmpty())
        @foreach($online_payment->online_payment_details as $online_payment_detail)
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{MONTH_LIST[$online_payment_detail->month]}}-{{$online_payment_detail->payment_year}}</td>
            <td>{{$online_payment_detail->amount}}</td>
        </tr>
        @endforeach
        @endif
    </tbody>
</table>
@endif