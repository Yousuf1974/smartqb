<?php

namespace App\Notifications;

use App\Channels\SmsChannel as ChannelsSmsChannel;
use App\Models\Institution;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class PaymentNotification extends Notification
{
    use Queueable;

    public $short_codes = null;

    /**
     * Create a new notification instance.
     * @param array values of payments
     * @return void
     */
    public function __construct($short_codes)
    {
        $this->short_codes = $short_codes;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return [ChannelsSmsChannel::class];
    }

    /**
     * Get the array represantion of the notification
     * @param mixed $notifiable
     * @return string
     */
    public function toSms($notifiable)
    {
        $payment_template = Institution::select('payment_sms_template')->where('id', auth()->user()->institution_id)->first();
        $message = $payment_template->payment_sms_template;
        foreach($this->short_codes as $key => $value) {
            $message = str_replace("{{{$key}}}", $value, $message);
        }
        return $message;
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
