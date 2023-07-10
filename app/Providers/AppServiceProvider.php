<?php

namespace App\Providers;

use App\Models\OnlinePayment;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        if(!defined("MONTH_LIST"))
        {
            define('MONTH_LIST', ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']);
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer('*', function ($view) 
        {
            if(auth()->guard('web')->check() && auth()->user()->institution_id) {
                $online_payment_count = OnlinePayment::
                whereIn('student_id', function($query){
                    $query->select('id')->from('students')->where('institution_id', auth()->user()->institution_id);
                })
                ->where('is_approved', false)
                ->count();
            }else {
                $online_payment_count = 0;                
            }            
            $view->with('online_payment_count', $online_payment_count );    
        });  
    }
}
