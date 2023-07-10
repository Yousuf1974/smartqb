<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SmsHistory extends Model
{
    use HasFactory;

    protected $fillable = [
        'institution_id', 'student_id', 'mobile_nmber', 'sms_count', 'sms_send_id', 'is_send', 'message', 'created_by',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function send_by()
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
