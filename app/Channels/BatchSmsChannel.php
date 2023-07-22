<?php

namespace App\Channels;

use App\Traits\SmsTrait;
use Illuminate\Notifications\Notification;


class BatchSmsChannel
{
    use SmsTrait;
    /**
     * @return void
     */

    public function send($notifiable, Notification $notification)
    {
        $data = $notification->toSms($notifiable);
        $mobile = $data['mobile'];
        $message = $data['message'];
        return $this->post($message, $mobile, 0);
    }
}

