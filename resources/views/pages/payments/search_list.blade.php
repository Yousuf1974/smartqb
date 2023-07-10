
<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
        <table class="table table-sm text-center text-sm">
            <caption class="text-center">Search Result</caption>
            <tr>
                <th>SL</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Batch</th>
                <th>Month({{$year}})</th>
                <th>Total Paid</th>
                <th>Total Due</th>
                <th>&nbsp;</th>
            </tr>
            @if($students->isEmpty())
            <tr class="text-center">
                <td colspan="8">No Data Found!</td>
            </tr>
            @endif
            @if($students->isNotEmpty())
            @foreach($students as $key_ => $student)
            
            <tr>
                <td>{{$key_+1}}</td>
                <td>{{$student->student_name}}</td>
                @if($student->student_contact) 
                <td>{{$student->student_contact}} (Std.)</td>
                @else 
                <td>{{$student->guardian_contact}} (Grd.)</td>
                @endif
                <td>{{$student->batch->batch_name}}</td>
                {{-- if student have monthly batch --}}
                @if($student->batch->batch_type == 1)
                <?php
                    $arr = explode("-", $student->batch->batch_start);
                    if($year == $arr[0])
                        $month_start = ($arr[1] - 1) * 1;
                    else 
                        $month_start = null;                    
                ?>
                <td style="width: 450px !important;">
                    <div class="d-flex flex-wrap" style="width: 450px !important;" >
                    @foreach(['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'] as $key => $month)

                        @if(!is_null($month) && $month_start > $key)
                        <div style="width:75px;" class="custom-control custom-checkbox">
                            <input type="checkbox" name="month[]" value="{{$key}}" disabled class="custom-control-input" />
                            <label for="someCheckboxId" class="custom-control-label text-muted"><del>{{$month}}</del></label>
                        </div>                            
                        @else 
                            @if(in_array($key, $student->get_payment_month($year)))
                                @if($student->is_paid_this_month($year, $key))
                                    {{-- checked | paid --}}
                                    <div style="width:75px;" class="custom-control custom-checkbox">
                                        <input type="checkbox" name="month[]" value="{{$key}}" class="custom-control-input" disabled checked id="{{$month}}" />
                                        <label for="{{$month}}_{{$key_}}" class="custom-control-label text-info">{{$month}}</label>
                                    </div>
                                @else
                                    {{-- due --}}
                                    <div style="width:75px;" class="custom-control custom-checkbox">
                                        <input type="checkbox" name="month[]" value="{{$key}}" class="custom-control-input custom-control-input-danger" checked id="{{$month}}_{{$key_}}" />
                                        <label for="{{$month}}_{{$key_}}" class="custom-control-label">{{$month}}</label>
                                    </div>
                                @endif
                            @else 
                                <div style="width:75px;" class="custom-control custom-checkbox">
                                    <input type="checkbox" name="month[]" value="{{$key}}" class="custom-control-input" id="{{$month}}_{{$key_}}" />
                                    <label for="{{$month}}_{{$key_}}" class="custom-control-label" >{{$month}}</label>
                                </div>
                            @endif
                        @endif

                    @endforeach
                    </div>
                </td>
                <td>
                    {{$student->get_total_paid_amount_by_year($year)}}
                </td>
                <td>
                    N/A
                </td>
                @else 
                <td>N/A</td>
                <td>
                    {{$student->get_total_paid_amount_by_year($year)}}
                </td>
                <td>
                    {{$student->get_due_amount($year) ?? ($student->batch->batch_fee ?? 0)}}
                </td>                
                @endif
                <td id="action-{{$student->id}}">
                    <a href="javascript:void(0)" class="student_list btn btn-xs btn-dark" data-year="{{$year}}" data-id="{{$student->id}}">
                        Pay Now
                    </a>
                </td>
            </tr>
            @endforeach
            @endif
            
        </table>
        </div>
    </div>
</div>
