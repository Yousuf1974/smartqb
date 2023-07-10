@extends('layouts.admin')
@section('title', 'Online Payment')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Online Payment</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item active">
                    <a href="{{route("dashboard")}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Online Payment</li>
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
        <div class="col-md-12 col-sm-1">
            <div class="card">
                <div class="card-body">
                    <a href="{{route('payments.online_payment', ['status' => 0])}}" class="btn btn-info">Pending {{$pending_count ?? 0}}</a>
                    <a href="{{route('payments.online_payment', ['status' => 1])}}" class="btn btn-success">Approved {{$approved_count ?? 0}}</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Online Payment</h4>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-striped text-center" id="online_payment_list">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Date</th>
                                <th>Student Name</th>
                                <th>Batch</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($online_payments->isNotEmpty())
                            @foreach($online_payments as $online_payment)
                            {{-- {{dd($online_payment)}} --}}
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{date('d/m/y', strtotime($online_payment->created_at))}}</td>
                                    <td>{{$online_payment->student->student_name}}</td>
                                    <td>
                                        {{$online_payment->student->batch->batch_name}} <br/>
                                        @if($online_payment->student->batch->batch_type == 1)
                                        <span class="badge badge-dark">Monthly</span>
                                        @else 
                                        <span class="badge badge-dark">Contract</span>
                                        @endif
                                    </td>
                                    <td>{{$online_payment->paid_amount}}</td>
                                    <td>
                                        @if(!$online_payment->is_approved)
                                            <span class="badge badge-info">Pending</span>
                                        @endif
                                        @if($online_payment->is_approved) 
                                            <span class="badge badge-success">Approved</span>
                                        @endif
                                    </td>
                                    <td>
                                        @if(!$online_payment->is_approved)
                                        <form id="destroy-{{$online_payment->id}}" action="{{route('payments.online_payment_delete', ['id' => $online_payment->id])}}" method="post">
                                            @csrf @method('DELETE')
                                        </form>
                                        @endif
                                        <div class="btn-group dropleft">
                                            <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                              Action <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <div class="dropdown-menu" role="menu">                                               
                                                <a
                                                    class="dropdown-item show_btn" 
                                                    href="javascript:void(0)"
                                                    data-link="{{route('payments.online_payment_view', ['id' => $online_payment->id])}}"
                                                >
                                                    <i class="fas fa-eye"></i> View
                                                </a>
                                                @if(!$online_payment->is_approved)                                             
                                                    <a href="javascript:void(0)" data-link="{{route('payments.online_payment_approved', ['id' => $online_payment->id])}}"class="dropdown-item approved_btn" ><i class="fas fa-check"></i> Approved</a>
                                                @endif   
                                                @if(!$online_payment->is_approved)                            
                                                <a class="dropdown-item delete_btn" data-id="{{$online_payment->id}}" href="javascript:void(0)"><i class="fas fa-trash"></i> Delete</a>
                                                @endif                                                
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                            @else 
                            <tr>
                                <td class="w-100 text-center" colspan="7">No Data Found!</td>
                            </tr>
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
@endpush

@push('js')
<script>
    $(function () {
       var table = $("#online_payment_list").DataTable({});
    });

    $(document).ready(function(){
        let loading_spinner = `<div class="d-flex justify-content-center">
                        <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>
                    </div>`;

        $('.approved_btn').on('click', function(){
            var link = $(this).data('link');
            Swal.fire({
                title: 'Are you sure to approved?',
                text: "If you approved this payment, it will be merge with your payment system and won't be able to restored!",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, Approved It!'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = link;
                }
            })
        });

        $('.delete_btn').on('click', function(){
            var id = $(this).data('id');
            Swal.fire({
                title: 'Are you sure to delete?',
                text: "If you delete this you won't be able to restore this!",
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, Delete It!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#destroy-"+id).submit();
                }
            })
        });


        $('.show_btn').on('click', function(){
            let link = $(this).data('link');
            
            var request = $.ajax({
                method: "GET",
                url: link,
                beforeSend: function() {
                    $('#view_modal').modal('show');
                    $('#view_title').text('Online Payment Details');
                    $('#view_body').html(loading_spinner);
                },
                success: function(data) {
                    $('#view_body').html(data);
                }, 
                error: function (xhr, b, c) {
                    $('#view_body').html("<p class='text-center text-danger'>Somethig went worng!</p>");
                }
            })
        });
    });
</script>
@endpush