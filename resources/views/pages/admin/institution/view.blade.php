@extends('layouts.super_admin')
@section('title', 'Institution Details')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Admin</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("admin")}}">Admin</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="{{route("institution.index")}}">Institution List</a>
                </li>
                <li class="breadcrumb-item active">Institution Details</li>
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
            <a class="btn btn-sm btn-info" href="{{route('institution.index')}}">Back</a>
        </div>
    </div>
    &nbsp;
    <div class="row">
        <div class="col-md-4 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Institution Details</h4>
                </div>
                <div class="card-body">
                    <table class="table-sm table-bordered table">
                        <caption>Institution Details</caption>
                        <tbody>
                            <tr>
                                <th>Name</th>
                                <td>{{$institution->name}}</td>
                            </tr>
                            <tr>
                                <th>Head Of Ins.</th>
                                <td>{{$institution->head_of_institution}}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>{{$institution->phone}}</td>
                            <tr>
                                <th>Psw</th>
                                <td>{{$institution->admin()->raw_psw}}</td>
                            </tr>
                            <tr>
                                <th>E-mail</th>
                                <td>{{$institution->email ?? "N/A"}}</td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td>{{$institution->address ?? "N/A"}}</td>
                            </tr>
                            <tr>
                                <th>Registration Date</th>
                                <td>{{date('d/m/y', strtotime($institution->created_at))}}</td>
                            </tr>
                            <tr>
                                <th>Total Stuent</th>
                                <td>{{$institution->students->count()}}</td>
                            </tr>
                            <tr>
                                <th>Active Status</th>
                                <td>
                                    @if($institution->is_active)    
                                        <span class="badge badge-success">Active</span>
                                    @else 
                                        <span class="badge badge-danger">Inactive</span>
                                    @endif
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">User List</h4>
                </div>
                <div class="card-body overflow-auto">
                    <table class="table table-sm table-bordered" id="user_list">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>E-mail</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($institution->users->isNotEmpty())
                            @foreach($institution->users as $user)
                   
                            <tr>
                                <td>{{$loop->iteration}}</td>
                                <td>{{$user->name}}</td>
                                <td>{{$user->phone}}</td>
                                <td>{{$user->email ?? "N/A"}}</td>
                                <td>
                                    {!!
                                        $user->getRoleNames()->map(function($role){
                                            return "<span class='badge badge-info'>".$role."</span>";
                                        })->implode('&nbsp;');
                                    !!}
                                </td>
                                <td>
                                    <span class="badge badge-success">Active</span>
                                </td>
                                <td>
                                    <div class="btn-group dropleft">
                                        <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                            Action <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <div class="dropdown-menu" role="menu">
                                        <a class="dropdown-item" target="_blank" href="{{route('admin.user.login', ['id' => $user->id])}}"><i class="fas fa-eye"></i> Login</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                            @else 
                            <tr>
                                <td colspan="7">No Data Found</td>
                            </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!--comments box about institution-->
            <form action="{{route('institution.comment', ['institution' => $institution->id])}}" method="POST">
                @csrf
                <div class="card">
                    <div class="card-header bg-light">
                        <h4 class="card-title">Comment</h4>
                    </div>
                    <div class="card-body">
                        <textarea class="form-control" name="comment" rows="5" cols="5" placeholder="Write Your Comment...">{{$institution->comment}}</textarea>
                    </div>
                    <div class="card-footer">
                        <button  class="btn btn-sm btn-dark" type="submit">Save</button>
                    </div>
                </div>
            </form>
            
        </div>
    </div>
@endsection

@push('css')
    {{-- data tables style --}}
    <link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
@endpush
{{-- extra js --}}
@push('js')
    {{-- DataTables  & Plugins --}}
    <script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
@endpush

@push('js')
<script>
    $(document).ready(function(){
        $("#user_list").DataTable({})
    });
</script>
@endpush