<form action="{{route('payments.quick_store')}}" method="post" id="qick_payment_save" class="border p-2 rounded">
    @csrf
    <input type="hidden" name="student_id" value="{{$student->id}}" required/>
    <input type="hidden" name="batch_type" value="{{$student->batch->batch_type}}" required/>
    <input type="hidden" name="payment_year" value="{{$year}}" required/>
    @if($student->batch->batch_type == 1)
        <p class="text-center">Per Month Fee: <b>{{$student->batch->batch_fee}}</b> | Payment Year: {{$year}}</p>
    @endif
    
    @if($student->batch->batch_type == 2)
        <p class="text-center">Total Course Fee: <b>{{$student->batch->batch_fee}}</b> | Payment Year: {{$year}}</p>
        <p class="text-center">Total Paid: <b>{{$student->get_paid_amount($year) ?? "N/A"}}</b> | Total Due: {{$student->get_due_amount($year) ?? ($student->batch->batch_fee ?? 0)}}</p>
    @endif

    <div class="row">
        @if($student->batch->batch_type == 1)
        <?php
            $arr = explode("-", $student->batch->batch_start);
            if($year == $arr[0])
                $month_start = ($arr[1] - 1) * 1;
            else 
                $month_start = null;
        ?>
        <input type="hidden" name="batch_fee" id="batch_fee" value="{{$student->batch->batch_fee ?? 0}}">
        <input type="hidden" name="need_to_pay" id="need_to_pay" value="0">
        <div class="col-md-6 col-sm-12">
            <div class="form-group">
                <label for="selct_month">Select Month</label>
                <select name="select_month[]" id="selct_month" tags="true" multiple="multiple" closeOnSelect="false" class="form-control form-control-sm" required>
                    <option value="" hidden>Select Month</option>
                    @foreach (MONTH_LIST as $key => $month)
                        @if(!is_null($month) && $month_start > $key)
                            <option value="{{$key}}" disabled><del>{{$month}}</del></option>
                        @else
                            @if(in_array($key, $student->get_payment_month($year)))
                                @if($student->is_paid_this_month($year, $key))
                                    <option value="{{$key}}" disabled>{{$month}} - Paid</option>
                                @else
                                    <option 
                                        @if(in_array($key, $months))
                                            selected="selected"
                                        @endif
                                        value="{{$key}}" 
                                        data-fee="{{$student->get_due_amount($year, $key)}}"
                                        >{{$month}} - Due</option>
                                @endif
                            @else 
                                <option 
                                    @if(in_array($key, $months))
                                        selected="selected"
                                    @endif
                                    value="{{$key}}" 
                                    data-fee="{{$student->batch->batch_fee}}" 
                                >{{$month}}</option>
                            @endif
                        @endif
                    @endforeach
                </select>
            </div>
        </div>
         {{-- month wise input fee value --}}
         <div id="hidden_fee"></div>
        @endif

        @if($student->batch->batch_type == 2)
            <input type="hidden" name="batch_fee" id="batch_fee" value="{{$student->batch->batch_fee ?? 0}}" >
        @endif
        @if($student->batch->batch_type == 1)
        <div class="col-md-6 col-sm-12">
            <div class="form-group">
                <label for="amount">Amount*</label>
                <input type="number" name="amount" id="amount" min="0" step="1" placeholder="Amount*" class="form-control form-control-sm" readonly required/>
            </div>
        </div>
        @else
        <div class="col-md-12 col-sm-12">
            <div class="form-group">
                <label for="amount">Amount*</label>
                <input type="number" name="amount" value="{{is_null($student->get_due_amount($year)) ? $student->batch->batch_fee : $student->get_due_amount($year)}}" id="amount" min="0" step="1" placeholder="Amount*" class="form-control form-control-sm" required/>
            </div>
        </div>
        @endif

        {{-- send sms --}}
        <div class="col-md-12 col-sm-12">
            <div class="form-group">
                <div class="icheck-primary d-inline">
                    <input type="checkbox" id="send_sms" name="send_sms" >
                    <label for="send_sms" class="
                    @if(valid_sms() && total_sms() > 0) text-success @else text-danger @endif
                    ">
                        Send Payment SMS ({{total_sms()}} Qty) 
                        {{-- <a href="{{route("sms_buy")}}" class="btn btn-xs btn-danger">Buy SMS</a> --}}
                    </label>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-sm-12">
            <div class="form-group">
                <div class="icheck-primary d-inline">
                    <input type="checkbox" id="discount_note" >
                    <label for="discount_note">Add Payment Note</label>
                </div>
            </div>
        </div>
        
        <div class="col-md-12 col-sm-12" id="payment_note_box">
            <div class="form-group">
                <label for="payment_note">Payment Note</label>
                <textarea name="note" id="payment_note" cols="30" class="form-control form-control-sm" rows="5" placeholder="Payment Note"></textarea>
            </div>
        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-12 col-sm-12 text-center">
            Amount: <b><span id="pay_amount">0.00</span></b> |
            Grand Total: <b><span id="pay_grand_total">0.00</span></b>
        </div>
    </div>
    <div class="form-group" id="submit_button">
        <button type="submit" class="btn btn-dark">Save</button>
    </div>
</form>

<script>
    @if(!(valid_sms() && total_sms() > 0))
    $('#send_sms').on('change', function(){
        if($(this).is(':checked')){
            Swal.fire({
                icon: "info", 
                title: "Please Buy SMS!",
                text: "You don\'t have enough sms or validity. Please buy sms!",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Buy SMS',
                reverseButtons: true,
                showCloseButton: true,
            }).then(res => {
                if(res.isConfirmed) {
                    window.location.href = "{{route('sms_buy')}}";
                }else {
                    $('#send_sms').prop('checked', false);
                }
            })
        }
    });
    @endif

    $('#payment_note_box').hide();
    $('#discount_note').on('change', function(){
        if($(this).is(':checked')) {
            $('#payment_note_box').show();
        }else {
            $('#payment_note_box').hide();
        }
    });
    // boostrap select 2
    $('#selct_month').select2({
        theme: 'bootstrap4',
        tags: true,
        multiple: true,
        placeholder : "Select A Month"
    });

    ['amount'].map(function(item) {
        $("#"+item).on('input', function(){
            $('#pay_'+item).text($(this).val());
            $('#pay_grand_total').text(+$('#amount').val());
        });
    });
   
</script>   

@if($student->batch->batch_type == 1)
<script>

    $('#selct_month').on('change', function(evt){
        let total_fee = 0;
        let input = '';
        $(this).val().forEach(function(item){
            let fee = +$("#selct_month option[value='"+item+"']").data('fee');
            total_fee += fee;
            input += '<input type="hidden" name="month_fee['+item+']" value="'+fee+'" />';
        });
        $('#hidden_fee').html(input);
        $('#amount').val(total_fee);
        $('#need_to_pay').val(total_fee);
        $('#amount').trigger('input');
    });
    $('#selct_month').trigger('change');
</script>
@endif
