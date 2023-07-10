@extends('layouts.admin')
@section('title', 'SMS Template')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">SMS Template</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">SMS Template</li>
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
    <div class="col-md-6 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Payment SMS Template</h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-sm text-center">
                    <caption>Short Code List</caption>
                    <thead>
                        <tr>
                            <th>Data Name</th>
                            <th>Short Code</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Institution Name</td>
                            <td>@{{ins_name}}</td>
                        </tr>
                        <tr>
                            <td>Student Name</td>
                            <td>@{{student_name}}</td>
                        </tr>
                        <tr>
                            <td>Student Batch</td>
                            <td>@{{student_batch}}</td>
                        </tr>
                        <tr>
                            <td>Payment Ref. No</td>
                            <td>@{{payment_ref}}</td>
                        </tr>
                        <tr>
                            <td>Payment Date</td>
                            <td>@{{payment_date}}</td>
                        </tr>
                        <tr>
                            <td>Total Amount</td>
                            <td>@{{total_amount}}</td>
                        </tr>
                        <tr>
                            <td>Paid Amount</td>
                            <td>@{{paid_amount}}</td>
                        </tr>
                        <tr>
                            <td>Total Discount</td>
                            <td>@{{total_discount}}</td>
                        </tr>
                        <tr>
                            <td>Total Due</td>
                            <td>@{{total_due}}</td>
                        </tr>
                        <tr>
                            <td>Payment Received By-</td>
                            <td>@{{received_by}}</td>
                        </tr>
                        <tr>
                            <td>Per Month Fee</td>
                            <td>@{{per_month_fee}}</td>
                        </tr>
                        <tr>
                            <td>Pay Month List</td>
                            <td>@{{month_list}}</td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <form action="{{route('sms.template_store')}}" method="post">
                        @csrf
                        <input type="hidden" name="type" value="payment" />
                        <div class="form-group">
                            <label>Payment SMS Template</label>
                            <textarea name="sms_template" id="sms_template" cols="30" rows="10" class="form-control form-control-sm" placeholder="Write your payment sms template">{{$institution->payment_sms_template}}</textarea>
                            <p><small>Avg. Character: <span id="total_character">0</small></p>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-sm">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {{-- Student Id SMS --}}
    <div class="col-md-6 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Student Id SMS Template</h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-sm text-center">
                    <caption>Short Code List</caption>
                    <thead>
                        <tr>
                            <th>Data Name</th>
                            <th>Short Code</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Institution Name</td>
                            <td>@{{ins_name}}</td>
                        </tr>
                        <tr>
                            <td>Student Name</td>
                            <td>@{{student_name}}</td>
                        </tr>
                        <tr>
                            <td>Student Batch</td>
                            <td>@{{student_batch}}</td>
                        </tr>
                        <tr>
                            <td>Student Class</td>
                            <td>@{{student_class}}</td>
                        </tr>
                        <tr>
                            <td>Admission Date</td>
                            <td>@{{admission_date}}</td>
                        </tr>
                        <tr>
                            <td>Unique Id</td>
                            <td>@{{unique_id}}</td>
                        </tr>
                        <tr>
                            <td>Pin Number</td>
                            <td>@{{pin_number}}</td>
                        </tr>
                        <tr>
                            <td>Guardian Login</td>
                            <td>@{{login_link}}</td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <form action="{{route('sms.template_store')}}" method="post">
                        @csrf
                        <input type="hidden" name="type" value="student_id_sms"/>
                        <div class="form-group">
                            <label for="student_id_sms">Student Id Generate SMS</label>
                            <textarea name="sms_template" id="student_id_sms" cols="30" rows="10" class="form-control form-control-sm" placeholder="Student Id Generate SMS Template">{{$institution->id_sms}}</textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-sm btn-success">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6 col-sm-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Custome SMS Template</h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-sm text-center">
                    <caption>Short Code List</caption>
                    <thead>
                        <tr>
                            <th>Data Name</th>
                            <th>Short Code</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Institution Name</td>
                            <td>@{{ins_name}}</td>
                        </tr>
                        <tr>
                            <td>Student Name</td>
                            <td>@{{student_name}}</td>
                        </tr>
                        <tr>
                            <td>Student Batch</td>
                            <td>@{{student_batch}}</td>
                        </tr>
                        <tr>
                            <td>Student Class</td>
                            <td>@{{student_class}}</td>
                        </tr>
                        <tr>
                            <td>Admission Date</td>
                            <td>@{{admission_date}}</td>
                        </tr>
                    </tbody>
                </table>
                <div>
                    <form action="{{route('sms.template_store')}}" method="post">
                        @csrf
                        <input type="hidden" name="type" value="custom_sms_template" />
                        <div class="form-group">
                            <label for="sms_template">Custom SMS Template</label>
                            <textarea name="sms_template" cols="30" rows="10" class="form-control form-control-sm" placeholder="Custom SMS Template">{{$institution->custom_sms_template}}</textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-sm">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-sm-12">
{{-- HERE WILL BE A CARD --}}
    </div>
</div>
@endsection

{{-- extra css --}}
@push('css')

@endpush

{{-- extra js --}}
@push('js')
<script>
    $(document).ready(function(){
        $('#total_character').text($('#sms_template').val().length);

        $('#sms_template').on('keyup', function(){
            $('#total_character').text($(this).val().length);
        });
    });
</script>
@endpush
