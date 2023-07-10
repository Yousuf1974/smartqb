<?php

namespace App\Models;

use App\Traits\Scope\ActiveScope;
use App\Traits\Scope\InstitutionScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Student extends Authenticatable
{
    use Notifiable, HasFactory, InstitutionScope, ActiveScope;

    protected $guard = 'student';

    protected $fillable = [
        'student_name', 'admission_date', 'student_class', 'student_contact', 'guardian_contact',
        'clg_name', 'batch_id', 'institution_id', 'user_profile', 'is_active', 'note_address','guardian_name',
    ];

    protected $hidden = [
        'unique_id', 'pin',
    ];

    // protected $visible = [
    //     'id', 'student_name', 'admission_date', 'student_class', 'student_contact', 'guardian_contact', 'clg_name', 'guardian_name', 'user_profile',
    // ];

    public function batch()
    {
        return $this->belongsTo(Batch::class);
    }

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function payments()
    {
        return $this->hasMany(Payment::class, 'student_id');
    }

    // get student payment details
    public function payment_details()
    {
        return $this->hasManyThrough(PaymentDetail::class, Payment::class);
    }

    // get student payment all month by year
    public function get_payment_month($year)
    {
        return $this->student_payment_details->where('pay_year', $year)->pluck('pay_month')->toArray();
    }

    /**
     * get all student payment collection
     * @return App\Models\StudentPayment
     */
    public function student_payment_details()
    {
        return $this->hasMany(StudentPayment::class, 'student_id');
    }

    /**
     * check the month is paid
     * @var number
     * @return boolean
     */
    public function is_paid_this_month($year, $month=null)
    {
        return $this->get_student_payment_by_month_year($year, $month)->is_paid ?? false;
    }

    // get student payment by year and month
    public function get_student_payment_by_month_year($year, $month=null)
    {
        $student_payments =  $this->student_payment_details->where('pay_year', $year);
        if(!is_null($month)){
            $student_payments = $student_payments->where('pay_month', $month);
        }
        $student_payments = $student_payments->first();
        return $student_payments;
    }

    /**
     * get due amount
     * @var number
     * @return boolean
     */
    public function get_due_amount($year, $month=null)
    {
        $student_payments =  $this->get_student_payment_by_month_year($year, $month);
        if(!$student_payments)
            return null;
        return $student_payments ->pay_due ?? 0;
    }

    /**
     * get paid amount
     * @var number
     * @return boolean
     */
    public function get_paid_amount($year, $month=null)
    {
        $student_payments =  $this->get_student_payment_by_month_year($year, $month);
        if(!$student_payments)
            return null;
        return $student_payments ->pay_amount ?? 0;
    }

    public function get_total_paid_amount_by_year($year)
    {
        $std_ptm =  $this->student_payment_details->where('pay_year', $year);
        return ($std_ptm->sum('pay_amount') ?? 0) - ($std_ptm->sum('pay_discount') ?? 0);
        // return 0;
    }

    public function get_last_payment()
    {
        $student_payments =  $this->payments()->orderBy('id', 'DESC')->first();
        if(!$student_payments)
            return null;
        return $student_payments;
    }

}
