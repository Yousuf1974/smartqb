<?php

namespace App\Jobs;

use App\Notifications\CustomNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendBulkSmsJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $recipients;
    public $createdBy;

    public function __construct(array $recipients, $createdBy)
    {
        $this->recipients = $recipients;
        $this->createdBy = $createdBy;
    }

    public function handle(): void
    {
        foreach ($this->recipients as $entry) {
            $student = $entry['student'];
            $phone = $entry['phone'];
            $message = $entry['message'];
            $shortCodes = $entry['data'];
            $isCustom = $entry['is_custom'];

            $student->notify(new CustomNotification(
                $shortCodes,
                $message,
                $isCustom,
                $student->institution_id,
                $phone,
                $this->createdBy
            ));
        }
    }
}
