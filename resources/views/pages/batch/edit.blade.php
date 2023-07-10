@extends('layouts.admin')
@section('title', 'Edit Batch')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Edit Batch</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("dashboard")}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="{{route("batch.index")}}">All Batch</a>
                </li>
                <li class="breadcrumb-item active">Edit Batch</li>
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
                    <h4 class="card-title">Edit Batch</h4>
                </div>
                <div class="card-body">
                    <form action="{{route('batch.update', ['batch' => $batch->id])}}" method="post">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="name">Batch Name*</label>
                                    <input type="text" name="batch_name" class="form-control form-control-sm @error('batch_name') is-invalid @enderror" value="{{$batch->batch_name}}" id="batch" placeholder="Batch Name" required>
                                    @error('batch_name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="payment_type">Batch Type*</label>
                                    <select name="batch_type" id="payment_type" class="form-control form-control-sm @error('batch_type') is-invalid @enderror">
                                        <option value="" hidden>Batch Type</option>
                                        <option @if($batch->batch_type == 1) selected @endif value="1" >Monthly</option>
                                        <option  @if($batch->batch_type == 2) selected @endif value="2" >Contract</option>
                                    </select>
                                    @error('batch_type')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch_fee">
                                        Batch Fee 
                                        <span id="batch_fee_ms">
                                            @if($batch->batch_type == 1) 
                                                (Monthly Fee) 
                                            @else 
                                                (Contract Fee) 
                                            @endif
                                        </span>*
                                    </label>
                                    <input type="number" name="batch_fee" min="0" step="1" placeholder="Batch Fee" value="{{$batch->batch_fee}}" class="form-control form-control-sm @error('batch_fee') is-invalid @enderror" required />
                                    @error('batch_fee')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch_year">Batch Year *</label>
                                    <select name="batch_year" id="batch_year" class="form-control form-control-sm @error('batch_year') is-invalid @enderror" required>
                                        <option value="" hidden>Batch Year</option>
                                        @for ($i = 0; $i < 10; $i++)
                                            <?php
                                                $year = 2020 + $i;
                                            ?>
                                            <option value="{{$year}}" @if($batch->batch_year == $year) selected @endif >{{$year}}</option>
                                        @endfor

                                        @error('batch_year')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                    </select>
                                    
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-1">
                                <div class="form-group">
                                    <label for="batch_month">Batch Month (Start) *</label>
                                    <input type="month" name="batch_start" value="{{$batch->batch_start}}" class="form-control form-control-sm @error('batch_start') is-invalid @enderror" id="batch_month" required>
                                    @error('batch_start')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch_class">Batch Class</label>
                                    <input type="text" name="batch_class" value="{{$batch->batch_class}}" id="batch_class" placeholder="Batch Class" class="form-control form-control-sm @error('batch_class') is-invalid @enderror">
                                    @error('batch_class')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="note">Batch Note</label>
                            <textarea name="batch_note" id="note" cols="30" rows="3" class="form-control form-control-sm @error('batch_note') is-invalid @enderror">{{$batch->batch_note}}</textarea>
                            @error('batch_note')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                        </div>
                        <div class="form-group">
                            
                            <input 
                                type="checkbox" 
                                name="is_active" 
                                value="1"
                                data-on="Active"
                                data-off="Deactive"
                                id="active_status"
                                data-toggle="toggle" data-size="small"
                                data-width="120"
                                data-onstyle="success"   
                                data-offstyle="warning" 
                                @if($batch->is_active) checked @endif  
                            />
                        </div>
                        <div class="form-group">
                            <button class="btn btn-dark" type="submit">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- page extra css cdn --}}
@push('css')
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"/>
@endpush

{{-- page extra js cdn --}}
@push('js')
    <!-- Bootstrap Switch -->
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
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