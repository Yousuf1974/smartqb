<?php

namespace App\Traits;

use App\Models\SmsHistory;
use Illuminate\Support\Facades\Http;

trait SmsTrait
{
    /**
     * send message
     * @param string $message message body
     * @param int $mobile mobile number
     * @param int $student_id
     * @param {null||SmsHistory} $sms_history
     * @return void
     */
    public function post($message, $mobile, $student_id, $sms_history=null) {

        $sms_count = ceil((strlen($message) / env("PER_SMS_CHAR", 160))); // count sms: how much need
        $send = false;
        $institution_id = auth()->user()->institution_id;
        // send message
        $url = "http://sms.smartqb.info/Send.php?link_id=".$institution_id."&user_type=C&mobile_no=".$mobile."&message=".$message;
        $response = Http::get($url);

        $sms_count = ceil((strlen($message) / env("PER_SMS_CHAR", 160))); // count sms: how much need

        // success
        if($response->ok()) {
            if($response->json()['status'] == 'Failed') {
                $send = false;
            }elseif($response->json()['status'] == 'success') {
                $send = true;
                $sms_count = $response->json()['sms_count'];
                $send_id = $response->json()['id'] ?? 'N/A';
            }
        }

        // error
        if($response->failed()) {
            $send = false;
        }


        // send new sms
        if(!$sms_history) {
            // save sms history
            SmsHistory::create([
                'institution_id' => auth()->user()->institution_id,
                'student_id' => $student_id,
                'mobile_nmber' => $mobile,
                'sms_count' => $sms_count,
                'is_send' => $send,
                'sms_send_id' => $send_id ?? "N/A",
                'message' => $message,
                'created_by' => auth()->user()->id,
            ]);
        }else {
            // old sms
            $sms_history->is_send = $send;
            $sms_history->sms_send_id = $send_id ?? "N/A";
            $sms_history->created_by = auth()->user()->id;
            $sms_history->save();
        }
        return;
    }

    public function sendThroughQueue($message, $mobile, $student_id, $sms_history = null, $institutionId = null, $createdBy = null)
    {

//        $sms_count = ceil((strlen($message) / env("PER_SMS_CHAR", 160))); // count sms: how much need
        $send = false;
        $institution_id = !empty($institutionId) ? $institutionId : auth()->user()->institution_id;
        // send message
        $url = "http://sms.smartqb.info/Send.php?link_id=" . $institution_id . "&user_type=C&mobile_no=" . $mobile . "&message=" . $message;
        $response = Http::get($url);

        $sms_count = ceil((strlen($message) / env("PER_SMS_CHAR", 160))); // count sms: how much need

        // success
        if ($response->ok()) {
            if ($response->json()['status'] == 'Failed') {
                $send = false;
            } elseif ($response->json()['status'] == 'success') {
                $send = true;
                $sms_count = $response->json()['sms_count'];
                $send_id = $response->json()['id'] ?? 'N/A';
            }
        }

        // error
        if ($response->failed()) {
            $send = false;
        }


        // send new sms
        if (!$sms_history) {
            // save sms history
            SmsHistory::create([
                'institution_id' => $institution_id,
                'student_id'     => $student_id,
                'mobile_nmber'   => $mobile,
                'sms_count'      => $sms_count,
                'is_send'        => $send,
                'sms_send_id'    => $send_id ?? "N/A",
                'message'        => $message,
                'created_by'     => $createdBy,
            ]);
        } else {
            // old sms
            $sms_history->is_send = $send;
            $sms_history->sms_send_id = $send_id ?? "N/A";
            $sms_history->created_by = $createdBy;
            $sms_history->save();
        }
        return;
    }

    public function other_post($message, $mobile)
    {
        $admin_id = auth()->guard('admin')->user()->id;

        $url = "http://sms.smartqb.info/Send.php?link_id=" . $admin_id . "&user_type=CS&mobile_no=" . $mobile . "&message=" . $message;
        $response = Http::get($url);

        // success
        if ($response->ok()) {
            return true;
        } else {
            return false;
        }
    }
}
