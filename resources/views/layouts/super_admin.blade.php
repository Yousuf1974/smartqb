<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <title>@hasSection ('title')
      @yield("title") - 
  @else
    Super Admin -
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

      body.swal2-shown > [aria-hidden="true"] {
        transition: 0.1s filter;
        filter: blur(10px);
      }

    </style>
  @stack('css')

</head>
<body class="hold-transition sidebar-mini text-sm">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="{{route('admin')}}" class="nav-link">Dashboard</a>
      </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>

      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <form action="{{route('admin.logout')}}" id="logout" method="post">@csrf</form>
      <li class="nav-item">
        <a class="nav-link" href="javascript:void(0)" id="logout_btn" role="button">
          <b>Logout</b>
        </a>
      </li>
      
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
    @include('layouts.super_admin_sidebar')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    @yield('page-header')
    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        @yield('content')
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>

  {{-- view Modal --}}
  <div class="modal fade bd-example-modal-lg" id="view_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="view_title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body overflow" id="view_body">
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-outline-danger" data-dismiss="modal">Close</button>
              </div>
        </div>
    </div>
</div>

</div>
<!-- ./wrapper -->

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
  $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    });
  $(document).ready(function(){
    $('#logout_btn').on('click', function(e){
      $('#logout').submit();
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
    incon: 'success',
    timer: 5000,
  });
</script>
@endif

  @stack('js')
</body>
</html>
