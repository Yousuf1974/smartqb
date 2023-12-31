<?php

namespace App\Models;

use App\Traits\Scope\InstitutionScope;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles, InstitutionScope;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'active_status',
        'level',
        'role_id',
        'institution_id',
        'raw_psw',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'raw_psw',
    ];

    protected $visible = [
        'name', 'phone', 'active_status', 'institution_id',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getLevelAttribute($value)
    {
        if($value == 1)
            return 'Super Admin';
        if($value == 2)
            return 'Admin';
        if($value == 3)
            return 'Student';
    }

    public function institution() {
        return $this->belongsTo(Institution::class);
    }

}
