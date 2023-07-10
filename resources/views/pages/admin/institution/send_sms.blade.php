@extends('layouts.super_admin')
{{-- page title --}}
@section('title', 'Send SMS')
{{-- page header --}}
@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Send SMS</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('admin')}}">Admin</a>
                </li>
                <li class="breadcrumb-item active">
                    Send SMS
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
                <div class="card-header bg-light">
                    <h4 class="card-title">Send Institution SMS</h4>
                </div>
                <div class="card-body overflow-auto">
                    <form action="{{route('institution.send_sms')}}" method="GET">
                        <input type="hidden" name="send" value="1" />
                        <div class="form-group">
                            <label>Message</label>
                            <textarea class="form-control" name="message" cols="5" rows="3" placeholder="Write Message" required>{{request()->message}}</textarea>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" name="phone" class="form-control" placeholder="Search Phone" value="{{request()->phone}}" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-sm btn-info">Search</button>
                            @if(request()->send)
                                <a class="btn btn-sm btn-danger" href="{{route('institution.send_sms')}}">Clear</a>
                            @endif
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@if(request()->send)
<form action="{{route('institution.send_sms_submit')}}" method="POST">
    @csrf
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Send SMS List</h4>
                </div>
                <div class="card-body">
                    <table class="table table-sm table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">
                                    <div class="icheck-success border-success">
                                        <input type="checkbox" name="check_all" id="check_all"/>
                                        <label for="check_all"></label>
                                    </div>
                                </th>
                                <th class="text-center">SL</th>
                                <th>Ins. Name</th>
                                <th>Phone</th>
                                <th>Message</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($institutions->isNotEmpty())
                                @foreach($institutions as $institution)
                                    <tr>
                                        <td class="text-center">
                                            <div class="icheck-success border-success">
                                                <input type="checkbox" name="selected_id[]" value="{{$institution->id}}" id="selected_id{{$institution->id}}"/>
                                                <label for="selected_id{{$institution->id}}"></label>
                                            </div>
                                        </td>
                                        <td class="text-center">{{$loop->iteration}}</td>
                                        <td>{{$institution->name}}</td>
                                        <td>{{$institution->phone}}</td>
                                        <td>
                                            {{request()->message}}
                                            <input type="hidden" name="message[]" value="{{request()->message}}" />
                                        </td>
                                    </tr>
                                @endforeach
                            @endif
                        </tbody>
                    </table>
                </div>
                <div class="card-footer">
                    <button class="btn btn-sm btn-primary" type="submit">Send</button>
                </div>
            </div>
        </div>
    </div>
</form>
@endif
    
@endsection

{{-- extra css --}}
@push('css')
    {{-- data tables style --}}
    <link rel="stylesheet" href="{{asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}"/>
@endpush
{{-- extra js --}}
@push('js')
    {{-- DataTables  & Plugins --}}
   
@endpush

@if(session()->has('success'))
<script>
    Toast.fire({
        icon: 'success', 
        text: '{{session("success")}}',
    });
</script>
@endif


{{-- extra js for this page --}}
@push('js')
    <script>
      
        $(document).ready(function(){
            $('#check_all').on('change', function(){
                if($(this).is(":checked")) {
                    $('input[name="selected_id[]"]').each(function(index, element) {
                        $(element).prop('checked', true);
                    });
                }else {
                    $('input[name="selected_id[]"]').each(function(index, element) {
                        $(element).prop('checked', false);
                    });
                }
            })
        });

    </script>
@endpush