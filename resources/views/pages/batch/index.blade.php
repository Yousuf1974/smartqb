@extends('layouts.admin')
@section('title', 'Batch List')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Batch List</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Batch</li>
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
                    <h4 class="card-title">Batch List</h4>
                </div>
                <div class="card-body">
                    <div class="col-md-12 col-sm-12">
                        <div style="overflow-x: auto">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>Batch Name</th>
                                    <th>Batch Type</th>
                                    <th>Fee</th>
                                    <th>Batch Year</th>
                                    <th>Batch Class</th>
                                    <th>Batch Start</th>
                                    <th>Ins. Name</th>
                                    <th>Total Student</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if($batches->isEmpty())
                                    <tr>
                                        <td colspan="9" class="text-center">No Batch Found</td>
                                    </tr>
                                @endif

                                @foreach ($batches as $key => $batch)
                                    <tr>
                                        <td>{{$key + 1}}</td>
                                        <td>{{$batch->batch_name}}</td>

                                        <td>
                                            @if($batch->batch_type == 1)
                                                Monthly
                                            @elseif($batch->batch_type == 2)
                                                Contract
                                            @endif
                                        </td>
                                        <td>{{$batch->batch_fee}}</td>
                                        <td>{{$batch->batch_year}}</td>
                                        <td>{{$batch->batch_class}}</td>
                                        <td>
                                            @if($batch->batch_start)
                                                {{date("M,y", strtotime($batch->batch_start . "-01"))}}
                                            @else
                                                N/A
                                            @endif
                                        </td>
                                        <td>
                                            {{$batch->institution->name ?? "N/A"}} <br/>
                                            @if(auth()->user()->level == 'Super Admin')
                                            <span class="badge badge-info">{{$batch->institution->head_of_institution ?? "N/A"}}|{{$batch->institution->phone ?? "N/A"}}</span>
                                            @endif
                                        </td>
                                        <td>
                                            {{ $batch->students_count }}
                                        </td>
                                        <td>
                                            @if($batch->is_active)
                                                <span class="badge badge-success">Active</span>
                                            @else
                                                <span class="badge badge-danger">Deactive</span>
                                            @endif
                                        </td>
                                        <td>
                                            {{-- action button --}}
                                            @canany(['batch-edit', 'batch-update', 'batch-destroy'])
                                            <div class="btn-group dropleft">
                                                <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                                Action <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <div class="dropdown-menu" role="menu">
                                                @can('batch-index')
                                                    <a class="dropdown-item show_btn" href="javascript:void(0)" data-link="{{route('batch.show', ['batch' => $batch->id])}}"><i class="fas fa-eye"></i> Show</a>
                                                @endcan
                                                @can('batch-update')
                                                    <a class="dropdown-item edit_btn" href="{{route('batch.edit', ['batch' => $batch->id])}}"><i class="fas fa-edit"></i> Edit</a>
                                                @endcan
                                                @can('batch-destroy')
                                                    <form id="destroy-{{$batch->id}}" action="{{route('batch.destroy', ['batch' => $batch->id])}}" method="post">
                                                        @csrf @method('DELETE')
                                                    </form>
                                                    <button class="dropdown-item delete_btn" data-id="{{$batch->id}}" type="button"><i class="fas fa-trash"></i>  Delete</button>
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
        </div>
    </div>
@endsection

{{-- extra js for this page --}}
@push('js')
    <script>
        $(document).ready(function(){
            let loading_spinner = `<div class="d-flex justify-content-center">
                        <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>
                    </div>`;

            // view batch
            $('.show_btn').on('click', function(){
                let link = $(this).data('link');
                let request = $.ajax({
                    method: "GET",
                    url: link,
                    beforeSend: function(){
                        $('#view_modal').modal('show');
                        $('#view_title').text('Batch Details');
                        $('#view_body').html(loading_spinner);
                    },
                    success: function(data){
                        $('#view_body').html(data);
                    }
                });
                request.fail(function(xhr, status){
                    $('#view_body').html(status);
                });
            });

            // delete batch
            $('.delete_btn').on('click', function(){
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure to Delete?',
                    text: "You won't be able to undo this. Will you deleted all information, which is related with batch?",
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
            })

        });
    </script>
@endpush
