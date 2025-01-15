@extends('layouts.super_admin')
@section('title', 'Institution Details')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Admin</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("admin")}}">Admin</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="{{route("institution.index")}}">Institution List</a>
                </li>
                <li class="breadcrumb-item active">Institution Details</li>
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
            <a class="btn btn-sm btn-info" href="{{route('institution.index')}}">Back</a>
        </div>
    </div>
    &nbsp;
    <div class="row">
        <div class="col-md-4 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Institution Details</h4>
                </div>
                <div class="card-body">
                    <table class="table-sm table-bordered table">
                        <caption>Institution Details</caption>
                        <tbody>
                            <tr>
                                <th>Id</th>
                                <td>{{$institution->id}}</td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td>{{$institution->name}}</td>
                            </tr>
                            <tr>
                                <th>Head Of Ins.</th>
                                <td>{{$institution->head_of_institution}}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>{{$institution->phone}}</td>
                            <tr>
                                <th>Psw</th>
                                <td>{{$institution->admin()->raw_psw ?? "N/A"}}</td>
                            </tr>
                            <tr>
                                <th>E-mail</th>
                                <td>{{$institution->email ?? "N/A"}}</td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td>{{$institution->address ?? "N/A"}}</td>
                            </tr>
                            <tr>
                                <th>Registration Date</th>
                                <td>{{date('d-M-Y', strtotime($institution->created_at))}}</td>
                            </tr>
                            <tr>
                                <th>Total Stuent</th>
                                <td>{{$institution->students->count()}}</td>
                            </tr>
                            <tr>
                                <th>Active Status</th>
                                <td>
                                    @if($institution->is_active)
                                        <span class="badge badge-success">Active</span>
                                    @else
                                        <span class="badge badge-danger">Inactive</span>
                                    @endif
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-8 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">User List</h4>
                </div>
                <div class="card-body overflow-auto">
                    <table class="table table-sm table-bordered" id="user_list">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>E-mail</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($institution->users->isNotEmpty())
                            @foreach($institution->users as $user)

                            <tr>
                                <td>{{$loop->iteration}}</td>
                                <td>{{$user->name}}</td>
                                <td>{{$user->phone}}</td>
                                <td>{{$user->email ?? "N/A"}}</td>
                                <td>
                                    {!!
                                        $user->getRoleNames()->isNotEmpty()
                                            ? $user->getRoleNames()->map(function ($role) {
                                                return "<span class='badge badge-info'>{$role}</span>";
                                            })->implode('&nbsp;')
                                            : "N/A"
                                    !!}
                                </td>
                                <td>
{{--                                    <span class="badge badge-success">Active</span>--}}
                                    <div class="form-group">
                                        <input
                                            class="user_status"
                                            type="checkbox"
                                            value="1"
                                            data-toggle="toggle" data-size="small"
                                            data-onstyle="success"
                                            data-offstyle="warning"
                                            @if($user->active_status) checked @endif
                                            data-user-id="{{$user->id}}"
                                        />
                                    </div>


                                </td>
                                <td>
                                    <div class="btn-group dropleft">
                                        <button type="button" class="btn btn-outline-dark btn-xs dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                            Action <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <div class="dropdown-menu" role="menu">
                                        <a class="dropdown-item" target="_blank" href="{{route('admin.user.login', ['id' => $user->id])}}"><i class="fas fa-eye"></i> Login</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                            @else
                            <tr>
                                <td colspan="7">No Data Found</td>
                            </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
            </div>

            <!--comments box about institution-->
            <form action="{{route('institution.comment', ['institution' => $institution->id])}}" method="POST">
                @csrf
                <div class="card">
                    <div class="card-header bg-light">
                        <h4 class="card-title">Comment</h4>
                    </div>
                    <div class="card-body">
                        <textarea class="form-control" name="comment" rows="5" cols="5" placeholder="Write Your Comment...">{{$institution->comment}}</textarea>
                    </div>
                    <div class="card-footer">
                        <button  class="btn btn-sm btn-dark" type="submit">Save</button>
                    </div>
                </div>
            </form>

            @php
                $regManagerData = $institution->registrationManagers()->orderBy("id", "desc")->get()->toArray();
            @endphp
            <div class="card">
                <div class="card-header bg-light">
                    <h4 class="card-title">Registration Manager</h4>
                </div>
                <div class="card-body">
                    <form action="{{ route('institution.registration.manager', ['institution' => $institution->id]) }}" method='POST' >
                        @csrf
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <lable>From Date</lable>
                                <input type="date" name="from_date" id="from_date" class="form-control form-control-sm"
                                       value="{{ !empty($regManagerData[0]['valid_from']) ? \Carbon\Carbon::parse($regManagerData[0]['valid_from'])->format("Y-m-d") : '' }}" />
                            </div>
                            <div class="col-md-6 form-group">
                                <lable>To Date</lable>
                                <input type="date" name="to_date" id="to_date" class="form-control form-control-sm"
                                       value="{{ !empty($regManagerData[0]['valid_to']) ? \Carbon\Carbon::parse($regManagerData[0]['valid_to'])->format("Y-m-d") : '' }}" />
                            </div>
                            <div class="col-md-6 form-group">
                                <lable>Account Renew Fee</lable>
                                <input type="number" placeholder="Account Renew Fee" min="0" step="1" name="account_renew_fee" class="form-control form-control-sm"
                                       value="{{ !empty($regManagerData[0]['account_renew_fee']) ? $regManagerData[0]['account_renew_fee'] : '' }}"/>
                            </div>
                            <div class="col-md-6 form-group">
                                <lable>Total Days</lable>
                                <input type="number" placeholder="Total Days" min="0" step="1" name="total_days" id="total_days" class="form-control form-control-sm"
                                       value="{{ !empty($regManagerData[0]['total_days']) ? $regManagerData[0]['total_days'] : '' }}"/>
                            </div>

                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-sm btn-success">Save</button>
                        </div>
                    </form>

                    <table class="table table-sm table-bordered">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>From Date</th>
                                <th>To Date</th>
                                <th>Account Renew Fee</th>
                                <th>Total Days</th>
                                <th>Remaining Days</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($regManagerData as $registrationManager)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>
                                    {{ \Carbon\Carbon::parse($registrationManager['valid_from'])->format("d-M-Y") }}
                                </td>
                                <td>
                                    {{ \Carbon\Carbon::parse($registrationManager['valid_to'])->format("d-M-Y") }}
                                </td>
                                <td>
                                    {{ $registrationManager['account_renew_fee'] ?? 0 }}
                                </td>
                                <td>
                                    {{ $registrationManager['total_days'] ?? 0 }}
                                </td>
                                <td>
                                    <?php
                                        $validTo = \Carbon\Carbon::parse($registrationManager['valid_to']);
                                        $remainingDays = $validTo->isFuture()
                                            ? $validTo->diffInDays(\Carbon\Carbon::today())
                                            : 0;
                                        ?>
                                    {{ $remainingDays }}
                                </td>
                            </tr>
                            @empty
                                <tr>
                                    <td colspan="5" class="text-center">No available data.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('css')
    {{-- data tables style --}}
    <link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"/>
    <style>
        .toggle{
            width: 60px !important;
            height: 13px !important;
        }
        .toggle .btn{
            font-size: 13px !important;
        }
    </style>
