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
                {{--Participant collect type--}}
                <div class="col-md-12 col-sm-12 p-0">
                    <label for="phone">Select Type <i class="fa fa-spin"></i></label><br/>
                    <div class="form-group">
                        <div class="icheck-primary d-inline mr-4">
                            <input type="radio" id="common_sms" name="file_type" value="1">
                            <label for="common_sms">
                                Send Common SMS
                            </label>
                        </div>
                        <div class="icheck-primary d-inline">
                            <input type="radio" id="excel_sms" name="file_type" value="2">
                            <label for="excel_sms">
                                SMS from Excel File
                            </label>
                        </div>
                    </div>
                </div>

                {{-- send sms to student using common procedure--}}
                <div id="send_common_sms_section" style="display: none;">
                    <div class="form-group">
                        <div class="icheck-primary d-inline">
                            <input name="send_common" id="send_custom_msg" type="checkbox" value="1" />
                            <label for="send_custom_msg" class="text-dark">Generate Custom Message</label>
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
                                <option value="per_month_fee"> Per Month Fee </option>
                                </select>
                            </div>
                        </div>
                        <label>Common Message</label>
                        <textarea class="form-control" id="common_message" name="common_message" col="5" row="5" placeholder="Common Message"></textarea>
                        <!--<p class="p-0 text-danger" id="sms_count">0/1</p>-->
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-6">
                            <label for="batch">Batch</label>
                            <select name="batch" id="batch" class="form-control form-control-sm"/>
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
                            <input type="text" name="search" id="search" class="form-control form-control-sm" placeholder="Search By- Name, Phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" class="btn btn-sm btn-dark" id="stu_search_btn">Search</button>&nbsp;
                        @if(request()->common_message && request()->send_common)
                            <a class="btn btn-sm btn-danger" href="{{route('custom_sms_send')}}">Clear</a>
                        @endif
                    </div>
                </div>

                {{-- send sms to student from excel file--}}
                <div id="send_from_excel_sms_section" style="display: none;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class='file'>
                                <label for='input-file'>
                                    <i class="fa fa-upload"></i>
                                    Select a file
                                </label>
                                <input id='input-file' type='file' accept=".xls, .xlsx, .csv, .gsheet"/>
                                <div class="d-flex justify-content-between">
                                    <small class="form-text text-muted">
                                        Before proceeding you may follow these instructions:
                                        <ul>
                                            <li>You need to upload an Excel (.xlsx) file.</li>
                                            <li>Your file must contain a "<b>Mobile</b>" named column.</li>
                                            <li>You may download a sample Excel file from <a
                                                    href="{{ asset('/samples/Sample_SMS.xlsx') }}">here</a> and
                                                then modify as your need.
                                            </li>
                                        </ul>
                                    </small>
                                    <div id="sample_file_img">
                                        <a href="{{ asset('/samples/Sample_SMS.xlsx') }}">
                                            <img src="{{asset('/samples/sample_file_download.png')}}" alt="Sample file Download Image">
                                        </a>
                                        <small>Sample File</small>
                                    </div>
                                </div>
                                <!-- Response message -->
                                <div class="alert" style="display: none; color:red; padding: 0px;" id="responseMsg"></div>
                            </div>
                        </div>

                        <div class="col-md-12" id="filePreviewTable" style="display: none">

                        </div>

                    </div>
                </div>

                <div id="student_list_section"></div>


            </div>
        </div>
    </div>
</div>

@endsection

@push('css')
    <link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}"/>
    <style>
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
            padding: 16px;
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
        .multiselect-container>li>a>label{
            padding: 5px 5px 5px 10px !important;
        }
        .my-custom-scrollbar {
            position: relative;
            height: 225px;
            overflow: auto;
        }
        .table-wrapper-scroll-y {
            display: block;
            border: 1px solid #ddd;
            margin: 15px 0px 10px 0px;
        }
        #sample_file_img{
            width: 80px;
            height: 80px;
            padding: 10px 10px 0px 10px;
            border: 1px solid #ddd;
            cursor: pointer;
        }
        #sample_file_img img{
            width: 100%;
            height: 100%;
        }
        #sample_file_img:hover{
            border: 2px solid #333;
        }
    </style>
@endpush

@push('js')
<script src="{{ asset('js/Helper/CommonFunction.js') }}"></script>
@if(session()->has('success'))
<script>
    toaster('success','{{session("success")}}');
</script>

@endif

@if(!(valid_sms() && total_sms() > 0))
<script>
    $(document).on('click', '#submit_form_btn', function () {
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
            if (res.isConfirmed) {
                window.location.href = "{{route('sms_buy')}}";
            }
        });
});
</script>
@else
<script>
    $(document).on('click', '#submit_form_btn', function () {
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
            if (res.isConfirmed) {
                // $('#custom_sms_send_form').submit();
                $(document).find('#custom_sms_send_form').submit();
            }
        });
    });
</script>
@endif

