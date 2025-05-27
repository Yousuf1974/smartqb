<?php

namespace App\Notifications;

use App\Channels\SmsChannel;
use App\Models\Institution;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;

class CustomNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $short_codes;
    public $message;
    public $is_custom;
    public $institution_id;
    public $created_by;
    public $phone;

    public function __construct(array $short_codes, ?string $message, bool $custom, int $institution_id, string $phone, ?int $created_by)
    {
        $this->short_codes = $short_codes;
        $this->message = $message;
        $this->is_custom = $custom;
        $this->institution_id = $institution_id;
        $this->phone = $phone;
        $this->created_by = $created_by;
    }

    public function via($notifiable)
    {
        return [SmsChannel::class];
    }

    public function toSms($notifiable)
    {
        if ($this->is_custom) {
            return $this->message;
        }

        $template = Institution::where('id', $this->institution_id)->value('custom_sms_template') ?? '';

        foreach ($this->short_codes as $key => $value) {
            $template = str_replace("{{{$key}}}", $value, $template);
        }

        return $template;
    }

    public function getPhone(): ?string
    {
        return $this->phone;
    }

    public function getCreatedBy(): ?int
    {
        return $this->created_by;
    }
}
