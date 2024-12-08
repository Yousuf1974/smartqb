<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RegistrationManager extends Model
{
    use HasFactory;
    
    protected $fillable = [
      "institution_id", "valid_from", "valid_to", "account_renew_fee", "total_days",
    ];
    
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }
}
