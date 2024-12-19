@extends('layouts.admin')
@section('title', 'Payment Report')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Payment Report</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item active">Payment Report</li>
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
                    <h4 class="card-title">Filter for Payment Report</h4>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-minus"></i>
                        </button>

                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                          <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <form action="{{route('report.payment')}}" method="get">
                        <input type="hidden" name="filter" value="1">
                        <div class="form-row">
                            <div class="col-md-3 col-sm-12 form-group">
                                <label for="type">Batch Type</label>
                                <select name="type" id="type" class="form-control">
                                    <option value="" hidden>Select Batch Type</option>
                                    <option value="1">Monthly</option>
                                    <option value="2">Contract</option>
                                </select>
                            </div>

                            <div class="col-md-3 col-sm-12 form-group">
                                <label for="batch">Batch</label>
                                <select name="batch" id="batch" class="form-control">
                                    <option value="" hidden>Select Batch</option>

                                </select>
                            </div>

                            <div class="col-md-3 col-sm-12 form-group">
                                <label for="student">Student</label>
                                <select name="student" id="student" class="form-control">
                                    <option value="" hidden>Select Student</option>
                                </select>
                            </div>

                            <div class="col-md-3 col-sm-12 form-group">
                                <label for="date">Date</label>
                                <input type="date" name="date" id="date" class="form-control" />
                            </div>
                        </div>
                        <p class="p-0">
                            <span class="badge badge-danger p-1" role="button" id="advanced_filter_btn">Advanced Filter</span>
                        </p>
                        <div class="form-row" id="advanced_filter">
                            <div class="col-md-3 col-sm-12 form-group">
                                <label for="sort">Sort</label>
                                <select name="sort" id="sort" class="form-control">
                                    <option value="" hidden>Select Sort</option>
                                    <option value="asc">ASC</option>
                                    <option value="desc">DESC</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-dark" type="submit">Search</button>
                            {{-- <button class="btn btn-outline-warning" type="reset">Reset</button> --}}
                            <a class="btn btn-outline-danger float-right" href="{{route('report.payment')}}">Clear</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    {{-- payment record --}}
    @if($filter)
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <button id="print_report_btn" class="btn btn-dark btn-sm"><i class="fa fa-print"></i> Print</button>
                    <a href="{{route('report.payment.pdf', request()->all())}}" id="print_report_btn" class="btn btn-dark btn-sm">
                        <i class="fa fa-download"></i> Download PDF
                    </a>
                </div>
                <div class="card-body" id="print_report">
                    <?php
                        $total_amount = 0;
                        $total_discount = 0;
                        $total_due = 0;
                    ?>
                    <table class="table table-sm text-sm text-center table-bordered">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Ref. No</th>
                                <th>Date</th>
                                <th>Student</th>
                                <th>Batch</th>
                                <th>Year</th>
                                <th>Amount</th>
                                <th>Discount</th>
                                <th>Due</th>
                                <th>Received</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($payments as $payment)
                                <?php
                                    $total_amount += $payment->amount ?? 0;
                                    $total_discount += $payment->discount ?? 0;
                                    $total_due += $payment->due ?? 0;
                                ?>
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$payment->ref_no}}</td>
                                    <td>{{date('d-M,y', strtotime($payment->payment_date))}}</td>
                                    <td>{{$payment->student->student_name}}</td>
                                    <td>{{$payment->student->batch->batch_name}}</td>
                                    <td>{{$payment->payment_year}}</td>
                                    <td>{{$payment->amount ?? 0}}</td>
                                    <td>{{$payment->discount ?? 0}}</td>
                                    <td>{{$payment->due ?? 0}}</td>
                                    <td>{{$payment->payment_received->name ?? "N/A"}}</td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Total</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>{{$total_amount}}</th>
                                <th>{{$total_discount}}</th>
                                <th>{{$total_due}}</th>
                                <th>&nbsp;</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @endif
@endsection

{{-- extra css --}}
@push('css')
    <link rel="stylesheet" href="{{asset('plugins/select2/css/select2.min.css')}}"/>
    <link rel="stylesheet" href="{{asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}"/>
@endpush

{{-- extra js cdn --}}
@push('js')
    <script src="{{asset('plugins/select2/js/select2.min.js')}}"></script>
    <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
@endpush

{{-- extra js --}}
@push('js')
    <script>
        $(document).ready(function(){

            $('#advanced_filter').hide();

            $('#advanced_filter_btn').on('click', function(){
                $('#advanced_filter').toggle();
            });

            // print report button
            $('#print_report_btn').on('click', function(){
                printJS({
                    printable: "print_report",
                    type: 'html',
                    'css' : 'https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css'
                });
            });

            // batch
            $('#batch').select2({
                theme: 'bootstrap4',
                placeholder : "Select A Batch"
            });

            // student
            $('#student').select2({
                theme: 'bootstrap4',
                placeholder : "Select A Student"
            });

            var students = @json($students);
            var batchs = @json($batches);

            $('#type').on('change', function(){
                var id = $(this).val();
                let output = '<option value="" hidden>Select a Batch</option>';
                batchs.forEach((item) => {
                    if(id == item.batch_type)
                    {
                        output += `<option value="${item.id}">${item.batch_name}</option>`;
                    }
                });
                $('#batch').html(output);
            });

            $('#batch').on('change', function(){
                var id = $(this).val();
                var output = '<option value="" hidden>Select a Student</option>';
                students.forEach((item) => {
                    if(id == item.batch_id)
                    {
                        output += `<option value="${item.id}">${item.student_name}</option>`;
                    }
                });
                $('#student').html(output);
            });
        });
    </script>
@endpush
