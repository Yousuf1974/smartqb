@extends('layouts.super_admin')
@section('title', 'Admin Create')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Admin Create</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("admin")}}">Admin</a>
                </li>
                <li class="breadcrumb-item active">Admin Create</li>
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
                    <form action="{{route('admin.users.store')}}" method="post">
                        @csrf 
                        <div class="form-group row">
                            <div class="col-md-6 col-sm-12">
                                <label for="name">Name*</label>
                                <input type="text" name="name" placeholder="Name" class="form-control form-control-sm  @error('name') is-invalid @enderror" value="{{old('name')}}" required />
                                @error('name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <label for="phone">Phone*</label>
                                <input type="tel" name="phone" placeholder="Phone" class="form-control form-control-sm  @error('phone') is-invalid @enderror" value="{{old('phone')}}" required />
                                @error('phone')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6 col-sm-12">
                                <label for="email">E-mail</label>
                                <input type="email" name="email" placeholder="E-mail" class="form-control form-control-sm  @error('email') is-invalid @enderror" value="{{old('email')}}" />
                                @error('email')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <label for="password">Password*</label>
                                <input type="password" name="password" placeholder="Password" class="form-control form-control-sm @error('password') is-invalid @enderror " required />
                                @error('password')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                            </div>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-dark btn-sm">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


{{-- extra css --}}
@push('css')
    {{-- data tables style --}}

@endpush
{{-- extra js --}}
@push('js')
    {{-- DataTables  & Plugins --}}
   
@endpush
{{-- extra js for this page --}}
@push('js')
    <script>
        

    </script>
@endpush
