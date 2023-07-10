<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InsSms extends Model
{
    use HasFactory;

    protected $table = 'ins_sms';
    protected $fillable = ['institution_id', 'valid_till', 'total_sms'];
}
