<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OnlinePaymentDetails extends Model
{
    use HasFactory;
    protected $fillable = [
        'online_payment_id', 'payment_year', 'month', 'amount',
    ];
}
