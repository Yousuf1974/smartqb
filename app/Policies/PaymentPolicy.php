<?php

namespace App\Policies;

use App\Models\Payment;
use App\Models\User;
use App\Models\OnlinePayment;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;

class PaymentPolicy
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
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Payment $payment)
    {
        if($user->institution_id) {
            return $payment->student->institution_id == $user->institution_id ? 
            Response::allow() : 
            Response::deny("Sorry! You do not own this data!");
        }
        return Response::allow();
    }

    public function online_payment_approved(User $user, OnlinePayment $online_payment)
    {
        if($online_payment->student->institution_id == $user->institution_id) {
            if($online_payment->is_approved) {
                return Response::deny("Sorry! This payment is approved!");
            }
            return Response::allow();
        } else {
            return Response::deny("Sorry! This student is not your instution");
        }
    }

    public function online_payment_delete(User $user, OnlinePayment $online_payment)
    {
        if($online_payment->student->institution_id == $user->institution_id) {
            return Response::allow();
        } else {
            return Response::deny("Sorry! This student is not your instution");
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
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Payment $payment)
    {
        if($user->institution_id) {
            return $payment->student->institution_id == $user->institution_id ? 
            Response::allow() : 
            Response::deny("Sorry! You do not own this data!");
        }
        return Response::allow();
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Payment $payment)
    {
        if($user->institution_id) {
            return $payment->student->institution_id == $user->institution_id ? 
            Response::allow() : 
            Response::deny("Sorry! You do not own this data!");
        }
        return Response::deny("Sorry! You do not own this data!");
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Payment $payment)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Payment  $payment
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Payment $payment)
    {
        //
    }
}
