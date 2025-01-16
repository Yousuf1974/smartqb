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
                                <label for="reportSelect">Select Report <span class="text-danger">*<span></label>
                                <select id="reportSelect" class="form-control">
                                    <option value="">-- Select one --</option>
                                    @foreach($reportList as $key=>$report)
                                        <option value="{{ $key }}" data-require-dependency="{{ !empty($report['requiredInputFields']) }}">{{ $report['title'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="reportDependencyContainer" style="display: none;"></div>

                    <button type="button" id="report_view" class="btn btn-primary mb-3">View</button>

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
            $('#reportSelect').change(function () {
                let requireDependency = $(this).find('option:selected').data('require-dependency');
                let report_id = $(this).val();

                $('#reportDisplayArea').html('').hide();
                $('#reportDependencyContainer').html('').hide();

                if(requireDependency){
                    $('#reportDependencyContainer').html('<p style="padding-left: 10px; color: #008DDA">Fetching dependencies for this report</p>').show();

                    $.ajax({
                        url: "{{ route('admin.report.fetchDependencies', ['reportId' => 'PLACEHOLDER']) }}".replace('PLACEHOLDER', report_id),
                        method: 'get',
                        dataType: 'json',
                        success: function (response) {
                            // console.log(response);
                            $('#reportDependencyContainer').html('');
                            Object.values(response.html).forEach(function (htmlBlock) {
                                $('#reportDependencyContainer').append(htmlBlock); // Append each HTML block
                            });
                        },
                        error: function (response) {
                            $('#reportDependencyContainer').html('Something went wrong!');
                        },
                        complete: function(){
                            $('#reportDependencyContainer').show();
                        }
                    });
                }
            });

            $('#report_view').click(function () {
                let report_id = $('#reportSelect').val();

                if (!report_id) {
                    alert('Please select a report first');
                    return false;
                }

                let btn = $(this);
                btn.prop('disabled', true);

                $('#reportDisplayArea').show().html('Report generation in progress...').css('color', '#008DDA').css('padding-left', '10px');

                let reqData = {
                    _token: "{{ csrf_token() }}",
                    report_id: report_id,
                };

                let dependencyInputs = getReportDependencyInputs();
                reqData = {...reqData, ...dependencyInputs};

                $.ajax({
                    url: "{{ route('admin.report.generate') }}",
                    method: 'post',
                    data: reqData,
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

            function getReportDependencyInputs() {
                let inputData = {};

                $('#reportDependencyContainer input').each(function () {
                    let inputName = $(this).attr('id') || $(this).attr('name'); // Use `id` or `name` if available
                    let inputValue = $(this).val();

                    if (inputName) {
                        inputData[inputName] = inputValue;
                    }
                });

                return inputData;
            }
        });
    </script>
@endpush
