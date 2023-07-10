@extends('layouts.admin')
@section('title', 'Buy SMS')

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
                <li class="breadcrumb-item ">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Buy SMS</li>
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
                    <h4 class="card-title">Buy SMS</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 m-auto p-2 rounded">
                            {{-- stepper --}}
                            <div class="bs-stepper" id="bs-stepper">
                                <div class="bs-stepper-header" role="tablist">
                                  <!-- your steps here -->
                                  <div class="step" data-target="#packages-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="packages-part" id="packages-part-trigger">
                                      <span class="bs-stepper-circle">1</span>
                                      <span class="bs-stepper-label">Packages</span>
                                    </button>
                                  </div>
                                  <div class="line"></div>
                                  <div class="step" data-target="#total-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="total-part" id="total-part-trigger">
                                      <span class="bs-stepper-circle">2</span>
                                      <span class="bs-stepper-label">Total</span>
                                    </button>
                                  </div>
                                  <div class="line"></div>
                                  <div class="step" data-target="#payment-part">
                                    <button type="button" class="step-trigger" role="tab" aria-controls="payment-part" id="payment-part-trigger">
                                      <span class="bs-stepper-circle">3</span>
                                      <span class="bs-stepper-label">Payment</span>
                                    </button>
                                  </div>
                                </div>
                                <div class="bs-stepper-content mt-1">
                                  <!-- your steps content here -->
                                  <div id="packages-part" class="content" role="tabpanel" aria-labelledby="packages-part-trigger">
                                    {{-- packages list --}}
                                    @if($sms_packages->isNotEmpty())
                                    @foreach($sms_packages as $sms_package)
                                    <div 
                                        role="button" 
                                        class="info-box shadow-sm border next_proceed"
                                        data-quantity="{{$sms_package->quantity}}"
                                        data-validity="{{$sms_package->validity}}"
                                        data-price="{{$sms_package->price}}"
                                        data-id="{{$sms_package->id}}"
                                    >
                                        <span class="info-box-icon bg-info elevation-1"><i class="fas fa-sms"></i></span>
                                        <div class="info-box-content">
                                        <span class="info-box-text"><b>{{$sms_package->quantity}} SMS</b></span>
                                        <span class="info-box-number text-muted">
                                            {{$sms_package->validity}} Days
                                            <span class="float-right">
                                                {{$sms_package->price}} TK <i class="right fas fa-angle-right"></i>
                                            </span>
                                        </span>
                                        </div>
                                    </div>
                                    @endforeach
                                    @else 
                                        <div>
                                            <p class="text-muted text-center">No Data Found!!!</p>
                                        </div>
                                    @endif
                                  </div>
                                  <div id="total-part" class="content" role="tabpanel" aria-labelledby="total-part-trigger">
                                        <div class="">
                                            <p class="text-center text-uppercase"><b>Total</b></p>
                                            <p>Quantity: <b class="float-right"><span id="total_quantity">&nbsp;</span> (SMS)</b></p>
                                            <p>Validity : <b class="float-right"><span id="total_validity">&nbsp;</span> (Days)</b></p>
                                            <p>Price : <b class="float-right"><span id="total_price">&nbsp;</span> (TK)</b></p>
                                            <hr/>
                                            <p class="text-center">
                                                <button class="btn btn-sm btn-outline-dark previous_proceed">Cancel</button>
                                                <button class="btn btn-sm btn-danger" id="total_next">Next</button>
                                            </p>
                                        </div>
                                        
                                  </div>
                                  <div id="payment-part" class="content" role="tabpanel" aria-labelledby="payment-part-trigger">
                                        
                                        {{-- <p class="text-center">
                                            <button class="btn btn-sm btn-outline-dark previous_proceed">Cancel</button>
                                            <button class="btn btn-sm btn-danger">
                                                Pay With Bkash
                                            </button>
                                        </p> --}}
                                  </div>
                                </div>
                            </div>                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bs-stepper/dist/css/bs-stepper.min.css">
@endpush

{{-- extra js --}}
@push('js')
    <script src="https://cdn.jsdelivr.net/npm/bs-stepper/dist/js/bs-stepper.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.info-box').on('mouseover', function(){
                $(this).addClass('shadow');
            });

            $('.info-box').on('mouseleave', function(){
                $(this).removeClass('shadow');
            });

            let loading_spinner = `<div class="d-flex justify-content-center">
                        <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>
                    </div>`;

            var stepper = new Stepper(document.querySelector('#bs-stepper'));
            var quantity;
            var validity;
            var price;
            var id;
            $('.next_proceed').click(function(){
                quantity = $(this).data('quantity');
                validity = $(this).data('validity');
                price = $(this).data('price');
                id = $(this).data('id');
                $('#total_quantity').text(quantity);
                $('#total_validity').text(validity);
                $('#total_price').text(price);    
                stepper.next();
            });

            $('#total_next').click(function(){
                stepper.next();
                var request = $.ajax({
                    type: "POST",
                    url: "{{route('sms_buy_store')}}",
                    data: {
                        quantity,
                        validity,
                        price, 
                        id, 
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    beforeSend: function() {
                        $('#payment-part').html(loading_spinner);
                    },
                    success: function(data){
                        $('#payment-part').html(data);
                    }
                });
                request.fail(function(err){
                    $('#payment-part').html('<p class="text-center">Something went worng!</p>');
                });
            });


            $(document).on('click', '.previous_proceed', function(){
                stepper.previous();
            });
            

        })
    </script>
@endpush