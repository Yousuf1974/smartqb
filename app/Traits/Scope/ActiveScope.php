<?php
namespace App\Traits\Scope;

trait ActiveScope {
    /**
     * get active or inactive filter 
     * @param \Illuminate\Database\Eloquent\Builder $query
     * @param boolean $status
     * @return \Illuminate\Database\Eloquent\Builder $query
     */
    public function scopeActive($query, $status) {
        if($status)
            return $query->where('is_active', $status);
        else 
            return $query;
    }
}