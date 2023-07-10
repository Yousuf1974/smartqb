<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('dashboard')}}" class="brand-link text-center">
      <span class="brand-text font-weight-light"><b>{{config('app.name')}}</b></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="{{asset('dist/img/profile_avatar.png')}}" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="javascript:void(0)" class="d-block">{{auth()->user()->name}}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="{{route('dashboard')}}" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Dashboard
                {{-- <span class="right badge badge-danger">New</span> --}}
              </p>
            </a>
          </li>

          {{-- institution module --}}
          {{-- @can('institution-index')
          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-home"></i>
              <p>
                Institution
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{route('institution.index')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Institution List</p>
                </a>
              </li>
            </ul>
          </li>
          @endcan --}}

          {{-- payment module --}}
          @canany(['payment-index', 'payment-create', 'payment-update', 'payment-destroy'])
          <li class="nav-item">
            <a href="javascript:void(0)" class="nav-link">
              <i class="nav-icon fas fa-credit-card"></i>
              <p>
                Payments
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              @can('payment-index')
              <li class="nav-item">
                <a href="{{route('payments.index')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  Payment List
                </a>
              </li>
              @endcan

              @can("payment-create")
              <li class="nav-item">
                <a href="{{route('payments.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  Add Payment
                </a>
              </li>
              @endcan

              @can("payment-create")
              <li class="nav-item">
                <a href="{{route('payments.quick')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  Quick Payment
                </a>
              </li>
              @endcan
            </ul>
          </li>
          @endcanany

          {{-- online payment --}}
          <li class="nav-item">
            <a href="javascript:void(0)" class="nav-link">
              <i class="nav-icon fas fa-credit-card"></i>
              <p>
                Online Payments                
                <i class="right fas fa-angle-left"></i>
                @if($online_payment_count > 0)
                <i class="right fa fa-bell text-danger"></i>
                @endif
              </p>
            </a>
            <ul class="nav nav-treeview">              
              <li class="nav-item">
                <a href="{{route('payments.online_payment')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Online Payment List @if($online_payment_count > 0)<span class="badge badge-warning">{{$online_payment_count}}</span>@endif</p>
                </a>
              </li>
            </ul>
          </li>

          {{-- student module --}}
          @canany(['student-index', 'student-create', 'student-update', 'student-destroy'])
          <li class="nav-item">
            <a href="javascript:void(0)" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Students
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              @can('student-index')
              <li class="nav-item">
                <a href="{{route('students.index')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Student List</p>
                </a>
              </li>
              @endcan
              
              @can('student-create')
              <li class="nav-item">
                <a href="{{route('students.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Student</p>
                </a>
              </li>
              @endcan
            </ul>
          </li>
          @endcanany

          {{-- user module --}}
          @canany(['user-index', 'user-create', 'user-update', 'user-destroy', 'miscellaneous-user_permission'])
          <li class="nav-item">
            <a href="javascript:void(0)" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Users
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              @can('user-index')
              <li class="nav-item">
                <a href="{{route('users')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>User List</p>
                </a>
              </li>
              @endcan
              @can('user-create')
              <li class="nav-item">
                <a href="{{route('users.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add User</p>
                </a>
              </li>
              @endcan
            </ul>
          </li>
          @endcanany

          {{-- SMS Module --}}
          @canany([
            'miscellaneous-custom_sms_send', 'miscellaneous-sms_history', 'miscellaneous-sms_template', 'miscellaneous-sms_buy',
            'sms-index', 'sms-create', 'sms-destroy', 'sms-update',
          ])
          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-sms"></i>
              <p>
                SMS
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              @can('miscellaneous-custom_sms_send')
              <li class="nav-item">
                <a href="{{route("custom_sms_send")}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Custom SMS Send</p>
                </a>
              </li>
              @endcan

              @can('miscellaneous-sms_history')
              <li class="nav-item">
                <a href="{{route("sms.history")}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>SMS History</p>
                </a>
              </li>
              @endcan

              @can('miscellaneous-sms_template')
              <li class="nav-item">
                <a href="{{route("sms.template")}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>SMS Template</p>
                </a>
              </li>
              @endcan 

              @can('miscellaneous-sms_buy')
              <li class="nav-item">
                <a href="{{route("sms_buy")}}" target="_blank" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Buy SMS</p>
                </a>
              </li>
              @endcan 

            {{-- @can('miscellaneous-sms_purchase_history')
              <li class="nav-item">
                <a href="{{route("sms_purchase_history")}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>SMS Purchase History</p>
                </a>
              </li>
             @endcan --}}

              {{-- @canany(['sms-index', 'sms-create', 'sms-destroy', 'sms-update'])
              <li class="nav-item">
                <a href="{{route('sms.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>SMS Package</p>
                </a>
              </li>
              @endcan --}}
            </ul>
          </li>
          @endcan

          {{-- report module --}}
          @canany(['report-student', 'report-payment'])
          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>
                Reports
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              @can('report-student')
              <li class="nav-item">
                <a href="{{route("report.student")}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Student Report</p>
                </a>
              </li>
              @endcan

              @can('report-payment')
              <li class="nav-item">
                <a href="{{route('report.payment')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Payment Report</p>
                </a>
              </li>
              @endcan

              @can('report-student_payment')
              <li class="nav-item">
                <a href="{{route('report.student_payment')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Student Payment Report</p>
                </a>
              </li>
              @endcan
            </ul>
          </li>
          @endcanany

          
          {{-- 'role-index', 'role-create', 'role-update', --}}
          {{-- settings module --}}
          @canany([ 
            'batch-index', 'batch-crate', 'batch-update', 'batch-destroy', 
            'miscellaneous-general_setting', 'miscellaneous-institution_setting'
          ])
          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-cogs"></i>
              <p>
                Settings
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              @can('miscellaneous-institution_setting')
              <li class="nav-item">
                <a href="{{route('settings.institution')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Institution Settings</p>
                </a>
              </li>
              @endcan
              
              {{-- @canany(['role-index', 'role-create', 'role-update', 'role-destroy']) --}}
              {{-- <li class="nav-item">
                <a href="{{route('roles.index')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Role</p>
                </a>
              </li> --}}
              {{-- @endcanany --}}

              @can('batch-index')
              <li class="nav-item">
                <a href="{{route('batch.index')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Batch List</p>
                </a>
              </li>
              @endcan

              @can('batch-create')
              <li class="nav-item">
                <a href="{{route('batch.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Batch</p>
                </a>
              </li>
              @endcan

            </ul>
          </li>
          @endcanany
        </ul>
      </nav>
     
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>