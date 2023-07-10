<?php
namespace App\Traits\Scope;

trait InstitutionScope {

    /**
     * scope a query for filter institution id
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @param {int|null} $institution_id
     * @return @param \Illuminate\Database\Eloquent\Builder
     */
    public function scopeInstitution($query, $institution_id) 
    {
        if($institution_id)
            return $query->where('institution_id', $institution_id);
        else 
            return $query;
    }
}