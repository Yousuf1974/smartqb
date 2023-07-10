<?php

namespace App\Models;

use App\Traits\InstitutionTrait;
use App\Traits\Scope\InstitutionScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Batch extends Model
{
    use HasFactory, InstitutionScope, InstitutionTrait;

    protected $fillable = [
        'batch_name', 'batch_type', 'batch_class', 'batch_note', 'batch_year', 'is_active', 'institution_id',
        'batch_fee', 'batch_start',
    ];

    // institution
    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function students()
    {
        return $this->hasMany(Student::class);
    }
}
