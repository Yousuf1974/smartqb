@extends('layouts.ins_layout')
{{-- page title --}}
@section('title', 'Institution Registration')

{{-- main content --}}
@section('content')
    <div class="row">
        <div class="col-md-8 col-sm-12 m-auto">
            
            <form action="{{route("ins.regi")}}" method="post">
                @csrf
            <div class="card mt-5">
                <div class="card-header">
                    <h4 class="card-title">Institution Registration</h4><br/>
                    <p class="m-0 text-danger"><small>* singed field is required. Please fill this field!</small></p>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="name">Institution Name*</label>
                                <input type="text" name="institution_name" id="name" class="form-control @error('institution_name') is-invalid @enderror" placeholder="Institution Name" value="{{old('institution_name')}}" required />
                                @error('institution_name') <p class="m-0 text-danger"><small>{{$message}}</small></p> @enderror
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="head_of_institution">Institution Head*</label>
                                <input type="text"  name="head_of_institution" id="head_of_institution" class="form-control @error('head_of_institution') is-invalid @enderror" value="{{old('head_of_institution')}}" placeholder="Institution Head"  required>
                                @error('head_of_institution') <p class="m-0 text-danger"><small>{{$message}}</small></p> @enderror
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="phone">Phone*</label>
                                <input type="tel" value="{{old('phone')}}" name="phone" id="phone" class="form-control @error('phone') is-invalid @enderror" placeholder="Phone Number"  required>
                                @error('phone') <p class="m-0 text-danger"><small>{{$message}}</small></p> @enderror
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label for="email">E-mail</label>
                                <input type="email" value="{{old('email')}}" name="email" id="email" class="form-control @error('email') is-invalid @enderror" placeholder="E-mail" />
                                @error('email') <p class="m-0 text-danger"><small>{{$message}}</small></p> @enderror
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="address">Address*</label>
                                <textarea name="address" class="form-control @error('address') is-invalid @enderror" id="address" cols="20" rows="3" required placeholder="Address">{{old('address')}}</textarea>
                                @error('address') <p class="m-0 text-danger"><small>{{$message}}</small></p> @enderror
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="{{url('/')}}" class="btn btn-outline-danger">Cancel</a>
                    <button type="submit" class="btn btn-danger float-right">Registeration</button>
                </div>
            </div>
            </form>
      
        </div>
    </div>
@endsection