<?php
namespace App\Traits;

use App\Models\Institution;

trait InstitutionTrait {
   
    // return all current user institution information
    public function institution() {
        return Institution::find(auth()->user()->institution_id);
    }

    public function institution_id() {
        return auth()->user()->institution_id ?? null;
    }
}