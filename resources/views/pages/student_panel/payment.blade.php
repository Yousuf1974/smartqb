@extends('layouts.student_layout')
@section('title', 'Student Payment')

@section('content')
@if($student->batch->batch_type == 1)
<?php
  $year = $student->batch->batch_year;
  $batch_year = $year;
  $last_year = $student->student_payment_details()->orderBy('id', 'desc')->first();
  if($last_year && $year < $last_year->pay_year && !request()->has('year') && empty(request()->year)) {
    $year = $last_year->pay_year;
  }
  if(request()->has('year') && !empty(request()->year)) {
    $year = request()->year;
  }

?>
<div class="row">
  <div class="col-md-8 col-sm-12 m-auto border rounded p-2">
    
    <form action="{{route('student_panel.payment_store')}}" id="payment_form" method="post">
      @csrf
      {{-- monthly fee --}}
      <input type="hidden" value="{{$student->batch->batch_fee}}" name="monthly_fee" id="monthly_fee" />
      <input type="hidden" value="0" name="total_amount" id="total_amount" />
      <div class="form-group">
        <label for="select_year">Select Year *</label>
        <select name="year" id="select_year" class="form-control form-control-sm" required>
          <option value="" hidden>Select Year</option>
          @for($i=0; $i <= 10; $i++)
            
            <?php
              $y_ = 2020+$i;
            ?>
            @if($batch_year <= $y_)
            <option
              @if($year == $y_)
                selected
              @endif
              value="<?php echo $y_; ?>"
            >
              <?php echo $y_; ?>
            </option>
            @endif
          @endfor
        </select>
      </div>
      <?php
          $arr = explode("-", $student->batch->batch_start);
          if($year == $arr[0])
              $month_start = ($arr[1] - 1) * 1;
          else 
              $month_start = null;

          // admission month
          $admission_month = null;
          if($year == date('Y', strtotime($student->admission_date))) {
              $admission_month = (date('m', strtotime($student->admission_date)) -1) * 1;
          }
      ?>
      <div class="form-group">
        <label for="month">Select Month *</label>
        <div class="d-flex flex-wrap" style="width: 100% !important;" >
        @foreach(['January', 'February', 'March', 'April', 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December'] as $key => $month)
         
          @if((!is_null($month) && $month_start > $key) || $student->batch->batch_year > $year || (!is_null($admission_month) && $admission_month > $key))
          <div style="width:100px;" class="custom-control custom-checkbox">
              <input type="checkbox" name="month[]" value="{{$key}}" disabled class="custom-control-input" />
              <label for="someCheckboxId" class="custom-control-label text-muted" style="line-height: 2"><del>{{$month}}</del></label>
          </div>                            
          @else 
              @if(in_array($key, $student->get_payment_month($year)))
                  @if($student->is_paid_this_month($year, $key))
                      {{-- checked | paid --}}
                      <div style="width:100px;" class="custom-control custom-checkbox">
                          <input type="checkbox" name="month[]" value="{{$key}}" class="custom-control-input" disabled checked id="{{$month}}" />
                          <label for="{{$month}}_{{$key}}" class="custom-control-label text-info" style="line-height: 2">{{$month}}</label>
                      </div>
                  @else
                      {{-- due --}}
                      <div style="width:100px;" class="custom-control custom-checkbox">
                          <input type="checkbox" name="month[]" value="{{$key}}" class="custom-control-input custom-control-input-danger" checked id="{{$month}}_{{$key}}" />
                          <label for="{{$month}}_{{$key}}" class="custom-control-label" style="line-height: 2">{{$month}}</label>
                      </div>
                  @endif
              @else 
                  <div style="width:100px;" class="custom-control custom-checkbox">
                      <input type="checkbox" name="month[]" value="{{$key}}" class="custom-control-input" id="{{$month}}_{{$key}}" />
                      <label for="{{$month}}_{{$key}}" class="custom-control-label" style="line-height: 2;cursor:pointer;">{{$month}}</label>
                  </div>
              @endif
          @endif
        @endforeach
        </div>
      </div>
      {{-- hidden field --}}
      <div class="form-group" id="month_fee_list">

      </div>
      <p class="p-1">
        <b>Per Month Fee - {{$student->batch->batch_fee ?? 0}}</b>
      </p>
      <div class="form-group">
        <label for="total">Amount *</label>
        <input type="number" min="0" step="1" class="form-control form-control-sm" name="paid_amount" id="amount" value="0" readonly required />
      </div>
      <div class="form-group">
        <label for="number">Phone Number *</label>
        <input type="tel" name="phone_number" id="number" class="form-control form-control-sm" required/>
      </div>
      <div class="form-group">
        <label for="message">Transaction Id *</label>
        <textarea name="transaction_id" id="message" cols="30" rows="3" class="form-control form-control-sm" placeholder="Transaction Id" required></textarea>
      </div>      
      <div class="form-group">
        <p class="text-justify p-1 border border-danger rounded text-sm">
          <big><u>Note:</u></big> {{auth()->guard('student')->user()->institution->online_payment_note ?? "N/A"}}
        </p>
      </div>
      <div class="form-group">
        <button type="button" id="payment_form_btn" class="btn btn-xs btn-success">Submit</button>
      </div>
    </form>
  </div>
</div>
@else 
<div class="row">
  <div class="col-md-8 col-sm-12 m-auto border rounded p-2">
    @if($student->student_payment_details)
    <?php
      $student_payment = $student->student_payment_details->first();;
    ?>
      <p><b><big>Total Due: {{$student_payment->pay_due ?? 0}}</big></b></p>    
    @else     
      <p><b><big>Total Due: {{$student->batch->batch_fee ?? 0}}</big></b></p>
    @endif
    <form action="{{route('student_panel.payment_store')}}" id="payment_form" method="post">
      @csrf
      <div class="form-group">
        <label for="amount">Amount*</label>
        <input type="text" name="amount" class="form-control form-control-sm" id="amount" min="0" setp="1" required/>
      </div>
      <div class="form-group">
        <label for="phone_number">Phone Number*</label>
        <input type="tel" id="phone_number" name="phone_number" class="form-control form-control-sm" required />
      </div>
      <div class="form-group">
        <label for="message">Transaction Id *</label>
        <textarea name="transaction_id" id="message" cols="30" rows="3" class="form-control form-control-sm" placeholder="Transaction Id" required></textarea>
      </div>
      <div class="form-group">
        <p class="text-justify p-1 border border-danger rounded text-sm">
          <big><u>Note:</u></big> {{auth()->guard('student')->user()->institution->online_payment_note ?? "N/A"}}
        </p>
      </div>
      <div class="form-group">
        <button type="submit" class="btn btn-xs btn-success">Save</button>
      </div>
    </form>
  </div>
</div>
@endif
@endsection

@if($student->batch->batch_type == 1)
@push('js')
<script>
  $(document).ready(function(){
    $('#select_year').on('change', function(){
      let year = $(this).val();
      window.location.href = "{{route('student_panel.payment')}}?year="+year+"";
    });
    var monthly_fee = parseInt($('#monthly_fee').val());

    $('input[name="month[]"]').on('change', function(){
      var select_month = []; 
      var hidden_month_field = '';     
      $('input[name="month[]"]').each(function(index, item){
        if($(item).is(':checked') && !$(item).attr('disabled')) {
          select_month.push($(item).val());
          let month = $(item).val();
          hidden_month_field += `<input name="month_fee[${month}]" type="hidden" value="${monthly_fee}" />`;
        }
      });
      $("#month_fee_list").html(hidden_month_field);
      $('#amount').val(+select_month.length * monthly_fee);
      $('#total_amount').val(+select_month.length * monthly_fee);
    });

    var selected_month = [];
    
    $('#payment_form_btn').on('click', function(){
      $('input[name="month[]"]').each(function(index, item){
        if($(item).is(':checked') && !$(item).attr('disabled')) {
          selected_month.push($(item).val());
        }
      });
      if(selected_month.length <= 0) {
        Swal.fire({
          icon: "warning",
          text: "Please select month!",
        });
      }else {
        $('#payment_form').submit();
      }
    });

  });
</script>
@endpush
@endif

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