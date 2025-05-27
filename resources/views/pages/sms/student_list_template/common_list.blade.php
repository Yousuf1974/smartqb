<div class="card">
    <div class="card-header">
        <h4 class="card-title">Student List</h4>
    </div>
    <div class="card-body overflow-auto">
        <form id="custom_sms_send_form" action="{{route('custom_sms_send_req')}}" method="post">
            @csrf
            <div>
                <table class="table table-bordered table-sm text-center">
                    <thead>
                    <tr>
{{--                        <th style="width:3%;">--}}
{{--                            <div class="icheck-success border-success">--}}
{{--                                <input type="checkbox" name="check_all" id="check_all"/>--}}
{{--                                <label for="check_all"></label>--}}
{{--                            </div>--}}
{{--                        </th>--}}
                        <th style="width: 3%;">SL</th>
                        <th style="width: 20%;">Name</th>
                        <th style="width: 14%;">
                            <span class="icheck-success border-success">
                                <input type="checkbox" name="check_all_student" id="check_all_student"/>
                                <label for="check_all_student"></label>
                            </span>
                            Student
                        </th>
                        <th style="width: 14%;">
                            <span class="icheck-success border-success">
                                <input type="checkbox" name="check_all_guardian" id="check_all_guardian"/>
                                <label for="check_all_guardian"></label>
                            </span>
                            Guardian
                        </th>
                        <th style="width: 10%;">Batch</th>
                        <th style="width: 38%;">Message</th>
                    </tr>
                    </thead>
                    <tbody>
                    @if($students && $students->isNotEmpty())
                        @foreach($students as $student)
                                <?php
                                $short_codes = [
                                    "{{ins_name}}", "{{student_name}}", "{{student_batch}}", "{{student_class}}", "{{admission_date}}", "{{payment_ref}}",
                                    "{{payment_date}}", "{{total_amount}}", "{{paid_amount}}", "{{total_discount}}", "{{total_due}}", "{{per_month_fee}}"];

                                $replaced_codes = [
                                    $institution->name, $student->student_name, $student->batch->batch_name, $student->batch->student_class,
                                    date('d/m/y', strtotime($student->admission_date)),
                                    !empty($student->get_last_payment()) ? $student->get_last_payment()->ref_no : '',
                                    !empty($student->get_last_payment()) ? $student->get_last_payment()->payment_date : '',
                                    !empty($student->get_last_payment()) ? $student->get_last_payment()->total_amount : '',
                                    !empty($student->get_last_payment()) ? $student->get_last_payment()->amount : '',
                                    !empty($student->get_last_payment()) ? $student->get_last_payment()->discount : '',
                                    !empty($student->get_last_payment()) ? $student->get_last_payment()->due : '',
                                    $student->batch->batch_fee];

                                if (!$common_message) {
                                    $message = $institution->custom_sms_template ?? "N/A";
                                    foreach ($short_codes as $key => $value) {
                                        $message = str_replace("{{{$key}}}", $value, $message);
                                    }
                                } else {
                                    $message = str_replace($short_codes, $replaced_codes, $common_message);
                                }
                                $message = htmlentities($message, ENT_QUOTES, 'UTF-8', false);
                                ?>
                            {{--@if(request()->send_common == 1)--}}
                            @if(!empty($common_message))
                                <input type="hidden" name="custom[{{$student->id}}]" value="1"/>
                            @endif
                            <tr>
                               {{-- <td>
                                    <div class="icheck-success border-success">
                                        <input type="checkbox" name="selected_id[]" value="{{$student->id}}"
                                               id="selected_id{{$student->id}}"/>
                                        <label for="selected_id{{$student->id}}"></label>
                                    </div>
                                </td>--}}
                                <td>{{$loop->iteration}}</td>
                                <td>{{$student->student_name}}</td>
                                <td>
                                    @if($student->student_contact)
                                        <div class="icheck-success border-success">
                                            <input class="form-check-input student_check" type="checkbox" name="selected_id[{{$student->id}}][student]" value="1" id="student_sms_{{$student->id}}">
                                            <label class="form-check-label" for="student_sms_{{$student->id}}">
                                                {{$student->student_contact}}
                                            </label>
                                        </div>
                                    @else
                                        N/A
                                    @endif
                                </td>
                                <td>
                                    @if($student->guardian_contact)
                                        <div class="icheck-success border-success">
                                            <input class="form-check-input guardian_check" type="checkbox" name="selected_id[{{$student->id}}][guardian]" value="1" id="guardian_sms_{{$student->id}}">
                                            <label class="form-check-label" for="guardian_sms_{{$student->id}}">
                                                {{$student->guardian_contact}}
                                            </label>
                                        </div>
                                    @else
                                        N/A
                                    @endif
                                </td>
                                <td>{{$student->batch->batch_name}}</td>
                                <td>
                                    {{$message}}
                                    <input type="hidden" name="message[{{$student->id}}]" value="{{$message}}"/>
                                </td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="5" class="text-center">No Data Found!</td>
                        </tr>
                    @endif
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5" class="text-left">
                            <button type="button" id="submit_form_btn" class="btn btn-success">Send</button>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </form>
    </div>
</div>
