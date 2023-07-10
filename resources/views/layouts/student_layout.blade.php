<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <title>@hasSection ('title')
      @yield("title") - 
  @else
    Student Panel -
  @endif Payment System</title>

  <!-- Google Font: Source Sans Pro -->
  {{-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"> --}}
  {{-- siam rupali bangla font --}}
  {{-- <link href="https://fonts.maateen.me/siyam-rupali/font.css" rel="stylesheet"> --}}
  {{-- google font bangla and english both --}}
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Bengali:wght@400;600&family=Poppins:ital,wght@0,400;1,300;1,400&display=swap" rel="stylesheet">

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="{{asset('plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('dist/css/adminlte.min.css')}}">
{{-- sweet alert message --}}
  <link rel="stylesheet" href="{{asset('plugins/sweetalert2/sweetalert2.min.css')}}">
    <style>
      body {
          /* font-family: 'SiyamRupali', 'Source Sans Pro', sans-serif !important; */
          font-family: 'Noto Serif Bengali', 'Poppins', serif, sans-serif !important;
          /* font-family: '', sans-serif; */
      }
    </style>
  @stack('css')

</head>
<body>
<div class="wrapper"> 
  <!-- Main content -->
    <div class="content">
      <div class="container text-xs">
        <div class="row">
          <div class="col-md-12 col-sm-12">
            <div class="card">
              <div class="card-header">
                  <h4 class="card-title">Student Panel - {{auth()->guard('student')->user()->institution->name}}</h4>
              </div>
              <div class="card-body">
                  {{-- logout form --}}
                  <form action="{{route('student_logout')}}" id="logout_form" method="post">
                    @csrf
                  </form>
                  <div class="mb-2" id="full_nav">
                    <a href="{{route('student_panel')}}" class="btn btn-success btn-xs">Home</a>
                    <a href="{{route('student_panel.payment')}}" class="btn btn-success btn-xs">Payment</a>
                    <a href="{{route('student_panel.payment_history')}}" class="btn btn-success btn-xs">Payment History</a>
                    <button class="btn btn-danger btn-xs float-right" id="logout_btn">Logout</button>
                  </div>
                  <div id="mobile_nav" class="mb-2">
                    <div class="dropdown" class="float-right" >
                      <button class="btn btn-success btn-xs dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                        Menu
                      </button>
                      <div class="dropdown-menu text-sm">
                        <a class="dropdown-item" href="{{route('student_panel')}}">Home</a>
                        <a class="dropdown-item" href="{{route('student_panel.payment')}}">Payment</a>
                        <a class="dropdown-item" href="{{route('student_panel.payment_history')}}">Payment History</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-danger" href="javascript:void(0)" id="logout_btn_mobile">Logout</a>
                      </div>
                    </div>
                  </div>
                  @yield('content')
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>
<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="{{asset('plugins/jquery/jquery.min.js')}}"></script>
<!-- Bootstrap 4 -->
<script src="{{asset('plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<!-- AdminLTE App -->
<script src="{{asset('dist/js/adminlte.min.js')}}"></script>
{{-- sweet alert js --}}
<script src="{{asset('plugins/sweetalert2/sweetalert2.min.js')}}"></script>
{{-- submit logout form --}}
<script>
  if($(window).width() <= 375) {
    $('#full_nav').hide();
    $('#mobile_nav').show();
  }else {
    $('#mobile_nav').hide();
    $('#full_nav').show();
  }
  $(function () {
      $('[data-toggle="tooltip"]').tooltip();
      
    });
  $(document).ready(function(){
    $('#logout_btn').on('click', function(e){
      e.preventDefault();
      $('#logout_form').submit();
    });
    $('#logout_btn_mobile').on('click', function(e){
      e.preventDefault();
      $('#logout_form').submit();
    });
  });
  const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 5000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
  });
</script>


{{-- updated sweet alert message --}}
@if (session()->has('updated'))
<script>
  Swal.fire({
    title: 'Updated!',
    text: "{{session('updated')}}",
    icon:'success',
    timer: 5000,
  });
</script>
@endif

{{-- created sweet alert message --}}
@if (session()->has('created'))
<script>
  Swal.fire({
    icon: 'success',
    title: 'Created!',
    text: "{{session('created')}}",
    timer: 5000,
  });
</script>
@endif

{{-- delete sweet alert message --}}
@if (session()->has('deleted'))
<script>
  Swal.fire({
    title: 'Deleted!',
    text: "{{session('deleted')}}",
    incon: 'success'
    timer: 5000,
  });
</script>
@endif

  @stack('js')
</body>
</html>
