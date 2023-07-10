@extends('layouts.admin')
@section('title', 'Add Payment')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Add Payment</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("dashboard")}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Add Payment</li>
            </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
@endsection

{{-- main content --}}
@section('content')
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Add Payment</h4>
                </div>
                <div class="card-body">
                    <form action="{{route('payments.create')}}" method="GET">
                        <div class="row">
                            <div class="col-md-2 col-sm-12">
                                <div class="form-group">
                                    <label for="year">Select Year</label>
                                    <select name="year" id="year" class="form-control form-control-sm">
                                        <option value="" hidden>Select Year</option>
                                            @for ($i = 0; $i <= 10; $i++)
                                                <option @if($year == ($i+2020)) selected @endif value="{{$i + 2020}}">{{$i + 2020}}</option>
                                            @endfor
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12">
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="tel" placeholder="Phone" name="phone" id="phone" class="form-control form-control-sm" />
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-12">
                                <div class="form-group">
                                    <label for="batch">Select Batch</label>
                                    <select name="batch_id" id="batch" class="form-control form-control-sm">
                                        <option value="" hidden>Select Batch</option>
                                        @if($batches->isNotEmpty())
                                            @foreach ($batches as $batch)
                                                <option value="{{$batch->id}}">{{$batch->batch_name}}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12">
                                <div class="form-group">
                                    <label for="student">Select Student</label>
                                    <select name="student_id" id="student" class="form-control form-control-sm">
                                        <option value="" hidden>Select A Student</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-dark btn-sm">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    @if(!is_null($student))
                        
                        {{-- student info --}}
                    
                        <div class="row">
                            <div class="col-md-4 col-sm-12 p-2 rounded border">
                                <ul class="list-group list-group-flush ">
                                    <li class="list-group-item text-center">
                                        <b>Batch Info.</b>
                                    </li>
                                    <li class="list-group-item">Name: <u>{{$student->batch->batch_name}} ({{$student->batch->batch_year}})</u></li>
                                    <li class="list-group-item">
                                        Type: 
                                        @if($student->batch->batch_type == 1)
                                            <u>Montly</u>
                                        @elseif($student->batch->batch_type == 2)
                                            <u>Contract</u>
                                        @endif
                                    </li>
                                    <li class="list-group-item">Fee: <u>{{$student->batch->batch_fee}}</u></li>
                                    <li class="list-group-item">
                                        Batch Start: 
                                        @if($student->batch->batch_start)
                                            <u>{{date("M,y", strtotime($student->batch->batch_start . "-01"))}}</u>
                                        @endif
                                    </li>
                                </ul>

                            </div>

                            {{-- student payment info --}}
                            <div class="col-md-8 col-sm-12 p-2">
                                <form action="{{route('payments.store')}}" method="post">
                                    @csrf
                                    <input type="hidden" name="student_id" value="{{$student->id}}" />
                                    <input type="hidden" name="batch_type" value="{{$student->batch->batch_type}}" />
                                    <input type="hidden" name="batch_fee" value="{{$student->batch->batch_fee}}" />
                                    <input type="hidden" name="payment_year" value="{{$year}}" />
                                <table class="table table-striped">
                                    <thead>
                                        <tr class="text-center">
                                            <th colspan="2">Student Information</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Name: <u>{{$student->student_name}}</u></td>
                                            <td>Batch: <u>{{$student->batch->batch_name}}</u></td>
                                        </tr>
                                        <tr>
                                            <td>Class: <u>{{$student->student_class ?? "N/A"}}</u></td>
                                            <td>Institution: <u>{{$student->institution->name ?? "N/A"}}</u></td>
                                        </tr>
                                        <tr>
                                            <td>Total Paid: {{$student->get_paid_amount($year) ?? "N/A"}}</td>
                                            <td>Total Due: {{$student->batch->batch_fee - ($student->get_paid_amount($year) ?? 0)}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                @foreach ($errors->all() as $message)
                                    <div class="alert alert-danger">{{$message}}</div>
                                @endforeach
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">                                    
                                        <div class="form-group">
                                            <label for="">Date</label>
                                            <input type="date" name="payment_date" value="{{date("Y-m-d")}}" class="form-control form-control-sm"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label for="">Ref. No</label>
                                            <input type="text" name="ref_no" class="form-control form-control-sm" placeholder="Ref. No"/>
                                        </div>
                                    </div>
                                    @if($student->batch->batch_type == 1)
                                    <?php
                                        $arr = explode("-", $student->batch->batch_start);
                                        if($year == $arr[0])
                                            $month_start = ($arr[1] - 1) * 1;
                                        else 
                                            $month_start = null;

                                        $admission_month = null;
                                        if($year == date('Y', strtotime($student->admission_date))) {
                                            $admission_month = (date('m', strtotime($student->admission_date)) -1) * 1;
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
                                                        @if(in_array($key, $student->get_payment_month($year)))
                                                            @if($student->is_paid_this_month($year, $key))
                                                                <option value="{{$key}}" disabled>{{$month}} - Paid</option>
                                                            @else
                                                                <option value="{{$key}}" data-fee="{{$student->get_due_amount($year, $key)}}">{{$month}} - Due</option>
                                                            @endif
                                                        @else 
                                                            <option data-fee="{{$student->batch->batch_fee}}" value="{{$key}}" >{{$month}}</option>
                                                        @endif
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    @endif

                                    @if($student->batch->batch_type == 1)
                                    <div class="col-md-12 col-sm-12">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>&nbsp;</th>
                                                    <th>Fee</th>
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
                                                    <td id="total_sub_amount">0</td>
                                                    <td id="total_sub_pay_amount">0</td>
                                                    <td id="total_sub_discount">0</td>
                                                    <td id="total_sub_due">0</td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    @endif 

                                    @if($student->batch->batch_type == 2)
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="amount">Amount</label>
                                                <input 
                                                    type="number"
                                                    name="amount" min="0" step="1" 
                                                    class="form-control form-control-sm" id="amount" 
                                                    placeholder="Amount" required 
                                                />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label for="discount">Discount</label>
                                                <input type="number" name="discount" min="0" step="1" class="form-control form-control-sm" id="discount" placeholder="Discount"/>
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
                                            <label for="">Payment Note</label>
                                            <textarea name="note" id="payment_note" cols="30" rows="3" class="form-control form-control-sm"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                @if($student->batch->batch_type == 1)
                                <input type="hidden" name="sub_amount" value="" required>
                                <input type="hidden" name="sub_discount" value="" >
                                <input type="hidden" name="sub_due" value="">
                                @endif
                                <input type="hidden" name="total_amount" value="" required>
                                <div class="row">
                                    <div class="col-md-3 col-sm-12">
                                        Total Fee: <u><span id="footer_subtotal">0.00</span> TK</u>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        Discount: <u><span id="footer_discount">0.00</span> TK</u>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        Due: <u><span id="footer_due">0.00</span> TK</u>
                                    </div>
                                    <div class="col-md-3 col-sm-12">
                                        Grand Total: <u><span id="footer_grand_total">0.00</span> TK</u>
                                    </div>
                                </div>
                                <hr/>
                                <div class="form-group mt-2 text-center">
                                    <button class="btn btn-dark">Save</button>
                                </div>
                                </form>
                            </div>
                        </div>
                        
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
    <link rel="stylesheet" href="{{asset('plugins/select2/css/select2.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('plugins/toastr/toastr.css')}}"/>
    {{-- nice checkbox --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/icheck-bootstrap/3.0.1/icheck-bootstrap.min.css" integrity="sha512-8vq2g5nHE062j3xor4XxPeZiPjmRDh6wlufQlfC6pdQ/9urJkU07NM0tEREeymP++NczacJ/Q59ul+/K2eYvcg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endpush

{{-- extra js cdn --}}
@push('js')
    <script src="{{asset('plugins/select2/js/select2.min.js')}}"></script>
    <script src="{{asset('plugins/toastr/toastr.min.js')}}"></script>
@endpush

{{-- sms notify --}}
@if(!(valid_sms() && total_sms() > 0))
    @push('js')
    <script>
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
    </script>
    @endpush
@endif

{{-- extra js --}}
@push('js')
    <script>
        $(document).ready(function(){
            toastr.options.timeOut = 0;
            toastr.options.positionClass = "toast-top-center";

            // boostrap select 2
            $('#batch').select2({
                theme: 'bootstrap4',
                placeholder : "Select A Batch"
            });

            // toastr 
            var toastr_ = null;
            
            $('#batch').on('change', function(){
                toastr_ = toastr.info('Please wait...');
                $.get(
                    "{{route('payments.create')}}", 
                    {
                        "batch_id": $(this).val(),
                    },
                    function(data, status) {
                        if(status == 'success') {
                            toastr_.remove();
                            $('#student').html('<option value="" hidden>Select A Student</option>');
                            $('#student').select2({
                                theme: "bootstrap4",
                                placeholder: "Select A Student",
                                data: data.students.map(function(item) {
                                    return {id: item.id, text: item.student_name}
                                }),
                            });
                        }
                    },
                ).fail(function() {
                    Swal.fire("Something Went Worng!");
                });
            });
        })
    </script>
@endpush

@if(!is_null($student) && $student->batch->batch_type == 2)
    @push('js')
        <script>
            $(document).ready(function(){
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
            });
        </script>
    @endpush
@endif

@if(!is_null($student) && $student->batch->batch_type == 1)
    @push('js')
        <script>
            $(document).ready(function(){
                // set bootstrap select 2 in selec month field
                $('#selct_month').select2({
                    theme: 'bootstrap4',
                    placeholder : "Select Month"
                });

                $("#selct_month").on('change', function(){
                    let id = $(this).val();
                    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                    var output = '';
                    var total_fee = 0;
                    id.forEach(item => {
                        let fee = $("#selct_month option[value='"+item+"']").data('fee');
                        total_fee += fee ? fee : 0;
                        output += '<tr><td>'+months[item]+'</td><td>';
                        output += '<input type="number" readonly name="amount['+item+']" min="0" step="1" value="'+fee+'" class="form-control form-control-sm amount"></td><td>';
                        output += '<input type="number" name="pay_amount['+item+']" min="0" step="1" value="0" class="form-control form-control-sm pay_amount"></td><td>';
                        output += '<input type="number" name="discount['+item+']" min="0" step="1" value="0" class="form-control form-control-sm discount"></td><td>';
                        output += '<input type="number" name="due['+item+']" min="0" step="1" value="0" class="form-control form-control-sm due"></td></tr>';
                    });
                    $('#input_container').html(output);
                    grand_total();
                });

                $(document).on('input', '.pay_amount', function(){
                    var pay_amount = +$(this).val();
                    var parent_tr = $(this).parent().parent();
                    var fee = parseInt(parent_tr.find('.amount').val());
                    parent_tr.find('.discount').val(fee - pay_amount);
                });

                // sum all amount, discount, due
                ['.amount', '.pay_amount', '.discount', '.due'].map(function(item) {
                    $(document).on('input', item, function(){
                        grand_total();
                    });
                });

                function grand_total() {
                    let total_amount = 0;
                    $('.amount').each((index, item)=> {
                        total_amount += parseInt($(item).val() ? $(item).val() : 0);
                    });

                    let pay_fee = 0;
                    $('.pay_amount').each((index, item)=> {
                        pay_fee += parseInt($(item).val() ? $(item).val() : 0);
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
                    $('#total_sub_pay_amount').text(Number(pay_fee).toFixed(2));
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

            })
            
        </script>
    @endpush
@endif