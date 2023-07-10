@extends('layouts.admin')

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
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
@endsection

{{-- main content --}}
@section('content')
    @canany(['payment-create', 'student-create', 'batch-create', 'payment-index'])
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card card-light">
                <div class="card-header">
                    <h4 class="card-title">Quick Access</h4>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                          <i class="fas fa-minus"></i>
                        </button>
                        
                        <button type="button" class="btn btn-tool" data-card-widget="remove">
                          <i class="fas fa-times"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                      @can('payment-create')
                        <div class="col-md-2 col-sm-12 p-1">
                            <a href="{{route('payments.quick')}}" class="btn btn-info w-100">Quick Payment</a>
                        </div>
                      @endcan

                      @can('student-create')
                        <div class="col-md-2 col-sm-12 p-1">
                            <a href="{{route('students.create')}}" class="btn btn-success w-100">Add Student</a>
                        </div>
                      @endcan

                      @can('batch-create')
                        <div class="col-md-2 col-sm-12 p-1">
                            <a href="{{route('batch.create')}}" class="btn btn-primary w-100">Add Batch</a>
                        </div>
                      @endif

                      @can('payment-index')
                        <div class="col-md-2 col-sm-12 p-1">
                            <a href="{{route('payments.index')}}" class="btn btn-info w-100">Payment List</a>
                        </div>
                      @endcan

                      @can('miscellaneous-sms_buy')
                        <div class="col-md-2 col-sm-12 p-1">
                            <a href="{{route('sms_buy')}}" target="_blank" class="btn btn-success w-100">Buy SMS</a>
                        </div>
                      @endcan
                      <div class="col-md-2 col-sm-12 p-1">
                          <a target="_blank" href="{{$user_manual_link ?? "#"}}" class="btn btn-danger w-100">View User Manual</a>
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endcanany
    {{-- mini card information --}}
    <div class="row">
        <div class="col-12 col-sm-6 col-md-3">
          @if(auth()->user()->level == 'Super Admin')
            <div class="info-box">
                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-home"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text"><b>Institutions</b></span>
                  <span class="info-box-number">                    
                    {{$total_institution}}
                    <small></small>
                  </span>
                </div>
            </div>
          @else 
          <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-sms"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>SMS</b></span>
                  <span class="info-box-number">                    
                    Total SMS: <span id="total_sms"></span>
                  </span>
                  <small></small>
                </span>
              </div>
          </div>
          @endif
              <!-- /.info-box -->
        </div>
      

        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-primary elevation-1"><i class="fas fa-users"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Students</b></span>
                <span class="info-box-number">
                  {{$total_student}}
                  <small></small>
                </span>
              </div>
            </div>
            <!-- /.info-box -->
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-users"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Users</b></span>
                <span class="info-box-number">
                  {{$total_user}}
                  <small></small>
                </span>
              </div>
            </div>
            <!-- /.info-box -->
        </div>
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-credit-card"></i></span>
              <div class="info-box-content">
                <span class="info-box-text"><b>Payments</b></span>
                <span class="info-box-number">
                  {{$total_payment}}
                  <small></small>
                </span>
              </div>
            </div>
            <!-- /.info-box -->
        </div>
    </div>
    <div class="row">
      <div class="col-md-8 col-sm-12">
        <!-- TABLE: LATEST Payments -->
        <div class="card card-light">
          <div class="card-header border-transparent">
            <h3 class="card-title">Latest Payments</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body p-0">
            <div class="table-responsive">
              <table class="table m-0">
                <thead>
                <tr>
                  <th>Ref. No</th>
                  <th>Date</th>
                  <th>Student</th>
                  <th>Batch</th>
                </tr>
                </thead>
                <tbody>
                @if($latest_payments->isNotEmpty())
                @foreach($latest_payments as $latest_payment)
                <tr>
                  <td>{{$latest_payment->ref_no}}</td>
                  <td>{{date('d,M-y', strtotime($latest_payment->payment_date))}}</td>
                  <td>{{$latest_payment->student->student_name}}</td>
                  <td>
                    {{$latest_payment->student->batch->batch_name}}
                  </td>
                </tr>
                @endforeach
                @endif
                
                </tbody>
              </table>
            </div>
            <!-- /.table-responsive -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer clearfix">
            @can('payment-create')
            <a href="{{route('payments.create')}}" class="btn btn-sm btn-info float-left">Create New Payment</a>
            @endcan
            @can('payment-index')
            <a href="{{route('payments.index')}}" class="btn btn-sm btn-dark float-right">Payment List</a>
            @endcan
          </div>
          <!-- /.card-footer -->
        </div>
      </div>

      <div class="col-md-4 col-sm-12">
        <div class="card card-light">
          <div class="card-header">
            <h3 class="card-title">Recently Added Students</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body p-0">
            <ul class="products-list product-list-in-card pl-2 pr-2">
              @if($latest_students->isNotEmpty())
              @foreach($latest_students as $latest_student)
              <li class="item">
                <div class="product-img">
                  @if($latest_student->user_profile)
                  <img src="{{asset('/storage/students/'.$latest_student->user_profile)}}" alt="Product Image" class="img-size-50 img-rounded" />
                  @else 
                  <img src="{{asset("/dist/img/profile_avatar.png")}}" alt="Product Image" class="img-size-50" />                  
                  @endif
                </div>
                <div class="product-info">
                  <a href="javascript:void(0)" class="product-title">{{$latest_student->student_name}}
                    <span class="badge badge-dark text-light float-right">{{$latest_student->batch->batch_name}}</span></a>
                  <span class="product-description">
                    <i class="fa fa-calendar"></i> {{date('d-M,y', strtotime($latest_student->admission_date))}}
                    @if($latest_student->student_contact)
                    <i class="fa fa-phone"></i> {{$latest_student->student_contact}} (St.)
                    @else 
                    <i class="fa fa-phone"></i> {{$latest_student->guardian_contact}} (Gr.)
                    @endif
                  </span>
                </div>
              </li>
              @endforeach
              @endif
              <!-- /.item -->
              
            </ul>
          </div>
          <!-- /.card-body -->
          <div class="card-footer text-center">
            <a href="{{route('students.index')}}" class="uppercase">View All Student</a>
          </div>
          <!-- /.card-footer -->
        </div>
      </div>
    </div>
@endsection

@push('js')
<script>
    $(document).ready(function(){
       $.ajax({
           url: "{{route('sms.balance_check')}}",
           method: 'GET',
           beforeSend: function(){
               $('#total_sms').text('Loading...');
           },
           success: function(data) {
               $('#total_sms').text(data);
           }
       })
    });
</script>
@endpush
