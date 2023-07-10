<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;

class UserPolicy
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
        return Response::allow();
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\User  $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, User $model)
    {
        if($user->level == 'Admin' && ($model->level == 'Super Admin'  || $user->institution_id == $model->institution_id)) {
            return Response::allow();
        }elseif($user->level == 'Super Admin') {
            return Response::allow();
        }elseif($user->id == $model->id) {
            return Response::allow();
        }else {
            return Response::deny("Sorry! You don't have permission to see this data!");
        }
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        if($user->can('user-create'))
            return Response::allow();
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\User  $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, User $model)
    {
        if($user->level == 'Super Admin') 
        {
            return Response::allow();
        }
        if($user->level == 'Admin' && $user->institution_id == $model->institution_id) 
        {
            return Response::allow();
        }
        if($user->id == $model->id) 
        {
            return Response::allow();
        }
        return Response::deny("Sorry! You don't have permission to see this data!");
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\User  $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, User $model)
    {
        if($user->level == 'Student' && $user->institution_id == $model->institution_id) 
        {
            return Response::allow();
        }
        elseif($user->level == 'Admin' && $user->institution_id == $model->institution_id) 
        {
            return Response::allow();
        }
        elseif($user->level == 'Super Admin' && ($user->level == 'Super Admin' || $user->level == 'Admin')) 
        {
            return Response::allow();
        }
        else
            return  Response::deny("Sorry! You don't allow to delete this data!");
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\User  $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, User $model)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\User  $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, User $model)
    {
        //
    }
}
