<?php

namespace App\Channels;

use App\Traits\SmsTrait;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Log;

class SmsChannel
{
    use SmsTrait;

    public function send($notifiable, Notification $notification)
    {
        $message = $notification->toSms($notifiable);
        $phone = method_exists($notification, 'getPhone') ? $notification->getPhone() : null;
        $createdBy = method_exists($notification, 'getCreatedBy') ? $notification->getCreatedBy() : 0;

        if (!$message || !$phone) {
            Log::warning('SMS not sent. Missing phone or message.');
            return;
        }

        Log::info("Sending SMS to {$phone} with message: {$message}");
        $this->sendThroughQueue($message, $phone, $notifiable->id, null, $notifiable->institution_id, $createdBy);
    }
}
