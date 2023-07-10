<?php

namespace App\Policies;

use App\Models\Institution;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;

class InstitutionPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function viewAny(User $user)
    {
        if($user->level == 'Super Admin') {
            return Response::allow();
        }
        return Response::deny("Sorry! You don't have access!");
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Institution $institution)
    {
        if($user->level == 'Super Admin') {
            return Response::allow();
        }
        return Response::deny("Sorry! You don't have access!");
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        return Response::allow();
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Institution $institution)
    {
        if($user->level == 'Super Admin' || $user->institution_id == $institution->id) {
            return Response::allow();
        }
        return Response::deny("Sorry! You don't have access!");
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Institution $institution)
    {
        if($user->level == 'Super Admin') {
            return Response::allow();
        }
        return Response::deny("Sorry! You don't have access!");
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Institution $institution)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Institution  $institution
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Institution $institution)
    {
        //
    }
}