@endpush
{{-- extra js --}}
@push('js')
    {{-- DataTables  & Plugins --}}
    <script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
@endpush

@push('js')
<script>
    $(document).ready(function(){
        $("#user_list").DataTable({});

        function calculateDifference() {
            const fromDate = $('#from_date').val();
            const toDate = $('#to_date').val();

            var date1 = new Date(fromDate);
            var date2 = new Date(toDate);

            if (isNaN(date1.getTime()) || isNaN(date2.getTime())) return;

            var timeDiff = Math.abs(date2.getTime() - date1.getTime());
            var daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

            $('#total_days').val(daysDiff + 1);   // add 1 to include the selected from date
        }

        $('#from_date, #to_date').on('change', calculateDifference);

        $(document).on('change', '.user_status', function () {
            const userId = $(this).data('user-id');
            const isActive = $(this).is(':checked') ? 1 : 0;

            $.ajax({
                url: "{{ route('admin.users.updateStatus') }}", // Replace with your route
                type: 'POST',
                data: {
                    user_id: userId,
                    is_active: isActive,
                    _token: '{{ csrf_token() }}' // Include CSRF token for security
                },
                success: function (response) {
                    alert('User status updated successfully!');
                },
                error: function (xhr) {
                    alert('Something went wrong!');
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>
@endpush
