<?php
    $year = $payment->payment_year;
?>
<form id="update_form" action="{{route('payments.update', ['payment' => $payment->id])}}" method="post">
    @csrf @method('PUT')
    <input type="hidden" name="student_id" value="{{$payment->student_id}}" />
    <input type="hidden" name="batch_type" value="{{$payment->student->batch->batch_type}}" />
    <input type="hidden" name="batch_fee" value="{{$payment->student->batch->batch_fee}}" />
    <input type="hidden" name="payment_year" value="{{$payment->payment_year}}" />
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" name="payment_date" value="{{date('Y-m-d', strtotime($payment->payment_date))}}" id="date" class="form-control form-control-sm">
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="form-group">
                <label for="ref_no">Ref. No</label>
                <input type="text" readonly name="ref_no" value="{{$payment->ref_no}}" id="ref_no" placeholder="Reference No" class="form-control form-control-sm">
            </div>
        </div>
        @if($payment->student->batch->batch_type == 1)
        <?php
            $arr = explode("-", $payment->student->batch->batch_start);
            if($year == $arr[0])
                $month_start = ($arr[1] - 1) * 1;
            else 
                $month_start = null;

            $admission_month = null;
            if($year == date('Y', strtotime($payment->student->admission_date))) {
                $admission_month = (date('m', strtotime($payment->student->admission_date)) -1) * 1;
            }
            
        ?>
        <div class="col-md-12 col-sm-12">
            <div class="form-group">
                <label for="select_month">Select Month</label>
                <select name="select_month[]" id="selct_month" tags="true" multiple="multiple" class="form-control form-control-sm" required>
                    <option value="" hidden>Select Month</option>
                    @foreach (MONTH_LIST as $key => $month)
                        @if((!is_null($month_start) && $month_start > $key) || (!is_null($admission_month) && $admission_month > $key))
                            <option value="{{$key}}" disabled>{{$month}}</option>
                        @else
                            @if(in_array($key, $payment->student->get_payment_month($year)))
                                @if(!in_array($key, $payment->get_payment_months()) && $payment->student->is_paid_this_month($year, $key))
                                    <option value="{{$key}}" disabled>{{$month}} - Paid</option>
                                @else
                                    @if(in_array($key, $payment->get_payment_months()))
                                        <option 
                                            value="{{$key}}" 
                                            data-fee="{{$payment->get_total_payable_amount($key)}}"
                                            data-due="{{$payment->get_this_month_due_fee($key)}}"
                                            data-discount="{{$payment->get_this_month_discount_fee($key)}}"
                                            selected="selected"
                                        >
                                            {{$month}}
                                        </option>
                                    @else
                                        <option 
                                            value="{{$key}}" 
                                            data-fee="{{$payment->student->get_due_amount($year, $key)}}"
                                            data-due="0"
                                            data-discount="0"
                                        >
                                            {{$month}} - Due
                                        </option>
                                    @endif
                                @endif
                            @else 
                                <option 
                                    data-fee="{{$payment->student->batch->batch_fee}}" 
                                    value="{{$key}}" 
                                    data-due="0"
                                    data-discount="0"
                                >
                                    {{$month}}
                                </option>
                            @endif
                        @endif
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-md-12 col-sm-12">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>Amount</th>
                        <th>Discount</th>
                        <th>Due</th>
                    </tr>
                </thead>
                <tbody id="input_container">
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td>&nbsp;</td>
                        <td id="total_sub_amount">0.00</td>
                        <td id="total_sub_discount">0.00</td>
                        <td id="total_sub_due">0.00</td>
                    </tr>
                </tfoot>
            </table>
        </div>
       
        @endif

        @if($payment->student->batch->batch_type == 2)
            <div class="col-md-6 col-sm-12">
                <div class="form-group">
                    <label for="amount">Amount</label>
                    <input type="number" name="amount" value="{{$payment->total_amount ?? 0}}" min="0" step="1" class="form-control form-control-sm" id="amount" placeholder="Amount" required />
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="form-group">
                    <label for="discount">Discount</label>
                    <input type="number" name="discount" value="{{$payment->discount ?? 0}}" min="0" step="1" class="form-control form-control-sm" id="discount" placeholder="Discount"/>
                </div>
            </div>
        @endif

        <div class="col-md-12 col-sm-12">
            <div class="form-group">
                <label for="">Payment Note</label>
                <textarea name="note" id="payment_note" cols="30" rows="3" class="form-control form-control-sm">{{$payment->note}}</textarea>
            </div>
        </div>

    </div>
    <hr/>
    @if($payment->student->batch->batch_type == 1)
    <input type="hidden" name="sub_amount" value="{{$payment->amount ?? 0}}" required>
    <input type="hidden" name="sub_discount" value="{{$payment->discount ?? 0}}" >
    <input type="hidden" name="sub_due" value="{{$payment->due ?? 0}}">
    @endif
    <input type="hidden" name="total_amount" value="{{$payment->total_amount ?? 0}}" required>
    <div class="row">
        <div class="col-md-3 col-sm-12">
            Subtotal: <u><span id="footer_subtotal">{{$payment->amount ?? 0}}</span> TK</u>
        </div>
        <div class="col-md-3 col-sm-12">
            Discount: <u><span id="footer_discount">{{$payment->discount ?? 0}}</span> TK</u>
        </div>
        <div class="col-md-3 col-sm-12">
            Due: <u><span id="footer_due">{{$payment->due ?? 0}}</span> TK</u>
        </div>
        <div class="col-md-3 col-sm-12">
            Grand Total: <u><span id="footer_grand_total">{{$payment->total_amount ?? 0}}</span> TK</u>
        </div>
    </div>
    <hr/>
    <div class="form-group mt-2 text-center save_container">
        <button type="submit" class="btn btn-dark">Save Changes</button>
    </div>
