@extends('layouts.admin')
@section('title', 'All Payments')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">All Payments</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Payment List</li>
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
                    <h4 class="card-title">All Payments</h4>
                </div>
                <div class="card-body">
                    <div class="overflow">
                        <table id="payment_table" class="table table-striped table-bordered text-sm">
                            <thead>
                                <tr class="text-center">
                                    <th>SL</th>
                                    <th>Ref.</th>
                                    <th>Date</th>
                                    <th>Name</th>
                                    <th>Batch</th>
                                    <th>Amount</th>
                                    <th>Discount</th>
                                    <th>Due</th>
                                    <th>Total</th>
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
    <link rel="stylesheet" href="{{asset('plugins/select2/css/select2.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/toastr/toastr.css')}}">
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
<script src="{{asset('plugins/select2/js/select2.min.js')}}"></script>
<script src="{{asset('plugins/toastr/toastr.min.js')}}"></script>
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
        $(document).ready(function () {
            var table = $('#payment_table').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{route('payments.index')}}',
                columnDefs: [
                    { orderable: false, targets: 9 },
                    { orderable: false, targets: 3 },
                    { orderable: false, targets: 4 },
                    { orderable: false, targets: 5 },
                ],
                order: [],
                columns: [
                    { data: 'DT_RowIndex' },
                    { data: 'ref_no' },
                    { data: 'payment_date' },
                    { data: 'student.student_name' },
                    { data: 'student.batch.batch_name' },
                    { data: 'amount' },
                    { data: 'discount' },
                    { data: 'due' },
                    { data: 'total_amount'},
                    { data: 'action' },
                ],
                "buttons": [
                    "csv", "excel", "pdf","print", "colvis"
                ],
                "createdRow": function( row, data, dataIndex ) {
                    $(row).addClass( 'text-center' ).attr('id', 'row'+data.id);
                }
            });

            let loading_spinner = `<div class="d-flex justify-content-center">
                        <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>
                    </div>`;

            $(document).on("submit", "#update_form", function(evt){
                evt.preventDefault();
                let spinner = `<div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>`;
                let form = new FormData(document.querySelector('#update_form'));
                let data = Object.fromEntries(form.entries());
                let month_arr = [];
                $('#selct_month').find(':selected').each(function(){
                    month_arr.push($(this).val());
                })
                data = {...data, 'select_month[]' : month_arr}
                
                let request = $.ajax({
                    url: $('#update_form').attr('action'),
                    method: "POST",
                    data: data,
                    beforeSend: function( xhr ) {
                        $('.save_container').html(spinner);
                    },
                    success: function(data) {
                        if(data.success) {
                            Swal.fire({
                                icon: "success",
                                title: "Success!",
                                text: data.text,
                            }).then(function(res) {
                                $('.save_container').html(`<button type="submit" class="btn btn-dark">Save Changes</button>`);
                                table.ajax.reload(false);
                            });
                        }
                    },
                });

                request.fail(function(jqXHR, textStatus){
                    Swal.fire({
                        icon: "error",
                        title: "Opps..!",
                        text: "Something went worng!"
                    }).then(function(res) {
                        $('.save_container').html(`<button type="submit" class="btn btn-dark">Save Changes</button>`);
                    });
                });
            });

            // delete button
            $(document).on('click', '.delete', function(){
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure to Delete?',
                    text: "You won't be able to undo this. Will you proceed to delete all payment related data?",
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!',
                }).then(function(res){
                    if(!res.isConfirmed) {
                        return false;
                    }
                    Swal.fire({
                        icon: "info",
                        title: "Please give your password!",
                        input: "password",
                        inputPlaceholder: 'Enter your password',
                        inputClassName: "form-control",
                        inputAttributes: {
                            autocapitalize: 'off',
                            autocomplete: "new-password",
                            autofill: "off",
                            autocorrect: 'off',
                            name: 'password',
                        },
                        showCancelButton: true,
                        confirmButtonText: "Confirm",
                        showLoaderOnConfirm: true,
                        customClass: {
                            confirmButton: 'btn btn-primary btn-lg',
                            cancelButton: 'btn btn-danger btn-lg',
                            loader: 'custom-loader',
                        },
                        loaderHtml: '<div class="spinner-border text-primary"></div>',
                        allowOutsideClick: () => !Swal.isLoading(),
                        preConfirm: (result) => {
                            return new Promise(resolve => {
                                let form = new FormData(document.querySelector('#destroy-'+id));
                                let data = Object.fromEntries(form.entries());
                                data.password = result;
                                var delete_request = $.ajax({
                                    url: $('#destroy-'+id).attr('action'),
                                    method: "POST",
                                    data: data,
                                    success: function(response) {
                                        resolve(response);
                                        table.row($('#row'+id)).remove().draw(false);
                                    }
                                });
                                delete_request.fail(function(jqXHR, textStatus){
                                    Swal.fire({
                                        icon: "error",
                                        title: "Opps..!",
                                        text: jqXHR.responseJSON.message,
                                        timer: 5000,
                                    });
                                });
                            });
                        },
                    }).then(function(res){
                        if(res.isConfirmed && res.value.success) {
                            Swal.fire({
                                icon: "success",
                                title: "Success!",
                                text: res.value.message,
                                timer: 5000,
                            });
                        }
                    });
                });
            });

            // edi modal show
            $(document).on("click", ".edi_btn", function(){
                let url = $(this).data('link');
                let request = $.ajax({
                    url: url,
                    method: "GET",
                    beforeSend: function( xhr ) {
                        $('#view_modal').modal('show');
                        $('#view_title').text('Payment Edit');
                        $('#view_body').html(loading_spinner);
                    },
                    success: function(data) {
                        $('#view_body').html("");
                        $('#view_body').html(data);
                    }
                });
                request.fail(function( jqXHR, textStatus ) {
                    $('#view_body').html("");
                    $('#view_body').html("<p class='text-center text-danger'>Opps..! Something went worng!</p>");
                });
            });

            // view modal show
            $(document).on('click', '.view_btn', function(){                
                let url = $(this).data('link');
                let request = $.ajax({
                    url: url,
                    method: "GET",
                    beforeSend: function( xhr ) {
                        $('#view_modal').modal('show');
                        $('#view_title').text('Payment Details');
                        $('#view_body').html(loading_spinner);
                    },
                    success: function(data) {
                        $('#view_body').html("");
                        $('#view_body').html(data);
                    }
                });

                request.fail(function( jqXHR, textStatus ) {
                    $('#view_body').html("");
                    $('#view_body').html(textStatus);
                });
            });

        });
    </script>
@endpush