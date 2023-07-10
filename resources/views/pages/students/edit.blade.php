@extends('layouts.admin')
@section('title', 'Student Edit')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Edit Student</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item ">
                    <a href="{{route('dashboard')}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item ">
                    <a href="{{route('students.index')}}">Student List</a>
                </li>
                <li class="breadcrumb-item active">Edit Student</li>
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
                    <h4 class="card-title">Edit Student</h4>
                </div>
                <div class="card-body">
                    <form action="{{route('students.update', ['student' => $student->id])}}" enctype="multipart/form-data" method="post">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="name">Student Name*</label>
                                    <input type="text" name="student_name" value="{{$student->student_name}}" class="form-control form-control-sm @error('student_name') is-invalid @enderror" placeholder="Student Name" id="name" />
                                    @error('student_name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>
                           
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="phone">Student Contact*</label>
                                    <input type="tel" name="student_contact" value="{{$student->student_contact}}" class="form-control form-control-sm @error('student_contact') is-invalid @enderror" placeholder="Student Contact" id="phone" />
                                    @error('student_contact')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="guardian_name">Guardian Name</label>
                                    <input type="text" name="guardian_name" value="{{$student->guardian_name}}" class="form-control form-control-sm @error('guardian_name') is-invalid @enderror" placeholder="Guardian Name" id="guardian_name" />
                                    @error('guardian_name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="father_contact">Guardian Contact</label>
                                    <input type="tel" name="guardian_contact" value="{{$student->guardian_contact}}" class="form-control form-control-sm @error('guardian_contact') is-invalid @enderror" placeholder="Student Contact" id="father_contact" />
                                    @error('guardian_contact')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="batch">Batch*</label>
                                    <select name="batch" id="batch" class="form-control form-control-sm @error('batch') is-invalid @enderror" required>
                                        <option value="" hidden>Select Batch</option>
                                        @foreach ($batches as $batch)
                                            <option
                                                @if($student->batch_id == $batch->id) selected @endif 
                                                value="{{$batch->id}}"
                                                data-class="{{$batch->batch_class}}"
                                            >
                                                {{$batch->batch_name}}
                                            </option>
                                        @endforeach
                                    </select>
                                    @error('batch')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="class">Student Class*</label>
                                    <input type="text" readonly name="student_class" value="{{$student->student_class}}" class="form-control form-control-sm @error('student_class') is-invalid @enderror" placeholder="Student Class" id="class" />
                                    @error('student_class')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>  

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="clg">College Name</label>
                                    <input type="text" name="clg_name" value="{{$student->clg_name}}" class="form-control form-control-sm @error('clg_name') is-invalid @enderror" placeholder="College Name" id="clg" />
                                    @error('clg_name')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="admission_date">Admission Date*</label>
                                    <input type="date" name="admission_date" value="{{$student->admission_date ? date('Y-m-d', strtotime($student->admission_date)) : date('Y-m-d')}}" class="form-control form-control-sm @error('admission_date') is-invalid @enderror" id="admission_date" required />
                                    @error('admission_date')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>             

                           
                            {{-- hidden user image file --}}
                            <input type="file" style="display: none;" name="user_profile" id="user_profile">
                            {{-- camera photo data --}}
                            <input type="hidden" name="camera_phone_input" id="camera_phone_input">

                            <div class="col-md-6 col-sm-12">
                                <label for="">User Profile</label>
                                <div class="form-group border rounded m-auto text-center p-1">
                                    <div class="mb-1" style="width:260px;height:260px;border:1px solid black;display:block;padding:4px;margin:auto;overflow:hidden;">
                                        @if($student->user_profile)
                                            @if(file_exists(public_path("storage/students/".$student->user_profile)))
                                                <img id="user_profile_preview" style="width:250px;height:250px;" src="{{asset("storage/students/".$student->user_profile)}}" alt="User Profile">
                                            @else
                                            <img id="user_profile_preview" style="width:250px;height:250px;" src="{{asset('dist/img/profile_avatar.png')}}" alt="User Profile">
                                            @endif
                                        @else
                                            <img id="user_profile_preview" style="width:250px;height:250px;" src="{{asset('dist/img/profile_avatar.png')}}" alt="User Profile">
                                        @endif
                                        <video id="user_profile_video" autoplay="true" style="width:250px;height:250px;display:none;"></video>
                                    </div>
                                    <div id="btn_group_one">
                                        <button type="button" class="btn btn-outline-dark" id="upload_btn">
                                            <i class="fas fa-upload"></i>
                                        </button>
                                        <button type="button" class="btn btn-outline-dark" id="camera_button">
                                            <i class="fas fa-camera"></i>
                                        </button>
                                    </div>

                                    <div id="btn_group_two">
                                        <button type="button" class="btn btn-outline-dark btn-sm" id="change_camera">
                                            <i class="material-icons">switch_camera</i>
                                        </button>
                                        <button type="button" class="btn btn-outline-dark btn-sm" id="retry_camera">
                                            <i class="material-icons">sync</i>
                                        </button>
                                        <button type="button" class="btn btn-outline-success" id="capture_btn">
                                            <i class="material-icons">camera</i>
                                        </button>
                                        {{-- <button type="button" class="btn btn-outline-dark btn-sm" id="save_button">
                                            <i class="material-icons">check</i>
                                        </button> --}}
                                        <button type="button" class="btn btn-outline-danger btn-sm" id="close_camera">
                                            <i class="material-icons">close</i>
                                        </button>
                                    </div>
                                    @error('user_profile')<p class="m-0 text-danger"><small>{{$message}}</small></p>@enderror
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label for="address">Note/Address</label>
                                    <textarea name="note_address" id="" cols="30" rows="5" class="form-control form-control-sm" placeholder="Note/Address">{{$student->note_address}}</textarea>
                                </div>

                                <div class="form-group mt-1">
                                    <label for="active_status">Active Status</label> <br/>
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
                                        @if($student->is_active) checked @endif  
                                    />
                                </div>

                            </div>

                        </div>
                        
                        <div class="form-group mt-3">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"/>
@endpush

{{-- extra js --}}
@push('js')
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
{{-- "docs":"https://github.com/mabelanger/react-html5-camera-photo#readme", --}}
<script src="{{asset('camera/camera.js')}}"></script>
<script>
    $(document).ready(function(){
        $('#upload_btn').on('click', function(){
            $("#user_profile").trigger('click');
        });

        $('#batch').on("change", function(){
            let id = $(this).val();
            $('#class').val($("#batch option[value='"+id+"']").data("class"));
        });

        $('#user_profile').on('change', function(){
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#user_profile_preview').attr('src', e.target.result);
                    $('#camera_phone_input').val(''); // set camera input value null
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        // camera button group hide
        $('#btn_group_two').hide();

        $('#camera_button').on('click', function(){
            $('#btn_group_one').hide();
            $('#btn_group_two').show();
        });

        // close camer
        $('#close_camera').on('click', function(){
            $('#btn_group_one').show();
            $('#btn_group_two').hide();
        });
    });
</script>
@endpush