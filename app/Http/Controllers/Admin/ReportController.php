<?php

namespace App\Http\Controllers\Admin;

use App\Exports\ReportExport;
use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
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

            $query = $report['query'];

            if(!empty($report['requiredInputFields'])) {

                $missingFields = $this->checkAdditionalRequiredFields($requiredFields = array_keys($report['requiredInputFields']), $request);

                if ($missingFields > 0) {
                    return response()->json(['responseCode' => -1, 'msg' => 'Please fill all the required fields.', 'html' => '']);
                }

                foreach ($requiredFields as $field) {
                    $query = str_replace('{' . $field . '}', $request->$field, $query);
                }
            }

            Session::forget('report_query');
            Session::put('report_query', $query);

            $data = DB::select($query);
            $requestedReportId = $request->report_id;
            $reportTitle = $report['title'];
            $tblColumns = $report['columns'];

            $html = strval(view('pages.admin.reports.table', compact('requestedReportId', 'reportTitle', 'data', 'tblColumns')));

            return response()->json(['responseCode' => 1, 'msg' => 'Report generated.', 'html' => $html]);

        } catch (Exception $e) {
            #dd($e->getMessage(), $e->getFile(), $e->getLine());
            Log::error('Report Download Error', [
                'error_message' => $e->getMessage(),
                'file'          => $e->getFile(),
                'line'          => $e->getLine()
            ]);
            return response()->json(['responseCode' => -1, 'msg' => 'Something went wrong.', 'html' => '']);
        }
    }

    public function downloadReport(Request $request,$reportId)
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

            $query = Session::get('report_query');
            if (!$query) {
                return back()->with('error', 'Invalid report query request');
            }

            $dbData = DB::select($query);
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
            Session::forget('report_query');
            return Excel::download(new ReportExport($reportData, $tblColumns), $fileName);

        } catch (Exception $e) {
            #dd($e->getMessage(), $e->getFile(), $e->getLine());
            Log::error('Report Download Error', [
                'error_message' => $e->getMessage(),
                'file'          => $e->getFile(),
                'line'          => $e->getLine()
            ]);

            return back()->with('error', 'Something went wrong while downloading the data. Please try again.');
        }
    }

    public function fetchDependencies($reportId)
    {
        if (!$reportId) {
            return response()->json(['responseCode' => -1, 'html' => 'Please select a report first.']);
        }

        try {
            $reportDataList = Config('reports.list');
            $report = $reportDataList[$reportId];

            if (!$report) {
                return response()->json(['responseCode' => -1, 'html' => 'Invalid report request']);
            }

            if (empty($report['requiredInputFields'])) {
                return response()->json(['responseCode' => -1, 'html' => 'Report don\'t have any dependencies.']);
            }

            return response()->json(['responseCode' => 1, 'html' => $report['requiredInputFields']]);

        } catch (Exception $e) {
            Log::error('Report dependencies fetching error', [
                'error_message' => $e->getMessage(),
                'file'          => $e->getFile(),
                'line'          => $e->getLine()
            ]);

            return response()->json(['responseCode' => -1, 'html' => 'Something went wrong']);
        }
    }

    public function checkAdditionalRequiredFields($requiredFields, Request $request)
    {
        $missingFields = [];
        foreach ($requiredFields as $field) {
            if (!$request->$field) {
                $missingFields[] = $field;
            }
        }

        return count($missingFields);
    }
}
