<div class="container-xxl flex-grow-1 container-p-y">
    <div class="row gy-4">
        <!-- Welcome card -->
        <div class="col-md-12 col-lg-12">
            <div class="card mb-4">
                <div class="col-md-12 d-flex justify-content-between">
                    <h5 class="card-header">{{ $reportTitle }}</h5>

                    @if($data)
                        <a href="{{ route('admin.report.download', $requestedReportId) }}" class="btn btn-xs btn-outline-primary waves-effect btn-sm waves-light mt-2" style="height: 34px; padding: 5px; margin-right: 16px;">
                            Download
                        </a>
                    @endif
                </div>

                <div class="divider my-0">
                    <div class="divider-text">
                        <i class="mdi mdi-star-outline"></i>
                    </div>
                </div>
                <div class="card-body">
                    <div class="card-datatable text-nowrap table-responsive">
                        <table class="datatables-ajax table table-bordered dataTable no-footer">
                            <thead>
                            <tr class="text-nowrap">
                                <th>#</th>
                                @foreach($tblColumns as $column)
                                    <th>{{ str_replace('_', ' ',ucfirst($column)) }}</th>
                                @endforeach
                            </tr>
                            </thead>
                            <tbody class="table-border-bottom-0">

                            @if($data)
                                @foreach($data as $key=>$item)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        @foreach($tblColumns as $column)
                                            <td>{{ $item->{$column} }}</td>
                                        @endforeach
                                    </tr>
                                @endforeach
                            @else
                                <tr class="text-center">
                                    <td colspan="{{ count($tblColumns)+1 }}">No available Data!.</td>
                                </tr>
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        @if($data)
        $('.datatables-ajax').DataTable({});
        @endif
    });
</script>
