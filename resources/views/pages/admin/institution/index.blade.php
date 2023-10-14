@extends('layouts.super_admin')
{{-- page title --}}
@section('title', 'Institution List')
{{-- page header --}}
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Institution List</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('admin')}}">Admin</a>
                </li>
                <li class="breadcrumb-item active">
                    Institution
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

                    <table id="institution_list" class="table table-striped table-bordered">
                        <thead class="bg-light">
                            <tr>
                                <th>SL</th>
                                <th>Primary Id</th>
                                <th>Ins. Name</th>
                                <th>Head Of Ins.</th>
                                <th>Phone/ID</th>
                                 <th>Password</th>
                                <th>Email</th>
                                <th>Registration</th>
                                <th>Total Student</th>
                                <th>Active</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="card-footer">

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
        $(function () {
            $('#institution_list').DataTable({
                processing: true,
                serverSide: true,
                columnDefs: [
                    { orderable: false, targets: -1, searchable: false, },
                    { orderable: false, targets: -2, searchable: false, },
                    { orderable: false, targets: -3, searchable: false, },
                    { orderable: false, targets: -4, searchable: false, },
                    { orderable: false, targets: 0, searchable: false, },
                    { orderable: false, targets: 1, searchable: false, },
                ],
                ajax: '{{route('institution.index')}}',
                columns: [
                    { data: 'DT_RowIndex' },
                    {data: 'primary_id'},
                    {data: 'name'},
                    {data: 'head_of_institution'},
                    {data: 'phone'},
                    {data: 'user_psw'},
                    {data: 'email'},
                    {data: 'created_at'},
                    {data: 'total_student'},
                    { data: 'active' },
                    { data: 'action' },
                ],
                "createdRow": function( row, data, dataIndex ) {
                    $(row).addClass( 'text-center' ).attr('id', 'row'+data.id);
                }
            });
        });

        $(document).ready(function(){

            $(document).on('click', '.send_sms', function() {
               let id = $(this).data('id');
               $('#view_title').text('Send SMS');
               $('#view_modal').modal('show');
            });

            // delete institution
            $(document).on('click', '.delete_btn', function(){
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure to Delete?',
                    text: "You won't be able to undo this. Will you proceed to delete all related data with this Institution?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#destroy-'+id).submit();
                    }
                })
            });
        });

    </script>
@endpush
