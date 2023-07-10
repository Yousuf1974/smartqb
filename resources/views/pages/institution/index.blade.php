@extends('layouts.admin')
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
                    <a href="{{route('dashboard')}}">Dashboard</a>
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
                <div class="card-body">
                    <table id="institution_list" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Ins. Name</th>
                                <th>Head Of Ins.</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Active</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @empty($institutions)
                                <tr>
                                    <td colspan="7" class='text-center'>No Institution Found!</td>
                                </tr>
                            @endempty

                            @if(!$institutions->isEmpty())
                                @foreach ($institutions as $key => $institution)
                                <tr>
                                    <td>{{$key + 1}}</td>
                                    <td>{{$institution->name}}</td>
                                    <td>{{$institution->head_of_institution}}</td>
                                    <td>{{$institution->phone}}</td>                                  
                                    <td>{{$institution->email ?? "N/A"}}</td>
                                    <td>{{$institution->address ?? 'N/A'}}</td>
                                    <td>
                                        @if($institution->is_active)
                                            <span class="badge badge-success">Active</span>
                                        @else
                                            <span class="badge badge-danger">Deactive</span>
                                        @endif
                                    </td>
                                    <td>
                                        {{-- action button --}}
                                        @canany(['institution-index', 'institution-update', 'institution-destroy'])
                                        @can('institution-destroy')
                                            <form id="destroy-{{$institution->id}}" action="{{route('institution.destroy', ['institution' => $institution->id])}}" method="post">
                                                @csrf @method('DELETE')
                                            </form>
                                        @endcan
                                        <div class="btn-group dropleft">
                                            <button type="button" class="btn btn-outline-dark dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                            Action <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <div class="dropdown-menu" role="menu">
                                            @can('miscellaneous-login_as_ins')
                                            <a class="dropdown-item" href="{{route('login_as_ins', ['institution' => $institution->id])}}"><i class="fas fa-sign-in-alt"></i> Login as This.</a>
                                            @endcan 
                                            @can('institution-index')
                                            <a class="dropdown-item" href="{{route('institution.show', ['institution' => $institution->id])}}"><i class="fas fa-eye"></i> View</a>
                                            @endcan
                                            @can('institution-update')
                                            <a class="dropdown-item" href="{{route('institution.edit', ['institution' => $institution->id])}}"><i class="fas fa-edit"></i> Edit</a>
                                            @endcan
                                            @can('institution-destroy')
                                            <button type="button" data-id="{{$institution->id}}" class="dropdown-item delete_btn" ><i class="fas fa-trash"></i>  Delete</button>
                                            @endcan
                                            </div>
                                        </div>
                                        @endcanany
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
            $("#institution_list").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["csv", "excel", "pdf", "print", "colvis"]
            }).buttons().container().appendTo('#institution_list_wrapper .col-md-6:eq(0)');
        });

        $(document).ready(function(){
            // delete institution
            $('.delete_btn').on('click', function(){
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure to Delete?',
                    text: "You won't be able to undo this. Will you proceed to delelte all related data with this Institution?",
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