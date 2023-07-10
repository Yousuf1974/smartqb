<?php

namespace App\Policies;

use App\Models\Batch;
use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;

class BatchPolicy
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
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Batch  $batch
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Batch $batch)
    {
        if($user->institution_id) {
            return $batch->institution_id == $user->institution_id ? 
            Response::allow() : 
            Response::deny("Sorry! You do not own this data!");
        }
        return Response::allow();
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        if($user->institution_id){
            return Response::allow();
        }else {
            return Response::deny("Sorry! You don't have institution!", 403);
        }
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Batch  $batch
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Batch $batch)
    {
        if($user->institution_id){
            return $batch->institution_id == $user->institution_id ? 
            Response::allow() : 
            Response::deny("Sorry! You do not own this data!");
        }
        return Response::allow();
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Batch  $batch
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Batch $batch)
    {
        if($user->institution_id){
            return $batch->institution_id == $user->institution_id ? 
            Response::allow() : 
            Response::deny("Sorry! You do not own this data!");
        }
        return Response::allow();
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Batch  $batch
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Batch $batch)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Batch  $batch
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Batch $batch)
    {
        //
    }
}
