@extends('layouts.admin')
@section('title', 'SMS Purchase History')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">SMS Purchase History</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item ">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">SMS Purchase History</li>
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
                    <h4 class="card-title">SMS Purchase History</h4>
                </div>
                <div class="card-body">
                    <table id="purchase_history" class="table table-sm table-bordered text-center">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Purchase Date</th>
                                <th>Institution</th>
                                <th>Validity</th>
                                <th>Quantity</th>                                
                                <th>Price</th>                                
                            </tr>
                        </thead>
                        <tbody>
                        @if($sms_purchase_histories->isNotEmpty())
                        @foreach($sms_purchase_histories as $sms_purchase_history)
                            <tr>
                                <td>{{$loop->iteration}}</td>
                                <td>{{date('d/m/y', strtotime($sms_purchase_history->created_at))}}</td>
                                <td>{{$sms_purchase_history->institution->name}}</td>
                                <td>{{$sms_purchase_history->validity}} Days</td>
                                <td>{{$sms_purchase_history->quantity}}</td>
                                <td>{{number_format($sms_purchase_history->price, 2)}}</td>
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
@endsection

{{-- extra css --}}
@push('css')
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
@endpush

{{-- extra js --}}
@push('js')
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

@push('js')
<script>
    $(function () {
        $("#purchase_history").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": false,
        "buttons": [
            "csv", "excel", "pdf","print", "colvis"
        ],
        }).buttons().container().appendTo('#user_list_wrapper .col-md-6:eq(0)');
    });
</script>
@endpush