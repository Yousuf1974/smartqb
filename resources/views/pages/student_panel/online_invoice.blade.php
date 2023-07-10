@extends('layouts.student_layout')
@section('title', 'Payment Invoice')

@section('content')
<div class="row">
    <div class="col-md-6 col-sm-12 m-auto overflow-auto">
        @if($online_payment)
        <h4>Online Payment Details</h4>
        <table class="table table-sm table-striped">
            <caption>Payment Invoice</caption>
            <tbody>
                <tr>
                    <th>Reference</th>
                    <td>{{$online_payment->reference}}</td>
                    <th>Date</th>
                    <td>{{date('d/m/y', strtotime($online_payment->created_at))}}</td>
                </tr>
                <tr>
                    <th>Student Name</th>
                    <td>{{$online_payment->student->student_name}}</td>
                    <th>Batch</th>
                    <td>{{$online_payment->student->batch->batch_name}}</td>
                </tr>
                <tr>
                    <th>Payment Year</th>
                    <td>{{$online_payment->payment_year}}</td>
                    <th>Total Paid</th>
                    <td>{{$online_payment->paid_amount}}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td>{{$online_payment->phone_number}}</td>
                    <th>Trasaction Id</th>
                    <td>{{$online_payment->transaction_id}}</td>
                </tr>
                
            </tbody>
        </table>
        @if($online_payment->student->batch->batch_type == 1)
        <table class="table table-sm table-striped">
            <caption>Payment Details</caption>
            <thead>
                <tr>
                    <th>SL</th>
                    <th>Month-Year</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
             @foreach($online_payment->online_payment_details as $online_payment_detail)
                <tr>
                    <td>{{$loop->iteration}}</td>
                    <td>{{MONTH_LIST[$online_payment_detail->month]}}-{{$online_payment_detail->payment_year}}</td>
                    <td>{{$online_payment_detail->amount}}</td>
                </tr>
             @endforeach
            </tbody>
        </table>
        
        <a 
            href="{{route('student_panel.invoice_download', ['reference' => $online_payment->reference])}}" 
            class="btn btn-xs btn-info">Download</a>
        @endif
        @else 
        <p class="text-center text-danger">No Payment Found!</p>
        @endif
    </div>
</div>
@endsection

@if(session()->has('success'))
  @push('js')
  <script>
    Toast.fire({
      icon: "success",
      text: "{{session('success')}}",
    });
  </script>
  @endpush
@endif