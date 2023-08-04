<div class="table-wrapper-scroll-y my-custom-scrollbar">
    <table class="table table-bordered table-sm text-center">
        <thead>
        <tr>
            <th style="width:5%;">SL</th>
            <th style="width:20%;">Mobile</th>
            <th>Message</th>
        </tr>
        </thead>
        <tbody>
        @if(count($custom_generated_array)>0)
            @php $count=0; @endphp
            @foreach($custom_generated_array as $mobile=>$msg)
                <tr>
                    <td>
                        {{ $count+1 }}
                    </td>
                    <td>{{ $mobile }}</td>
                    <td>{{ $msg }}</td>
                </tr>
                @php $count++; @endphp
            @endforeach
        @else
            <tr colspan="{{count($custom_generated_array)}}">No available Data</tr>
        @endif
        </tbody>
    </table>
</div>
<div class="col-md-12 text-center">
    <button class="btn btn-sm btn-default" id="resetBtn">Reset</button>
    <button class="btn btn-sm btn-success" id="sendCustomSMSBtn">Send SMS</button>
</div>
