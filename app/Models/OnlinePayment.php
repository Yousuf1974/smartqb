<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OnlinePayment extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
        'student_id', 'total_amount', 'paid_amount', 'phone_number', 'transaction_id',"reference","payment_year",
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function online_payment_details()
    {
        return $this->hasMany(OnlinePaymentDetails::class);
    }
}
