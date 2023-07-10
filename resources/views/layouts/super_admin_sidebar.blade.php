<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('admin')}}" class="brand-link text-center">
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
          <a href="javascript:void(0)" class="d-block">{{auth()->guard('admin')->user()->name}}</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="{{route('admin')}}" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Admin Panel
                {{-- <span class="right badge badge-danger">New</span> --}}
              </p>
            </a>
          </li>

          {{-- institution module --}}
          
          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-users"></i>
              <p>
                Admin Users
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{route('admin.users')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>User List</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('admin.users.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>User Create</p>
                </a>
              </li>
            </ul>
          </li>
        
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
              <li class="nav-item">
                <a href="{{route('institution.send_sms')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Send SMS</p>
                </a>
              </li>
            </ul>
          </li>
        
          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-sms"></i>
              <p>
                SMS
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{route('sms.create')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>SMS Package</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('admin.sms_purchase_history')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>SMS Purchase History</p>
                </a>
              </li>
            </ul>
          </li>          

          <li class="nav-item">
            <a href="javascript:void()" class="nav-link">
              <i class="nav-icon fas fa-cogs"></i>
              <p>
                Settings
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="{{route('settings.general')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General Settings</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="{{route('user.admin.permission')}}" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Client Admin Permission</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="javascript:void(0)" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Database Backup</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
     
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>