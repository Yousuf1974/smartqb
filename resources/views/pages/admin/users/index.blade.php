@extends('layouts.super_admin')
@section('title', 'Admin List')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Admin List</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("admin")}}">Admin</a>
                </li>
                <li class="breadcrumb-item active">Admin List</li>
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
                    <h4 class="card-title">Admin List</h4>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-bordered text-center" id="user_list">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>E-mail</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($admins->isNotEmpty())
                            @foreach ($admins as $admin)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$admin->name}}</td>
                                    <td>{{$admin->phone}}</td>
                                    <td>{{$admin->email ?? "N/A"}}</td>
                                    <td>
                                        @if($admin->active_status)
                                            <span class="badge badge-success">Active</span>
                                        @else 
                                            <span class="badge badge-success">Deactive</span>
                                        @endif
                                    </td>
                                    <td>
                                        <form id="destroy-{{$admin->id}}" action="{{route('admin.users.destroy', ['id' => $admin->id])}}" method="post">
                                            @csrf @method('DELETE')
                                        </form>
                                        <div class="btn-group dropleft">
                                            <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                            Action <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <div class="dropdown-menu" role="menu">
                                                <a class="dropdown-item" href="javascript:void(0)"><i class="fas fa-eye"></i> View</a>
                                                <a class="dropdown-item" href="{{route('admin.users.edit', ['id' => $admin->id])}}"><i class="fas fa-edit"></i> Edit</a>
                                                <a class="dropdown-item delete_btn" hrfe="javascript:void(0)" data-id="{{$admin->id}}"><i class="fas fa-trash"></i> Delete</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                            @endif
                        </tbody>
                    </table>
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
            $("#user_list").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": [
                "csv", "excel", "pdf","print", "colvis"
            ],
            }).buttons().container().appendTo('#user_list_wrapper .col-md-6:eq(0)');
        });

        $(document).ready(function(){

            // delete user
            $('.delete_btn').on('click', function(){
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure to Delete?',
                    text: "You won't be able to undo this.",
                    icon: 'question',
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
