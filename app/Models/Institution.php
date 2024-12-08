<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Institution extends Model
{
    use Notifiable, HasFactory;

    protected $fillable = [
        'name', 'phone', 'head_of_institution', 'email', 'address', 'is_active', 'id_sms', 'online_payment_note',
    ];

    public function ins_sms()
    {
        return $this->hasOne(InsSms::class);
    }

    public function students()
    {
        return $this->hasMany(Student::class);
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }
    
    public function admin()
    {
        return User::orderBy('id', 'asc')->where('institution_id', $this->id)->first();
    }
    
    public function registrationManagers()
    {
        return $this->hasMany(RegistrationManager::class);
    }
}
