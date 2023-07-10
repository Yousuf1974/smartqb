@extends('layouts.admin')
@section('title', 'Custom SMS Send')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Custom SMS Send</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Custome SMS Send</li>
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
                <h4 class="card-title">Student Search</h4>
            </div>
            <div class="card-body">
                <form action="{{route('custom_sms_send')}}" method="get">
                    <input type="hidden" name="filter" value="yes">
                    <div class="form-group">
                        <div class="icheck-primary d-inline">
                            <input name="send_common" id="send_common" type="checkbox" value="1" />
                            <label for="send_common" class="text-dark">Send Common Message</label>
                        </div>
                    </div>

                    <div class="form-group" id="common_message_box">
                        <div class="form-group row">
                            <div class="col-sm-4">
                                <label for="short_code_list">Short Codes</label>
                                <select id="short_code_list" class="form-control form-control-sm"/>
                                    <option value="">-- select one --</option>
                                    <option value="ins_name"> Institution Name </option>
                                    <option value="student_name"> Student Name </option>
                                    <option value="student_batch"> Student Batch </option>
                                    <option value="student_class"> Student Class </option>
                                    <option value="admission_date"> Admission Date </option>
                                    <option value="payment_ref"> Payment Ref. No </option>
                                    <option value="payment_date"> Payment Date </option>
                                    <option value="total_amount"> Total Amount </option>
                                    <option value="paid_amount"> Paid Amount </option>
                                    <option value="total_discount"> Total Discount </option>
                                    <option value="total_due"> Total Due </option>
{{--                                    <option value="received_by"> Payment Received By </option>--}}
                                    <option value="per_month_fee"> Per Month Fee </option>
{{--                                    <option value="month_list"> Pay Month List </option>--}}
                                </select>
                            </div>
                        </div>
                        <label>Common Message</label>
                        <textarea class="form-control" id="common_message" name="common_message" col="5" row="5" placeholder="Common Message"></textarea>
                        <!--<p class="p-0 text-danger" id="sms_count">0/1</p>-->
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label for="">Batch</label>
                            <select name="batch" id="" class="form-control form-control-sm"/>
                                <option value="" hidden>Select Batch</option>
                                @if($batches->isNotEmpty())
                                @foreach($batches as $batche)
                                <option value="{{$batche->id}}">{{$batche->batch_name}}</option>
                                @endforeach
                                @endif
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="">Name/Phone</label>
                            <input type="text" name="search" class="form-control form-control-sm" placeholder="Search By- Name, Phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-sm btn-dark">Search</button>&nbsp;
                        @if(request()->common_message && request()->send_common)
                            <a class="btn btn-sm btn-danger" href="{{route('custom_sms_send')}}">Clear</a>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@if($students)
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Custom SMS Send</h4>
            </div>
            <div class="card-body overflow-auto">
                <form id="custom_sms_send_form" action="{{route('custom_sms_send_req')}}" method="post">
                    @csrf
                    <div>
                        <table class="table table-bordered table-sm text-center">
                            <thead>
                                <tr>
                                    <th style="width:45px;">
                                        <div class="icheck-success border-success">
                                            <input type="checkbox" name="check_all" id="check_all"/>
                                            <label for="check_all"></label>
                                        </div>
                                    </th>
                                    <th>SL</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Batch</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if($students && $students->isNotEmpty())
                                @foreach($students as $student)
                                <?php
                                    $short_codes = [
                                        "{{ins_name}}","{{student_name}}","{{student_batch}}","{{student_class}}","{{admission_date}}","{{payment_ref}}",
                                        "{{payment_date}}","{{total_amount}}","{{paid_amount}}","{{total_discount}}","{{total_due}}","{{per_month_fee}}"];

                                        $replaced_codes = [ $institution->name, $student->student_name, $student->batch->batch_name, $student->batch->student_class,
                                            date('d/m/y', strtotime($student->admission_date)), $student->get_last_payment()->ref_no, $student->get_last_payment()->payment_date,
                                            $student->get_last_payment()->total_amount, $student->get_last_payment()->amount, $student->get_last_payment()->discount,
                                            $student->get_last_payment()->due, $student->batch->batch_fee];
                                    if(!request()->common_message && !request()->send_common){
                                        $message = $institution->custom_sms_template ?? "N/A";
                                        foreach($short_codes as $key => $value) {
                                            $message = str_replace("{{{$key}}}", $value, $message);
                                        }
                                    }else {
                                        $message = str_replace($short_codes , $replaced_codes, request()->common_message);
                                    }
                                    $message = htmlentities($message, ENT_QUOTES, 'UTF-8', false);
                                ?>
                                @if(request()->send_common == 1)
                                    <input type="hidden" name="custom[]" value="1" />
                                @endif
                                    <tr>
                                        <td>
                                            <div class="icheck-success border-success">
                                                <input type="checkbox" name="selected_id[]" value="{{$student->id}}" id="selected_id{{$student->id}}"/>
                                                <label for="selected_id{{$student->id}}"></label>
                                            </div>
                                        </td>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$student->student_name}}</td>
                                        <td>
                                            @if($student->student_contact)
                                            {{$student->student_contact ?? "N/A"}}
                                            @else
                                            {{$student->guardian_contact ?? "N/A"}}
                                            @endif
                                        </td>
                                        <td>{{$student->batch->batch_name}}</td>
                                        <td>
                                            {{$message}}
                                            <input type="hidden" name="message[]" value="{{$message}}" />
                                        </td>
                                    </tr>
                                @endforeach
                                @else
                                <tr>
                                    <td colspan="5" class="text-center">No Data Found!</td>
                                </tr>
                                @endif
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="5" class="text-left">
                                        <button type="button" id="submit_form_btn" class="btn btn-success">Send</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endif
