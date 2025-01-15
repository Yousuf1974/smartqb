<?php

namespace App\Channels;

use App\Traits\SmsTrait;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Log;


class SmsChannel
{
    use SmsTrait;
    /**
     * @return void
     */

    public function send($notifiable, Notification $notification)
    {
        $message = $notification->toSms($notifiable);
        if(is_string($message)) {
            if($notifiable->student_contact)
                $mobile = $notifiable->student_contact;
            else
                $mobile = $notifiable->guardian_contact;

            $student_id = $notifiable->id;
            Log::info("Sending SMS to {$mobile} with message: {$message}");

            return $this->post($message, $mobile, $student_id);
        }

        if(is_array($message) && $message['type'] ==  'admin') {
           return $this->other_post($message['message'], $notifiable->phone);
        }
    }
}

