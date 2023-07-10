@extends('layouts.admin')
@section('title', 'Edit User')

{{-- page header --}}
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Update User</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item "><a href="{{route("dashboard")}}">Dashboard</a></li>
                <li class="breadcrumb-item "><a href="{{route("admin.users")}}">User List</a></li>
                <li class="breadcrumb-item active">Update User</li>
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
    <div class="col-sm-12">
        {{-- users table --}}
        <form action="{{route('users.update', ['user' => $user->id])}}" method="post">
            @csrf @method('PUT')
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Update User</h4>
            </div>
            <div class="card-body">
                
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" placeholder="name" value="{{$user->name}}" id="name" class="form-control form-control-sm @error('name') is-invalid @enderror ">
                                @error('name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input type="text" name="email" placeholder="E-mail" value="{{$user->email}}" id="email" class="form-control form-control-sm @error('email') is-invalid @enderror "/>
                                @error('email')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="tel" name="phone" placeholder="Phone" value="{{$user->phone}}" id="phone" class="form-control form-control-sm @error('phone') is-invalid @enderror "/>
                                @error('phone')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="password">Change Password</label>
                                <input type="password" name="password" placeholder="password" id="password" class="form-control form-control-sm" autocomplete="off" autocomplete="new-password"/>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="email">Active Status</label>
                                <br/>
                                <input 
                                    type="checkbox" 
                                    name="active_status" 
                                    value="1" 
                                    @if($user->active_status) checked @endif
                                    data-toggle="toggle"
                                    data-onstyle="success"   
                                    data-offstyle="warning"   
                                />
                            </div>
                        </div>
                    </div>
            </div>
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-success">Save Changes</button>
            </div>
        </div>
        </form>
    </div>
</div>
@endsection

{{-- page extra css cdn --}}
@push('css')
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
@endpush

{{-- page extra js cdn --}}
@push('js')
    <!-- Bootstrap Switch -->
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
@endpush

@push('js')
<script>
    $(document).ready(function(){
        $('input[name="active_status"]').on('change', function(){
            if($(this).is(":checked")) {
                $(this).val(1);
            }else{
                $(this).val(0);
            }
        })
    });
</script>
@endpush