@endsection

@push('css')
<link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}"/>
@endpush

@push('js')
@if(session()->has('success'))
<script>
    Toast.fire({
        icon: 'success',
        text: '{{session("success")}}',
    });
</script>
@endif

@if(!(valid_sms() && total_sms() > 0))
<script>
$('#submit_form_btn').on('click', function(){
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
        }
    });
});
</script>
@else
<script>
    $('#submit_form_btn').on('click', function(){
        Swal.fire({
            icon: "question",
            title: "Are sure to send SMS!",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, Send',
            reverseButtons: true,
            showCloseButton: true,
        }).then(res => {
            if(res.isConfirmed) {
                $('#custom_sms_send_form').submit();
            }
        });
    });
</script>
@endif

<script>
    $('#common_message_box').hide();

    $(document).ready(function(){

        // $(document).on('input', 'textarea[name="common_message"]', function() {

        //   let val = $(this).val();
        //   let per_sms_char = +"{{env('PER_SMS_CHAR')}}";
        //   let str_len = (val.length || 1);
        //   $('#sms_count').text(`${val.length}/${Math.round((str_len / per_sms_char) || 1)}`)
        // });

        $('#send_common').on('change', function(){
           if($(this).is(':checked'))  {
               $('#common_message_box').show('slow');
           }else {
               $('#common_message_box').hide('slow');
           }
        });

        $('#check_all').on('change', function(){
            if($(this).is(":checked")) {
                $('input[name="selected_id[]"]').each(function(index, element) {
                    $(element).prop('checked', true);
                });
            }else {
                $('input[name="selected_id[]"]').each(function(index, element) {
                    $(element).prop('checked', false);
                });
            }
        });

        $('#short_code_list').change(function(){
            let selectedVal = $(this).val();
            let modifiedVal = '[['+selectedVal+']]';
            modifiedVal = modifiedVal.replace('[[','\{\{');
            modifiedVal = modifiedVal.replace(']]','\}\}');

            let common_message_val = $('#common_message').val();
            common_message_val += modifiedVal+" ";
            $('#common_message').val(common_message_val);
        });
    });
</script>
@endpush
