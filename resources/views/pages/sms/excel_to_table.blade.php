<table class="table table-sm table-bordered mt-2">
    @if(count($columns) > 0)
        <thead>
        <tr>
            <th><input type="checkbox" id="headerCheckbox"></th>
            @foreach($columns as $col_index=>$col)
                <th><label style="cursor: pointer" for="{{ $col }}">{{ ucfirst($col) }}&nbsp;</label><input type="checkbox" style="cursor: pointer" class="column-select" id="{{ $col }}" data-column="{{ $col }}"></th>
            @endforeach
        </tr>
        </thead>
        <tbody>
        @if(count($data)>0)
            <form id="batchRecipientForm">
            @foreach($data as $data_index=>$datum)
                <tr>
                    <td><input type="checkbox" class="row-select" data-row="{{ $data_index }}" style="cursor: pointer"></td>
                    @for($i=0; $i<count($columns); $i++)
                        <td>
                            {{ array_values($datum)[$i] }}
                            <input type="hidden" name="{{array_keys($datum)[$i]}}[{{$data_index}}]" value="{{ array_values($datum)[$i] }}">
                        </td>
                    @endfor
                </tr>
            @endforeach
            </form>
        @else
            <tr colspan="{{count($columns)}}">No available Data</tr>
        @endif

        </tbody>
    @endif
</table>
