@extends('layouts.super_admin')

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
                <li class="breadcrumb-item active">Admin</li>
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
            <div class="card card-light">
                <div class="card-header border-transparent">
                  <h3 class="card-title">Latest Institution</h3>
                  <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                      <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove">
                      <i class="fas fa-times"></i>
                    </button>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table m-0">
                      <thead>
                      <tr>
                        <th>SL</th>
                        <th>Date</th>
                        <th>Institute Name</th>
                        <th>Head Of Ins.</th>
                        <th>Phone</th>
                        <th>E-mail</th>
                        <th>Total Student</th>
                        <th>Status</th>
                      </tr>
                      </thead>
                      <tbody>   
                        @if($latest_institutions->isNotEmpty()) 
                            @foreach($latest_institutions as $latest_institute)
                            <tr>
                                <td>{{$loop->iteration}}</td>
                                <td>{{date('d/m/y g:i a', strtotime($latest_institute->created_at))}}</td>
                                <td>{{$latest_institute->name}}</td>
                                <td>{{$latest_institute->head_of_institution}}</td>
                                <td>{{$latest_institute->phone ?? "N/A"}}</td>
                                <td>{{$latest_institute->email ?? "N/A"}}</td>
                                <td>{{$latest_institute->students->count() ?? 0}}</td>
                                <td>
                                    @if($latest_institute->is_active)
                                        <span class="badge badge-success">Active</span>
                                    @else
                                        <span class="badge badge-danger">Deactive</span>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        @endif                  
                      </tbody>
                    </table>
                  </div>
                  <!-- /.table-responsive -->
                </div>
                <!-- /.card-body -->
                <!-- /.card-footer -->
              </div>
        </div>
    </div>
@endsection