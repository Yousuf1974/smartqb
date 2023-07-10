<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;

    protected $fillable = ['ref_no', 'payment_date', 'payment_year', 'student_id', 'method', 'amount', 'discount', 'due', 'is_paid', 'total_amount', 'created_by', 'updated_by', 'note'];

    /**
     * get payment by institution id
     */
    public function scopeInstitution($query, $institution_id)
    {
        if($institution_id)
            return $query->whereRelation('student', 'institution_id', $institution_id);
        else 
            return $query;
    }

    public function payment_details() 
    {
        return $this->hasMany(PaymentDetail::class, 'payment_id');
    }

    public function student() 
    {
        return $this->belongsTo(Student::class);
    }

    public function payment_received()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function payment_updated()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    // get payment month lists 
    public function get_payment_months() 
    {
        return $this->payment_details()->pluck('month')->toArray();
    }

    // get payment month from payment details individual student by month
    public function get_payment_detail_by_month($month)
    {
        return $this->payment_details()->where('month', $month)->first();
    }

    /**
     * get total amount of this month payment detail 
     * @var number $key
     * @return number 
     */
    public function get_total_payable_amount($month)
    {
        $pym_details = $this->payment_details()->where('month', $month)->first();
        return ($pym_details->amount ?? 0) + ($pym_details->discount ?? 0) + ($pym_details->due ?? 0);
    }

    /**
     * get only first payment details, which is related at payment by payment_id
     * it's mainly used for when student batch type is 2
     */
    public function get_1_payment_detail()
    {
        return $this->payment_details()->first();
    }

    public function get_this_month_paid_fee($month)
    {
        $payment = $this->get_payment_detail_by_month($month);
        return ($payment->amount ?? 0 + $payment->due ?? 0 + $payment->discount ?? 0);
    }

    public function get_this_month_due_fee($month)
    {
        $payment = $this->get_payment_detail_by_month($month);
        return $payment->due;
    }

    public function get_this_month_discount_fee($month)
    {
        $payment = $this->get_payment_detail_by_month($month);
        return $payment->discount;
    }

    
}
