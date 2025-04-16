@extends('layouts.admin')
@section('title', 'Student Payment Report')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Student Payment Report</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item active">Student Payment Report</li>
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
                    <h4 class="card-title">Filter for Student Payment Report</h4>
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
                    <form action="{{route('report.student_payment')}}" method="get">
                        <input type="hidden" name="filter" value="1">
                        <div class="form-row">
                            <div class="form-group col-md-4 col-sm-12">
                                <label for="batch">Select Batch</label>
                                <select name="batch" id="batch" class="form-control">
                                    <option value="" hidden>Select Batch</option>
                                    @if($batches->isNotEmpty())
                                    @foreach($batches as $batch)
                                    <option data-type="{{$batch->batch_type}}" value="{{$batch->id}}">{{$batch->batch_name}}</option>
                                    @endforeach
                                    @endif
                                </select>
                            </div>

                            <div class="form-group col-md-4 col-sm-12">
                                <label for="student">Select Student</label>
                                <select name="student" id="student" class="form-control">
                                    <option value="" hidden>Select a Student</option>
                                </select>
                            </div>

                            <div class="form-group col-md-4 col-sm-12" id="month_list">
                                <label for="month">Select Month</label>
                                <select name="month" id="month" class="form-control" multiple="multiple">
                                    <option value="" hidden>Select a Month</option>
                                    @foreach(MONTH_LIST as $key =>  $month)
                                        <option value="{{$key}}" >{{$month}}</option>
                                    @endforeach
                                </select>
                            </div>

                        </div>
                        <div class="form-group">
                            <button class="btn btn-dark" type="submit">Search</button>
                            <a href="{{route('report.student_payment')}}" class="btn btn-outline-danger float-right" type="reset">Clear</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {{-- report --}}
    @if($filter ?? false)
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <button id="print_report_btn" class="btn btn-dark btn-sm"><i class="fa fa-print"></i> Print</button>
                    <a href="javascript:void(0)" id="print_report_btn" class="btn btn-dark btn-sm">
                        <i class="fa fa-download"></i> Download PDF
                    </a>
                </div>
                <div class="card-body">
                    <div id="print_report">
                        <?php
                            $total_amount = 0;
                            $total_discount = 0;
                            $total_due = 0;
                        ?>
                        <table class="table table-sm table-bordered">
                            <thead class="text-center">
                                <tr>
                                    <th>SL</th>
                                    <th>Name</th>
                                    <th>Batch</th>
                                    <th>Class</th>
                                    @if($monthly)
                                    <th>Month</th>
                                    @endif
                                    <th>Amount</th>
                                    <th>Due</th>
                                    <th>Discount</th>
                                    <th>Paided</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                @foreach($student_payments as $student_payment)
                                    <?php
                                        $total_amount += $student_payment->pay_amount ?? 0;
                                        $total_discount += $student_payment->pay_due ?? 0;
                                        $total_due += $student_payment->pay_discount ?? 0;
                                    ?>
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$student_payment->student->student_name}}</td>
                                        <td>{{$student_payment->student->batch->batch_name}}</td>
                                        <td>{{$student_payment->student->student_class ?? "N/A"}}</td>
                                        @if($monthly)
                                        <td>{{MONTH_LIST[$student_payment->pay_month]}}</td>
                                        @endif
                                        <td>{{$student_payment->pay_amount ?? 0}}</td>
                                        <td>{{$student_payment->pay_due ?? 0}}</td>
                                        <td>{{$student_payment->pay_discount ?? 0}}</td>
                                        <td>{{$student_payment->is_paid ? "Paid" : "Due"}}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot class="text-center">
                                <tr>
                                    <th>Total</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                    @if($monthly)
                                    <th>&nbsp;</th>
                                    @endif
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
    {{-- <script src="{{asset('print/print.js')}}"></script> --}}
    <script>
        $('#month_list').hide();

        // batch
        $('#month').select2({
            theme: 'bootstrap4',
            placeholder : "Select a Month"
        });

        $(document).ready(function(){
            setPrevFilteredValue();

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

            $("#batch").on("change", function(){
                let id = $(this).val();
                let type = $(`#batch option[value="${id}"]`).data('type');
                if(type == 1)
                {
                    $('#month_list').show();
                } else {
                    $('#month_list').hide();
                }
            });
        });

        function setPrevFilteredValue(){
            let batch = "{{request('batch')}}";
            let student = "{{request('student')}}";
            let month = "{{request('month')}}";

            if(batch != "")
            {
                $('#batch').val(batch).change();
            }

            if(student != "")
            {
                $('#student').val(student).trigger('change');
            }

            if(month != "")
            {
                $('#month').val(month).trigger('change');
            }
        }
    </script>
@endpush
