<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentPayment extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id', 'pay_year', 'pay_month', 'need_to_pay', 'pay_amount', 'pay_discount', 'pay_due', 'is_paid'
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function total_paid_amount()
    {
        return $this->pay_amount + $this->pay_discount;
    }

    public function last_year()
    {
        // return $this->
    }
}
