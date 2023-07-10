<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SMSPurchase extends Model
{
    use HasFactory;

    protected $table = 'sms_package_purchases';

    protected $fillable = ['sms_package_id', 'institution_id', 'validity', 'price', 'quantity'];

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }
}
