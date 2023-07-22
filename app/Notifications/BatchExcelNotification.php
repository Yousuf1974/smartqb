<?php

namespace App\Notifications;

use App\Channels\BatchSmsChannel;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class BatchExcelNotification extends Notification
{
    use Queueable;

    public $message = null;
    public $mobile = null;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($message,$mobile)
    {
        $this->message = $message;
        $this->mobile = $mobile;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return [BatchSmsChannel::class];
    }

    public function toSms($notifiable)
    {
        return ['mobile'=>$this->mobile, 'message'=>$this->message];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