<script>
    $('#send_common_sms_section').hide();
    $('#send_from_excel_sms_section').hide();
    $('#common_message_box').hide();

    $(document).ready(function(){
        $('input[type=radio][name="file_type"]').click(function(){
            let selectedType = $(this).val();
            $('#student_list_section').html('');

            if(selectedType == 1){
                // common sms
                $('#send_common_sms_section').show();
                $('#send_from_excel_sms_section').hide();

                $('#common_message').val('');
                $('#batch').val('');
                $('#search').val('');
            }
            else{
                // participant collection from excel
                $('#send_common_sms_section').hide();
                $('#send_from_excel_sms_section').show();
                $('#input-file').val('');
            }
        });

        $('#send_custom_msg').on('change', function(){
           if($(this).is(':checked'))  {
               $('#common_message_box').show('slow');
           }else {
               $('#common_message_box').hide('slow');
           }
        });

        $(document).on('change','#check_all', function(){
            if($(this).is(":checked")) {
                $(document).find('input[name="selected_id[]"]').each(function(index, element) {
                    $(element).prop('checked', true);
                });
            }else {
                $(document).find('input[name="selected_id[]"]').each(function(index, element) {
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

        $('#stu_search_btn').click(function(){
            let btn = $(this);
            let btnContent = btn.html();
            btn.html( btnContent + ` <div class="spinner-grow spinner-grow-sm" role="status"><span class="sr-only">Loading...</span></div>`);
            btn.prop('disabled', true);

            $.ajax({
                url: '{{route("common-student-search")}}',
                type: 'POST',
                data: {
                    batch: $(document).find('#batch').val(),
                    search: $(document).find('#search').val(),
                    common_message: $(document).find('#common_message').val(),
                },
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                success: function (response) {
                    btn.html(btnContent);
                    btn.prop('disabled', false);
                    if(response.responseCode == 1){
                        $('#student_list_section').html('').html(response.html);
                    }
                    else{
                        $('#student_list_section').html('').html(response.msg);
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


        /*========================================
         data read from excel
        ========================================*/
        $('#input-file').change(function(){
            let files = $(this)[0].files;
            if(files.length==0){
                toaster('error',"Please choose a excel file to upload...",1300);
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
                toaster('info','Data reading from excel file in-progress......');
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
                toaster('error',"Please select a valid excel file.",1300);
            }
        });


        $(document).on('change','#custom_check_all', function(){
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

        $(document).on('change','#column_list',function(){
            let selectedVal = $(this).val();
            let modifiedVal = '[['+selectedVal+']]';
            modifiedVal = modifiedVal.replace('[[','\{\{');
            modifiedVal = modifiedVal.replace(']]','\}\}');

            let custom_message = $(document).find('#custom_message').val();
            custom_message += modifiedVal+" ";
            $(document).find('#custom_message').val(custom_message);
        });

        $(document).on('click', '#generate_msg', function () {
            let btn = $(this);
            let btnContent = btn.html();
            btn.html('Generating...');
            btn.prop('disabled', true);

            const selectedRows = [];
            // Get selected rows
            $('.row-select:checked').each(function () {
                const row = $(this).data('row');
                selectedRows.push(row);
            });

            var formData = new FormData(); // Create a new FormData object

            // Append selected columns and rows data to the FormData object
            formData.append('custom_msg', $(document).find('#custom_message').val());
            formData.append('rows', JSON.stringify(selectedRows));

            $.ajax({
                url: '{{route("generate_message")}}',
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

                    toaster('success',response.msg);
                    $('#filePreviewTable').hide().html('');
                    $('#submitBtn').hide();

                    if(response.responseCode == 1){
                        // alert(response.msg);
                        $('#student_list_section').html('').html(response.html);
                    }
                    else{
                        $('#student_list_section').html('').html(response.msg);
                    }
                },
                error: function (error) {
                    btn.html(btnContent);
                    btn.prop('disabled', false);
                    toaster('error','Something went wrong!!');
                }
            });
        });

        $(document).on('click','#resetBtn',function(){
            window.location.reload();
        });

        $(document).on('click', '#sendCustomSMSBtn', function () {
            customAlertBox('question','Are sure to send SMS!','',true,'Yes, Send')
                .then(res => {
                if (res.isConfirmed) {
                    let btn = $(this);
                    let btnContent = btn.html();
                    btn.html('Sending...');
                    btn.prop('disabled', true);

                    $.ajax({
                        url: '{{route("batch_sms_send_req")}}',
                        type: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}' // Include CSRF token in the request headers
                        },
                        success: function (response) {
                            btn.html(btnContent);
                            btn.prop('disabled', false);
                            resetPage();
                            toaster('success',response.msg);
                            window.location.reload();
                        },
                        error: function (xhr, status, error) {
                            btn.html(btnContent);
                            btn.prop('disabled', false);
                            resetPage();
                            var err = eval("(" + xhr.responseText + ")");
                            toaster('success',err.message);
                        }
                    });
                }
            });
        });
    });
    function resetPage(){
        // $('input[type=radio][name="file_type"]').attr('checked',false);
        $('#send_common_sms_section').hide();

        $('#common_message_box').hide();
        $('#common_message').val('');
        $('#batch').val('');
        $('#search').val('');

        $('#send_from_excel_sms_section').hide();
        $('#input-file').val('');
        $('#responseMsg').html('');
        $('#filePreviewTable').hide('').html('');
        $('#student_list_section').hide('').html('');
    }
</script>
@endpush
