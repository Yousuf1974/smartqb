@extends('layouts.admin')
@section('title', 'User List')

{{-- page header --}}
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Users List</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item "><a href="{{route("dashboard")}}">Dashboard</a></li>
                <li class="breadcrumb-item active">User List</li>
            </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
@endsection

@section('content')
<div class="row">
    <div class="col-sm-12">
        {{-- users table --}}
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">User List</h4>
            </div>
            <div class="card-body">
               {{-- <div class="alert alert-success text-center none">Copied</div> --}}
                <table id="user_list" class="table table-striped table-bordered">
                    <thead>
                        <tr class="text-center">
                            <th>SL</th>
                            <th>Name</th>
                            <th>Institution</th>
                            <th>Phone</th>
                            @can('miscellaneous-show_psw')
                            <th>Password</th>
                            @endcan
                            <th>E-mail</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($users as $user)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td>
                                {{$user->name}} @if($user->active_status)<span class="badge badge-success">Active</span>@else
                                <span class="badge badge-danger">Inactive</span>@endif
                                <br/><small class="text-success"><i>{{$user->level}}</i></small>
                            </td>
                            <td>{{$user->institution->name ?? "N/A"}}</td>
                            <td>
                                {{$user->phone ?? "N/A"}}
                                @if($user->phone)
                                    <span 
                                        data-toggle="tooltip" 
                                        data-placement="top" 
                                        title="Copy to Clipboard" 
                                        class="badge badge-light copy_text" 
                                        data-text="{{$user->phone}}" 
                                        role="button"
                                    >
                                        <i class="fa fa-copy"></i>
                                    </span>
                                @endif
                            </td>
                            @can('miscellaneous-show_psw')
                            <td>
                                {{$user->raw_psw ?? "N/A"}}
                                @if($user->raw_psw)
                                    <span 
                                        data-toggle="tooltip" 
                                        data-placement="top" 
                                        title="Copy to Clipboard" 
                                        class="badge badge-light copy_text" 
                                        data-text="{{$user->raw_psw}}" 
                                        role="button"
                                    >
                                        <i class="fa fa-copy"></i>
                                    </span>
                                @endif
                            </td>
                            @endcan
                            <td>{{$user->email ?? "N/A"}}</td>
                            <td>{{$user->roles->pluck('name')->first() ?? "N/A"}}</td>
                            <td class="text-center">
                                @canany(['user-index', 'user-create', 'user-update', 'user-destroy'])
                                {{-- delete form --}}
                                <form id="destroy-{{$user->id}}" action="{{route('users.destroy', ['user' => $user->id])}}" method="post">
                                    @csrf
                                    @method('DELETE')
                                </form>
                                {{-- action button group --}}
                                <div class="btn-group dropleft">
                                    <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                      Action <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu" role="menu">
                                        @can('user-index')
                                        <a class="dropdown-item show_btn" href="javascript:void(0)" data-link="{{route("users.show", ['user' => $user->id])}}"><i class="fas fa-eye"></i> View</a>
                                        @endif
                                        @can('user-update')
                                        <a class="dropdown-item" href="{{route('users.edit', ['user' => $user->id])}}"><i class="fas fa-edit"></i> Edit</a>
                                        @endcan
                                        @can('miscellaneous-user_permission')
                                        <a class="dropdown-item" href="{{route('users.permission', ['user' => $user->id])}}"><i class="fas fa-lock"></i> Assign Permissoin</a>
                                        @endcan 
                                        @can('user-destroy')
                                        <button type="button" class="dropdown-item delete_btn" data-id="{{$user->id}}"><i class="fas fa-trash"></i> Delete</button>
                                        @endcan
                                    </div>
                                </div>
                                @endcanany
                            </td>
                        </tr>
                        @endforeach
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
            $('.copy_text').on("click", function(){
                navigator.clipboard.writeText($(this).data('text')).then(() => {
                    $(this).attr('data-original-title', 'Copied').tooltip('show');
                    $(this).attr('data-original-title', 'Copy to Clipboard').tooltip('update');
                });
            });
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

            // show user
            $('.show_btn').on('click', function(){
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
                        $('#view_title').text('User Details');
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
