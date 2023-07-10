@extends('layouts.student_layout')
@section('title', 'Student Panel')

@section('content')
  <div class="row">
    <div class="col-md-6 col-sm-12 m-auto text-center p-2">
      <img src="{{$user_profile}}" width="60" height="60" class="img-circle elevation-2" alt="user profile"/>
      
      <table class="table table-sm table-bordered mt-2">
        <tbody>          
          <tr>
            <th style="width:50%" class="text-right">Name</th>
            <td style="width:50%" class="text-left">{{$student->student_name}}</td>
          </tr>
          <tr>
            <th class="text-right">Admission Date</th>
            <td class="text-left">{{date('d/m/Y', strtotime($student->admission_date))}}</td>
          </tr>
          <tr>
            <th class="text-right">Batch</th>
            <td class="text-left">{{$student->batch->batch_name}}</td>
          </tr>
          <tr>
            <th class="text-right">Class</th>
            <td class="text-left">{{$student->student_class ?? "N/A"}}</td>
          </tr>
          <tr>
            <th class="text-right">Student Contact</th>
            <td class="text-left">{{$student->student_contact ?? "N/A"}}</td>
          </tr>
          <tr>
            <th class="text-right">Guardian Contact</th>
            <td class="text-left">{{$student->guardian_contact ?? "N/A"}}</td>
          </tr>
          
          <tr>
            <th class="text-right">Institution</th>
            <td class="text-left">{{$student->institution->name ?? "N/A"}}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>        
@endsection