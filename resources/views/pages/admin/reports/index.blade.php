@extends('layouts.super_admin')
{{-- page title --}}
@section('title', 'Reports')

{{-- page header --}}
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="m-0">Reports</h4>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="{{route('admin')}}">Admin</a>
                        </li>
                        <li class="breadcrumb-item active">
                            Reports
                        </li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
@endsection


{{-- main content --}}
@section('content')

    <div class="row">
        <div class="col-md-12 col-sm-12 m-auto">
            <div class="card">
                <div class="card-body overflow-auto">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="reportSelect">Select Report</label>
                                <select id="reportSelect" class="form-control">
                                    <option value="">-- Select one --</option>
                                    @foreach($reportList as $key=>$report)
                                        <option value="{{ $key }}">{{ $report['title'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <button type="button" id="report_view" class="btn btn-primary" style="margin-top: 35px;">View</button>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12" id="reportDisplayArea" style="display: none;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
    {{-- data tables style --}}
    <link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
@endpush
{{-- extra js --}}
@push('js')
    {{-- DataTables  & Plugins --}}
    <script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/jszip/jszip.min.js')}}"></script>
    <script src="{{asset('plugins/pdfmake/pdfmake.min.js')}}"></script>
    <script src="{{asset('plugins/pdfmake/vfs_fonts.js')}}"></script>
    <script src="{{asset('plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
@endpush
{{-- extra js for this page --}}
@push('js')
    <script>
        $(document).ready(function(){
            $('#report_view').click(function () {
                let report_id = $('#reportSelect').val();

                if (!report_id) {
                    alert('Please select a report first');
                    return false;
                }

                let btn = $(this);
                btn.prop('disabled', true);

                $('#reportDisplayArea').show().html('Report generation in progress...').css('color', '#008DDA').css('padding-left', '10px');

                $.ajax({
                    url: "{{ route('admin.report.generate') }}",
                    method: 'post',
                    data: {
                        _token: "{{ csrf_token() }}",
                        report_id: report_id,
                    },
                    dataType: 'json',
                    success: function (response) {
                        //console.log(response);
                        if (response.responseCode == 1) {
                            $('#reportDisplayArea').html(response.html).css('color', '').css('padding-left', '');
                        } else {
                            $('#reportDisplayArea').html(response.msg).css('color', 'red').css('padding-left', '10px');
                        }
                    },
                    error: function (response) {
                        //console.log(response);
                        $('#reportDisplayArea').html('Something went wrong!');
                    },
                    complete: function(){
                        btn.prop('disabled', false);
                    }
                });

            });
        });
    </script>
@endpush
