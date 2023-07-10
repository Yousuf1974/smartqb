@extends('layouts.admin')
@section('title', 'SMS History')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">SMS History</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">SMS History</li>
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
                    <h4 class="card-title">SMS History</h4>
                </div>
                <div class="card-body overflow-auto">
                    <table id="sms_history" class="table table-sm table-bordered text-center">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Date</th>
                                <th>Name</th>
                                <th>Mobile</th>
                                <th>Status</th>
                                <th>Message</th>
                                <th>Send By</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
@endpush

{{-- extra js --}}
@push('js')
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

@push('js')
<script>
    window.table = null;
    $(document).ready(function(){
        table = $('#sms_history').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{route('sms.history')}}',
                columnDefs: [
                    { orderable: false, targets: 6 },
                ],
                order: [],
                columns: [
                    { data: 'DT_RowIndex' },
                    { data: 'date' },
                    { data: 'student.student_name' },
                    { data: 'mobile_nmber' },
                    { data: 'status' },
                    { data: 'message' },
                    { data: 'send_by.name' },
                    { data: 'action' },
                ],
               
                "createdRow": function( row, data, dataIndex ) {
                    $(row).addClass( 'text-center' ).attr('id', 'row'+data.id);
                }
            });
    });

    $(document).on('click', '.view_message', function(){
        var message = $(this).data("message");
        $('#view_modal').modal('show');
        $('#view_body').html('<p class="text-justify">'+message+'</p>');
    });

    $(document).on('click', '.retry_to_send', function(){
        var id = $(this).data('id');
        Swal.fire({
            title: "Are you sure to resend?",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, Resend!',
            backdrop: false,
            allowOutsideClick: false,
            customClass: {
                confirmButton: 'btn btn-primary btn-lg',
                cancelButton: 'btn btn-danger btn-lg',
                loader: 'custom-loader',
            },
            
            preConfirm: () => {
                Swal.showLoading();
                return new Promise((resolve)=> {
                    let post_ajax = $.ajax({
                        url: "{{route('sms.retry')}}",
                        method: "POST",
                        data : {
                            id: id,
                            _token: $('meta[name="csrf-token"]').attr('content'),
                        },
                        success: function(data){
                            if(data.success) {
                                resolve({text:data.text, success: true});
                                table.draw(false);
                            } else {
                                resolve({text:data.text, success: false});
                                Swal.fire({
                                    icon: 'info',
                                    text: data.text,
                                    timer: 5000,
                                });
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

</script>
@endpush