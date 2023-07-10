<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    use HasFactory;

    protected $guard = 'admin';

    protected $table = 'admins';

    protected $fillable = [
        'name', 'email', 'phone', 'password', 'raw_psw', 'active_status', 
    ];

    protected $hidden = [
        'password', 'raw_psw',
    ];
}
