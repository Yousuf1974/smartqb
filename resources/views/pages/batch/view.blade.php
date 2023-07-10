<table class="table table-striped">
    <tbody>
        <tr>
            <td>Name: {{$batch->batch_name}}</td>
            <td>Type: {{$batch->batch_type == 1 ? "Monthly" : "Contract"}}</td>
            <td>Year: {{$batch->batch_year}}</td>
        </tr>
        <tr>
            <td>Class: {{$batch->batch_class ?? "N/A"}}</td>
            <td>Fee: {{$batch->batch_fee ?? 0}}</td>
            <td>Batch Start: {{$batch->batch_start ? date('M-y', strtotime($batch->batch_start . '-01')) : "N/A"}}</td>
        </tr>
        <tr>
            <td>Status: {{$batch->is_active ? "Active" : "Inactive"}}</td>
            <td>Total Student: {{$batch->students->count()}}</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">Note: {{$batch->batch_note ?? "N/A"}}</td>
        </tr>
    </tbody>
</table>