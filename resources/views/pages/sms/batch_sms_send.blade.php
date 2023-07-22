@extends('layouts.admin')
@section('title', 'Batch SMS Send')
@push('css')
    <link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}"/>
    <style>
        file {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .file > input[type='file'] {
            display: none
        }

        .file > label {
            font-size: 1rem;
            font-weight: 300;
            cursor: pointer;
            outline: 0;
            user-select: none;
            border-color: rgb(216, 216, 216) rgb(209, 209, 209) rgb(186, 186, 186);
            border-style: solid;
            border-radius: 4px;
            border-width: 1px;
            background-color: hsl(0, 0%, 100%);
            color: hsl(0, 0%, 29%);
            padding-left: 16px;
            padding-right: 16px;
            padding-top: 16px;
            padding-bottom: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .file > label:hover {
            border-color: hsl(0, 0%, 21%);
        }

        .file > label:active {
            background-color: hsl(0, 0%, 96%);
        }

        .file > label > i {
            padding-right: 5px;
        }
    </style>
@endpush
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Batch SMS Send</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Batch SMS Send</li>
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
                <h4 class="card-title">Batch SMS Send</h4>
            </div>
            <div class="card-body">
                <div class="col-md-12">
                    <div class='file'>
                        <label for='input-file'>
                            <i class="fa fa-upload"></i>
                            Select a file
                        </label>
                        <input id='input-file' type='file' accept=".xls, .xlsx, .csv, .gsheet" />
                        <small class="form-text text-muted">
                            Before proceeding you may follow these instructions:
                            <ul>
                                <li>You need to upload an Excel (.xlsx) file.</li>
                                <li>Your file must contain a "<b>Mobile</b>" named column.</li>
                                <li>You may download a sample Excel file from <a href="{{ asset('/samples/Result_SMS.xlsx') }}">here</a> and then modify as your need.</li>
                            </ul>
                        </small>
                        <!-- Response message -->
                        <div class="alert" style="display: none; color:red; padding: 0px;" id="responseMsg"></div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div id="filePreviewTable" style="display: none">

                    </div>
                </div>
                <div class="col-md-12 text-center">
                    <button class="btn btn-sm btn-info" style="display: none;" id="submitBtn">Send SMS</button>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

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

        $('#input-file').change(function(){
            // var files = document.getElementById('file_upload').files;
            let files = $(this)[0].files;
            if(files.length==0){
                alert("Please choose a excel file to upload...");
                return;
            }

            let filename = files[0].name;
            let extension = filename.substring(filename.lastIndexOf(".")).toUpperCase();
            if (extension == '.XLS' || extension == '.XLSX') {
                var fd = new FormData();

                // Append data
                fd.append('file',files[0]);
                fd.append('_token',$('meta[name="csrf-token"]').attr('content'));

                // Hide alert
                $('#responseMsg').hide();
                $('#filePreviewTable').hide().html('');
                $('#submitBtn').hide();

                // AJAX request
                $.ajax({
                    url: "{{ route('upload-excel') }}",
                    method: 'post',
                    data: fd,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    success: function(response){
                        if(response.responseCode == 1){ // Uploaded successfully
                            // File preview
                            $('#filePreviewTable').show().html(response.html);
                            $('#submitBtn').show();

                        }
                        else{
                            $('#responseMsg').show().html(response.msg);
                            $('#submitBtn').hide();
                        }
                    },
                    error: function(response){
                        $('#responseMsg').show().html(response.msg);
                        $('#submitBtn').hide();
                    }
                });

            }else{
                alert("Please select a valid excel file.");
            }
        });

        $(document).on('change','#headerCheckbox',function(){
            if($(this).is(":checked")) {
                $(document).find('.row-select').each(function(index, element) {
                    $(element).prop('checked', true);
                });
            }else {
                $(document).find('.row-select').each(function(index, element) {
                    $(element).prop('checked', false);
                });
            }
        });

        $(document).on('change','.column-select, .row-select',function(){
            const row = $(this).data('row');
            const column = $(this).data('column');
            const allCheckboxes = $(`[data-row="${row}"], [data-column="${column}"]`);
            const allRowCheckboxes = $(`[data-row="${row}"].row-select`);
            const allColumnCheckboxes = $(`[data-column="${column}"].column-select`);

            allRowCheckboxes.prop('checked', this.checked);
            allColumnCheckboxes.prop('checked', this.checked);
            allCheckboxes.prop('checked', this.checked);
        });


        $(document).on('click', '#submitBtn', function () {
            let btn = $(this);
            let btnContent = btn.html();
            btn.html('Sending...');
            btn.prop('disabled', true);

            const selectedColumns = [];
            const selectedRows = [];

            // Get selected columns
            $('.column-select:checked').each(function () {
                const column = $(this).data('column');
                selectedColumns.push(column);
            });

            // Get selected rows
            $('.row-select:checked').each(function () {
                const row = $(this).data('row');
                selectedRows.push(row);
            });

            var formData = new FormData(); // Create a new FormData object

            // Append selected columns and rows data to the FormData object
            formData.append('columns', JSON.stringify(selectedColumns));
            formData.append('rows', JSON.stringify(selectedRows));

            // Iterate over the hidden input fields and append their values to the FormData object
            $('input[type="hidden"]').each(function () {
                const name = $(this).attr('name');
                const value = $(this).val();
                formData.append(name, value);
            });


            $.ajax({
                url: '{{route("batch_sms_send_req")}}',
                type: 'POST',
                dataType: 'json',
                data: formData, // Pass the FormData object as the data
                processData: false, // Prevent jQuery from processing the data
                contentType: false, // Prevent jQuery from setting the content type
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}' // Include CSRF token in the request headers
                },
                success: function (response) {
                    btn.html(btnContent);
                    btn.prop('disabled', false);
                    if(response.responseCode == 1){
                        alert(response.msg);
                        $('#responseMsg').hide();
                        $('#filePreviewTable').hide().html('');
                        $('#submitBtn').hide();
                    }
                    else{
                        $('#responseMsg').show().html(response.msg);
                        $('#filePreviewTable').hide().html('');
                        $('#submitBtn').hide();
                    }
                },
                error: function (error) {
                    btn.html(btnContent);
                    btn.prop('disabled', false);
                    $('#responseMsg').show().html('Something went wrong!!');
                    $('#filePreviewTable').hide().html('');
                    $('#submitBtn').hide();
                }
            });
        });

    });
</script>
@endpush
