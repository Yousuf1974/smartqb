@extends('layouts.student_layout')
@section('title', 'Student Payment History')

@section('content')
<div class="row">  
    @if(auth()->guard('student')->user()->batch->batch_type == 1)
    <div class="col-md-6 co-sm-12 m-auto overflow-auto">
      @if($student_payments->isNotEmpty())
      <table class="table table-sm table-bordered text-center">
        <caption>Student Payment Record</caption>
        <thead>
          <tr>
            <th>SL</th>
            <th>Month-Year</th>
            <th>Amount</th>
            <th>Discount</th>
            <th>Due</th>
            <th>Paid</th>
          </tr>
        </thead>
        <tbody>
          @foreach($student_payments as $student_payment)
          <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{MONTH_LIST[$student_payment->pay_month]}},{{$student_payment->pay_year}}</td>
            <td>{{$student_payment->need_to_pay ?? 0}}</td>
            <td>{{$student_payment->pay_discount ?? 0}}</td>
            <td>{{$student_payment->pay_due ?? 0}}</td>
            <td>{{$student_payment->pay_amount ?? 0}}</td>
          </tr>
          @endforeach
        </tbody>
        <tfoot>
          <tr>
            <th class="text-center" colspan="3">Total</th>
            <th>{{$student_payments->sum('pay_discount') ?? 0 }}</th>
            <th>{{$student_payments->sum('pay_due') ?? 0 }}</th>
            <th>{{$student_payments->sum('pay_amount') ?? 0 }}</th>
          </tr>
        </tfoot>
      </table>
      @else
      <p class="text-center text-danger">No Payment Found!</p>
      @endif
    </div>
    @else 
      <div class="col-md-6 col-sm-12 m-auto">
        @if($student_payments)
        <table class="table table-sm table-bordered text-center">
          <caption>Student Payment Record</caption>
          <thead>
            <tr>
              <th style="width: 50%;">&nbsp;</th>
              <th style="width: 50%;">TK</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>Total Fee</th>
              <td>{{$student_payments->need_to_pay ?? 0}}</td>
            </tr>
            <tr>
              <th>Total Discount</th>
              <td>{{$student_payments->pay_discount ?? 0}}</td>
            </tr>
            <tr>
              <th>Total Paid</th>
              <td>{{$student_payments->pay_amount ?? 0}}</td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <th>Total Due</th>
              <td>{{$student_payments->pay_due ?? 0}}</td>
            </tr>
          </tfoot>
        </table>
        @else 
        <p class="text-center text-danger">No Payment Found!</p>
        @endif
      </div>
    @endif
</div>
<div class="row">
  <div class="col-md-6 col-sm-12 m-auto overflow-auto">
    <table class="table table-sm table-bordered">
      <caption>Online Payment Pending List</caption>
      <thead>
        <tr>
          <th>SL</th>
          <th>Date</th>
          <th>Reference</th>
          <th>Name</th>
          <th>Payment Year</th>
          <th>Paid Amount</th>
          <th>Status</th>
          <th>&nbsp;</th>
        </tr>
      </thead>
      <tbody>
        @if($payment_histories->isNotEmpty())
          @foreach($payment_histories as $payment_history)
            <tr>
              <td>{{$loop->iteration}}</td>
              <td>{{date('d/m/y', strtotime($payment_history->created_at))}}</td>
              <td>{{$payment_history->reference}}</td>
              <td>{{$payment_history->student->student_name}}</td>
              <td>{{$payment_history->payment_year}}</td>
              <td>{{$payment_history->paid_amount}}</td>
              <td>
                @if(!$payment_history->is_approved)  
                  <span class="badge badge-info">Pending</span>
                @endif
              </td>
              <td>
                <a href="{{route('student_panel.invoice', ['reference' => $payment_history->reference])}}" class="btn btn-xs btn-success">
                  <i class="fa fa-eye"></i>
                </a>
              </td>
            </tr>
          @endforeach
        @endif
      </tbody>
    </table>
  </div>
</div>
@endsection