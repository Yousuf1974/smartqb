<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentDetail extends Model
{
    use HasFactory;

    protected $fillable = ['payment_id', 'amount', 'discount', 'due', 'month'];

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }

    /**
     * get total paidable money
     * on this transaction
     */
    public function total_paidable()
    {
        return ($this->amount ?? 0) + ($this->discount ?? 0) + ($this->due ?? 0);
    }

    /**
     * get total paidable money
     * on this transaction
     */
    public function total_prepaid()
    {
        return ($this->amount ?? 0) + ($this->discount ?? 0);
    }
}
