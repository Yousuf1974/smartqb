@extends('layouts.admin')
@section('title', 'Create Batch')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Create Batch</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Add Batch</li>
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
                    <h4 class="card-title">
                        Create Batch
                    </h4>
                </div>
                <div class="card-body">
                    <form action="{{route('batch.store')}}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="name">Batch Name*</label>
                                    <input type="text" name="batch_name" class="form-control form-control-sm @error('batch_name') is-invalid @enderror" value="{{old('batch_name')}}" id="batch" placeholder="Batch Name" required>
                                    @error('batch_name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="payment_type">Batch Type*</label>
                                    <select name="batch_type" id="payment_type" class="form-control form-control-sm @error('batch_type') is-invalid @enderror">
                                        <option value="" hidden>Batch Type</option>
                                        <option @if(old('batch_type') == 1) selected @endif value="1" >Monthly</option>
                                        <option  @if(old('batch_type') == 2) selected @endif value="2" >Contract</option>
                                    </select>
                                    @error('batch_type')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch_fee">
                                        Batch Fee <span id="batch_fee_ms"></span> *</label>
                                    <input type="number" name="batch_fee" min="0" step="1" placeholder="Batch Fee" value="{{old('batch_fee')}}" class="form-control form-control-sm @error('batch_fee') is-invalid @enderror" required />
                                    @error('batch_fee')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch_year">Batch Year*</label>
                                    <select name="batch_year" id="batch_year" class="form-control form-control-sm @error('batch_year') is-invalid @enderror" required>
                                        <option value="" hidden>Batch Year</option>
                                        @for ($i = 0; $i < 10; $i++)
                                            <?php
                                                $year = 2020 + $i;
                                            ?>
                                            <option value="{{$year}}" @if($year == date('Y')) selected @endif >{{$year}}</option>
                                        @endfor

                                        @error('batch_year')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                    </select>
                                    
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-1">
                                <div class="form-group">
                                    <label for="batch_month">Batch Month (Start)*</label>
                                    <input type="month" name="batch_start" value="{{old('batch_start')}}" class="form-control form-control-sm @error('batch_start') is-invalid @enderror" id="batch_month" required>
                                    @error('batch_start')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch_class">Batch Class</label>
                                    <input type="text" name="batch_class" value="{{old('batch_class')}}" id="batch_class" placeholder="Batch Class" class="form-control form-control-sm @error('batch_class') is-invalid @enderror">
                                    @error('batch_class')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note">Batch Note</label>
                            <textarea name="batch_note" id="note" cols="30" rows="3" class="form-control form-control-sm @error('batch_note') is-invalid @enderror">{{old('batch_note')}}</textarea>
                            @error('batch_note')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                        </div>
                        <div class="form-group">
                            <button class="btn btn-dark" type="submit">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


{{-- extra js cdn --}}
@push('js')
  
@endpush

{{-- extra js for this page --}}
@push('js')
    <script>
       $(document).ready(function(){
            $('#payment_type').on('change', function(){
                if($(this).val() == 1) {
                    $('#batch_fee_ms').text('(Monthly Fee)');
                }else {
                    $('#batch_fee_ms').text('(Contract Fee)');
                }
            });
        });
    </script>
@endpush