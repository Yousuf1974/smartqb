@extends('layouts.admin')
@section('title', 'Student List')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Student List</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Student List</li>
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
                    <h4 class="card-title">Student List</h4>
                </div>
                <div class="card-body">
                    <div class="overflow">
                        <table id="student_table" class="table table-striped table-bordered">
                            <thead>
                                <tr class="text-center">
                                    <th>SL</th>
                                    <th>&nbsp;</th>
                                    <th>Name</th>
                                    <th>Unique Id</th>
                                    <th>Admission</th>
                                    <th>Phone</th>
                                    <th>Class</th>
                                    <th>Batch</th>
                                    <th>Institution</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
    <link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
    <style>
        .overflow {
            overflow-x: auto;
        }
        .custom-loader {
            animation: none !important;
            border-width: 0 !important;
        }

    </style>
@endpush

@push('js')
{{-- extra js cdn --}}
<script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
@endpush

{{-- extra js --}}
@push('js')
    <script>
        var mydataTable;
       
        $(document).ready(function () {
            mydataTable = $('#student_table').DataTable({
                processing: true,
                serverSide: true,
                columnDefs: [
                    { orderable: false, targets: -1 },
                    { orderable: false, targets: 0 },
                    { orderable: false, targets: 1 },
                ],
                ajax: '{{route('students.index')}}',
                columns: [
                    { data: 'DT_RowIndex' },
                    { data: 'user_profile' },
                    { data: 'student_name' },
                    { data: 'unique_id' },
                    { data: 'admission_date' },
                    { data: 'student_contact' },
                    { data: 'student_class' },
                    { data: 'batch' },
                    { data: 'institution' },
                    { data: 'action' },
                ],
                lengthMenu: [[10, 25, 50, 100, 1000], [10, 25, 50, 100, "All"]],
                "buttons": [
                    "csv", "excel", "pdf","print", "colvis"
                ],
                "createdRow": function( row, data, dataIndex ) {
                    $(row).addClass( 'text-center' ).attr('id', 'row'+data.id);
                }
            });

            // generate unique id
            $(document).on("click", ".generate_id", function(){
                var id = $(this).data('id');
                Swal.fire({
                    title: "Are you sure to Generate Student Unique Id?",
                    text: "If you generate a student unique id then student could login and pay online!",
                    icon: "question",
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, Proceed!',
                    backdrop: false,
                    allowOutsideClick: false,
                    customClass: {
                        confirmButton: 'btn btn-primary btn-lg',
                        cancelButton: 'btn btn-danger btn-lg',
                        loader: 'custom-loader',
                    },
                    loaderHtml: '<div class="spinner-border text-primary"></div>',
                    preConfirm: () => {
                        Swal.showLoading();
                        return new Promise((resolve)=> {
                            let post_ajax = $.ajax({
                                url: "{{route('generate_unique_id')}}",
                                method: "POST",
                                data : {
                                    student_id: id,
                                    _token: $('meta[name="csrf-token"]').attr('content'),
                                },
                                success: function(data){
                                    if(data.success) {
                                        resolve({text:data.text, success: true});
                                        mydataTable.draw(false);
                                    } else {
                                        Swal.fire({
                                            icon: 'info',
                                            title: 'Opps..!',
                                            text: data.text,
                                            timer: 5000,
                                        });
                                        resolve({success: false});
                                    }                                  
                                },
                            });
                            post_ajax.fail(function(xhr, textStatus){
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Opps..!',
                                    text: textStatus,
                                    timer: 5000,
                                });
                            });
                        });
                    },
                }).then((result) => {
                    if (result.isConfirmed && result.value.success) {
                        Toast.fire({
                            icon: 'success',
                            title: result.value.text,
                        });     
                    };
                });
            });

            // delete user
            $(document).on('click', '.delete_btn', function(){
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure to Delete?',
                    text: "You won't be able to undo this. Will you proceed to delete all student related data?",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!',
                    customClass: {
                        confirmButton: 'btn btn-primary btn-lg',
                        cancelButton: 'btn btn-danger btn-lg',
                        loader: 'custom-loader',
                    },
                    loaderHtml: '<div class="spinner-border text-primary"></div>',
                    preConfirm: () => {
                        Swal.showLoading();
                        return new Promise((resolve)=> {
                            let form = new FormData(document.querySelector('#destroy-'+id));
                            let data = Object.fromEntries(form.entries())
                            let post_ajax = $.ajax({
                                url: $('#destroy-'+id).attr('action'),
                                method: "POST",
                                data : data,
                                success: function(data){
                                    if(data.success) {
                                        resolve({text:data.text, success: true});
                                        mydataTable.row($('#row'+id)).remove().draw(false);
                                    }                                   
                                }
                            });
                            post_ajax.fail(function(xhr, textStatus){
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Opps..!',
                                    text: textStatus,
                                    timer: 5000,
                                });
                            });
                        });
                    },
                }).then((result) => {
                    if (result.isConfirmed && result.value.success) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success..!',
                            text: result.value.text,
                            timer: 5000,
                        });     
                    };
                });
            });
            
            // show user
            $(document).on('click', '.show_btn', function(){
                let loading_spinner = `<div class="d-flex justify-content-center">
                        <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>
                    </div>`;
                
                let url = $(this).data('link');
                let request = $.ajax({
                    url: url,
                    method: "GET",
                    beforeSend: function( xhr ) {
                        $('#view_modal').modal('show');
                        $('#view_title').text('Student Details');
                        $('#view_body').html(loading_spinner);
                    },
                    success: function(data) {
                        $('#view_body').html("");
                        $('#view_body').html(data);
                    }
                });

                request.fail(function( jqXHR, textStatus ) {
                    $('#view_body').html("");
                    $('#view_body').html("<p class='text-center text-danger'>Opps! Something went worng!<p>");
                });
            });


        });
    </script>
@endpush