</form>

{{-- extra js --}}
@if(!is_null($payment) && $payment->student->batch->batch_type == 2)
<script>
    $('#amount').on('input', function(){
        calculation();
    });

    $('#discount').on('input', function(){
        calculation();
    });

    function calculation() {
        let amount = parseInt($('#amount').val() ? $('#amount').val() : 0);
        let discount = parseInt($('#discount').val() ? $('#discount').val() : 0);
        $('input[name="total_amount"]').val(parseInt(amount - discount));
        $('#footer_subtotal').text(parseInt(amount));
        $('#footer_discount').text(parseInt(discount));
        $('#footer_grand_total').text(parseInt(amount - discount));
    }
</script>
@endif

@if(!is_null($payment) && $payment->student->batch->batch_type == 1)
<script>
   

    // set bootstrap select 2 in selec month field
    $('#selct_month').select2({
        theme: 'bootstrap4',
        placeholder : "Select Month"
    });
    // $('#selct_month').val({{ Illuminate\Support\Js::from($payment->get_payment_months()) }});
    // $('#selct_month').trigger('change');
    

    // select month and generate field for payment
    function month_input() {
        $('#input_container').html('');
        var id = $('#selct_month').val();
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        var output = '';
        var total_fee = 0;
        id.forEach(item => {
            let fee = $("#selct_month option[value='"+item+"']").data('fee');
            let discount = $("#selct_month option[value='"+item+"']").data('discount');
            let due = $("#selct_month option[value='"+item+"']").data('due');
            total_fee += fee ? fee : 0;
            output += '<tr><td>'+months[item]+'</td><td>';
            output += '<input type="number" readonly name="amount['+item+']" min="0" step="1" value="'+fee+'" class="form-control form-control-sm amount"></td><td>';
            output += '<input type="number" name="discount['+item+']" min="0" step="1" value="'+discount+'" class="form-control form-control-sm discount"></td><td>';
            output += '<input type="number" name="due['+item+']" min="0" step="1" value="'+due+'" class="form-control form-control-sm due"></td></tr>';
        });
        $('#input_container').html(output);
        grand_total();
    }

    month_input();

    $("#selct_month").on('change', function(){
        month_input();
        grand_total();
    });

    // sum all amount, discount, due
    ['.amount', '.discount', '.due'].map(function(item) {
        $(document).on('input', item, function(){
            grand_total();
        });
    });

    function grand_total() {
        let total_amount = 0;
        $('.amount').each((index, item)=> {
            total_amount += parseInt($(item).val() ? $(item).val() : 0);
        });

        let total_discount = 0;
        $('.discount').each((index, item)=> {
            total_discount += parseInt($(item).val() ? $(item).val() : 0);
        });

        let total_due = 0;
        $('.due').each((index, item)=> {
            total_due += parseInt($(item).val() ? $(item).val() : 0);
        });
        // table footer
        $('#total_sub_amount').text(Number(total_amount).toFixed(2));
        $('#total_sub_discount').text(Number(total_discount).toFixed(2));
        $('#total_sub_due').text(Number(total_due).toFixed(2));

        // footer
        $('#footer_subtotal').text(Number(total_amount).toFixed(2));
        $('#footer_discount').text(Number(total_discount).toFixed(2));
        $('#footer_due').text(Number(total_due).toFixed(2));

        // input value
        $('input[name="total_amount"').val(parseInt(total_amount - (total_discount + total_due)));
        $('input[name="sub_discount"').val(parseInt(total_discount));
        $('input[name="sub_due"').val(parseInt(total_due));
        $('input[name="sub_amount"').val(parseInt(total_amount));
        // grand total
        $('#footer_grand_total').text(Number(total_amount - (total_discount + total_due)).toFixed(2)); //

    }
</script>

@endif