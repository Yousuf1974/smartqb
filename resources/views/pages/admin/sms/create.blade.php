@extends('layouts.super_admin')
@section('title', 'SMS Package Create')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Dashboard</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a class="breadcrumb-item" href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">SMS Package</li>
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
                    <h4 class="card-title">SMS Package Create</h4>
                </div>
                <div class="card-body">
                    <div class="row">                        
                        <div class="col-md-4 col-sm-12 border rounded p-2">
                            <form action="{{route('sms.store')}}" method="POST">
                                @csrf
                                <div class="form-group">
                                    <label for="qty">Quantity* (Pcs)</label>
                                    <input type="number" name="quantity" value="{{old('quantity')}}" id="qty" min="0" step="1" class="form-control form-control-sm" placeholder="Quantity" required>
                                    @error('quantity')
                                    <p class="text-danger"><small>{{$message}}</small></p>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="validity">Validity* (Day)</label>
                                    <input type="number" name="validity" id="validity" value="{{old('validity')}}" min="0" step="1" class="form-control form-control-sm" placeholder="Validity(Day)" required>
                                    @error('validity')
                                    <p class="text-danger"><small>{{$message}}</small></p>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <label for="price">Price*</label>
                                    <input type="number" name="price" id="price" value="{{old('price')}}" min="0" step="1" class="form-control form-control-sm" placeholder="Price" required>
                                    @error('price')
                                    <p class="text-danger"><small>{{$message}}</small></p>
                                    @enderror
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-sm btn-dark">Create</button>
                                </div>
                            </form>
                        </div>                       
                        <div class="col-md-8 col-sm-12 p-2">
                            <table class="table table-sm table-bordered text-center" id="package_list">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>&nbsp;</th>
                                        <th>Quantity</th>
                                        <th>Validity</th>                                        
                                        <th>Price</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if($sms_packages->isNotEmpty())
                                    @foreach($sms_packages as $sms_package)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>
                                            @if($sms_package->is_active)
                                                <span class="badge badge-success">Active</span>
                                            @else 
                                                <span class="badge badge-danger">Deactive</span>
                                            @endif
                                        </td>
                                        <td>{{$sms_package->quantity}} Pcs</td>
                                        <td>{{$sms_package->validity}} Days</td>
                                        <td>{{number_format($sms_package->price, 2)}}</td>
                                        <td>
                                            {{-- delete form --}}
                                            <form id="delete_{{$sms_package->id}}" action="{{route("sms.destroy", ['sms' => $sms_package->id])}}" method="post">
                                                @csrf
                                                @method('DELETE')
                                            </form>
                                            
                                            <button data-link="{{route('sms.edit', ['sms' => $sms_package->id])}}" class="editBtn btn btn-xs btn-outline-info">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            
                                            <button data-id="{{$sms_package->id}}" class="delete_btn btn btn-xs btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>                                            
                                        </td>
                                    </tr>
                                    
                                    @endforeach
                                    @else 
                                        <tr>
                                            <td class="text-center" colspan="6">No Data Found!</td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
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
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
@endpush
{{-- extra js --}}
@push('js')
    {{-- DataTables  & Plugins --}}
    <script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script> 
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <script>
        $(function () {
            $("#package_list").DataTable({});
        });

        $(document).ready(function(){
            let loading_spinner = `<div class="d-flex justify-content-center">
                        <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>
                    </div>`;

            $(".editBtn").click(function(){
                $('#view_modal').modal('show');
                $('#view_title').text('Package Edit');
                $('#view_body').html(loading_spinner);
                $.get($(this).data('link'), function(data){
                    $('#view_body').html(data);
                }).fail(function(){
                    $('#view_body').html(`<p class="text-center text-danger">Something went worng!</p>`);
                });
            });

            $('.delete_btn').click(function(){
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
                        $('#delete_'+id).submit();
                    }
                })
            });
        });

    </script>
@endpush