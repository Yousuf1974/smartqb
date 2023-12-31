@extends('layouts.admin')
@section('title', 'Create User')

{{-- page header --}}
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Create User</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item "><a href="{{route("dashboard")}}">Dashboard</a></li>
                <li class="breadcrumb-item active">Create User</li>
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
        <form action="{{route('users.store')}}" method="post">
            @csrf
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Create User</h4>
            </div>
            <div class="card-body">
                
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" placeholder="name" value="{{old('name')}}" id="name" class="form-control form-control-sm @error('name') is-invalid @enderror ">
                                @error('name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input type="text" name="email" placeholder="E-mail" value="{{old('email')}}" id="email" class="form-control form-control-sm @error('email') is-invalid @enderror "/>
                                @error('email')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input type="tel" name="phone" placeholder="Phone" value="{{old('phone')}}" id="phone" class="form-control form-control-sm @error('phone') is-invalid @enderror "/>
                                @error('phone')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="password">Password</label>
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
                                    data-toggle="toggle"
                                    data-onstyle="success"   
                                    data-offstyle="warning"   
                                />
                            </div>
                        </div>
                        @if(auth()->user()->level == 'Super Admin')
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="role_id">User Role</label>
                                <select name="role_id" id="role_id" class="form-control form-control-sm @error('role_id') is-invalid @enderror">
                                    <option value="" hidden>Select User Role</option>
                                    @if(!$roles->isEmpty())
                                        @foreach ($roles as $role)
                                            <option @if(auth()->user()->hasRole($role->name)) selected @endif value="{{$role->id}}">{{$role->name}}</option>
                                        @endforeach
                                    @endif
                                </select>
                                @error('role_id')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>
                        @endif
                    </div>
            </div>
            <div class="card-footer text-right">
                <button type="submit" class="btn btn-success">Save</button>
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
