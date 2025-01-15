<?php

namespace App\Http\Controllers\Admin;

use App\Exports\ReportExport;
use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Facades\Excel;

class ReportController extends Controller
{
    public function index()
    {
        $reportList = Config('reports.list');
        return view('pages.admin.reports.index', compact('reportList'));
    }

    public function generate(Request $request)
    {
        if (!$request->report_id) {
            return response()->json(['responseCode' => -1, 'msg' => 'Please select a report first.', 'html' => '']);
        }

        try {
            $reportDataList = Config('reports.list');
            $report = $reportDataList[$request->report_id];

            if (!$report) {
                return response()->json(['responseCode' => -1, 'msg' => 'Invalid report request.', 'html' => '']);
            }

            $data = DB::select($report['query']);
            $requestedReportId = $request->report_id;
            $reportTitle = $report['title'];
            $tblColumns = $report['columns'];

            $html = strval(view('pages.admin.reports.table', compact('requestedReportId', 'reportTitle', 'data', 'tblColumns')));

            return response()->json(['responseCode' => 1, 'msg' => 'Report generated.', 'html' => $html]);

        } catch (Exception $e) {
            #dd($e->getMessage(), $e->getFile(), $e->getLine());
            return response()->json(['responseCode' => -1, 'msg' => 'Something went wrong.', 'html' => '']);
        }
    }

    public function downloadReport($reportId)
    {
        if (!$reportId) {
            return back()->with('error', 'Please select a report first.');
        }

        try {
            $reportDataList = Config('reports.list');
            $report = $reportDataList[$reportId];

            if (!$report) {
                return back()->with('error', 'Invalid report request');
            }

            $dbData = DB::select($report['query']);
            $reportTitle = $report['title'];
            $tblColumns = $report['columns'];
            $reportData = [];

            if ($dbData) {
                foreach ($dbData as $key => $item) {
                    foreach ($tblColumns as $column) {
                        $reportData[$key][$column] = $item->$column;
                    }
                }
            }

            $fileName = $reportTitle . '_' . now()->format('Y_m_d_H_i_s') . '.xlsx';
            return Excel::download(new ReportExport($reportData, $tblColumns), $fileName);

        } catch (Exception $e) {
            Log::error('Report Download Error', [
                'error_message' => $e->getMessage(),
                'file'          => $e->getFile(),
                'line'          => $e->getLine()
            ]);

            return back()->with('error', 'Something went wrong while downloading the data. Please try again.');
        }
    }
}
