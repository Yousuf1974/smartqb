@extends('layouts.admin')
@section('title', 'Student Report')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Report</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item active">Student Report</li>
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
            <div class="card @if($filter) card-collapse @endif">
                <div class="card-header">
                    <h4 class="card-title">Filter for Student Report</h4>
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
                    <form action="{{route('report.student')}}" method="get">
                        <input type="hidden" name="filter" value="yes">
                        <div class="form-row">
                            <div class="form-group col-md-4 col-sm-12">
                                <label for="batch">Select Batch</label>
                                <select name="batch_id" id="batch" class="form-control">
                                    <option value="" hidden>Select Batch</option>
                                    @if($batches->isNotEmpty())
                                    @foreach($batches as $batch)
                                    <option value="{{$batch->id}}">{{$batch->batch_name}}</option>
                                    @endforeach
                                    @endif
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-12">
                                <label for="status">Active Status</label>
                                <select name="status" id="status" class="form-control">
                                    <option value="" hidden>Select Active Status</option>
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-12">
                                <label for="admission_date">Admission Date</label>
                                <input type="date" name="admission_date" id="admission_date" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-dark" type="submit">Search</button>
                            <a href="{{route('report.student')}}" class="btn btn-outline-danger float-right" type="reset">Clear</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    {{-- report --}}
    @if($filter)
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <button id="print_report_btn" class="btn btn-dark btn-sm"><i class="fa fa-print"></i> Print</button>
                    <a href="{{route('report.student.pdf', request()->all())}}" id="print_report_btn" class="btn btn-dark btn-sm">
                        <i class="fa fa-download"></i> Download PDF
                    </a>
                </div>
                <div class="card-body">
                    <div id="print_report">
                        <table class="table table-sm table-bordered">
                            <thead class="text-center">
                                <tr>
                                    <th>SL</th>
                                    <th>Admission</th>
                                    <th>Name</th>
                                    <th>Contact</th>
                                    <th>Guardian Name</th>
                                    <th>Contact</th>
                                    <th>Batch</th>
                                    <th>Class</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                                @foreach($students as $student)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{date('d-M,y', strtotime($student->admission_date))}}</td>
                                    <td>{{$student->student_name}}</td>
                                    <td>{{$student->student_contact ?? "N/A"}}</td>
                                    <td>{{$student->guardian_name ?? "N/A"}}</td>
                                    <td>{{$student->guardian_contact ?? "N/A"}}</td>
                                    <td>{{$student->batch->batch_name ?? "N/A"}}</td>
                                    <td>{{$student->student_class}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif
@endsection

{{-- extra js --}}
@push('js')
    <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
    {{-- <script src="{{asset('print/print.js')}}"></script> --}}
    <script>
        $(document).ready(function(){
            $('#print_report_btn').on('click', function(){
                printJS({
                    printable: "print_report", 
                    type: 'html',
                    'css' : 'https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css'
                });
            });
        });
    </script>
@endpush