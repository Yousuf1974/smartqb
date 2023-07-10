<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>@hasSection ('title')
      @yield("title") - 
  @else
    Dashboard -
  @endif Payment Systemt</title>

  <!-- Google Font: Source Sans Pro -->
  <!--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">-->
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="{{asset('plugins/fontawesome-free/css/all.min.css')}}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('dist/css/adminlte.min.css')}}">
{{-- sweet alert message --}}
  <link rel="stylesheet" href="{{asset('plugins/sweetalert2/sweetalert2.min.css')}}">
{{-- extra cdn --}}
  @stack('css')

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <div class="container-fluid">
        @yield('content')
    </div>
</div>

<!-- jQuery -->
<script src="{{asset('plugins/jquery/jquery.min.js')}}"></script>
<!-- Bootstrap 4 -->
<script src="{{asset('plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
{{-- extra js/cdn --}}
@stack('js')
</body>
</html>
