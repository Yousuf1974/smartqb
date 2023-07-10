<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\InstitutionController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\SMSController;
use Illuminate\Support\Facades\Auth;

Route::get('/admin-login', [AdminController::class, 'login'])->name('admin.login');
Route::post('/admin-login', [AdminController::class, 'authenticate'])->name('admin.authenticate');

Route::middleware(['admin_auth'])->prefix('admin')->group(function() {
    Route::get('/', [AdminController::class, 'index'])->name('admin');

    // user login
    Route::get('{id}/user-login', function(){
        if(Auth::guard('web')->check())
            Auth::guard('web')->logout();
        Auth::guard('web')->loginUsingId(request()->id);
        return redirect()->route('dashboard');
    })->name("admin.user.login");

    Route::prefix('users')->group(function(){
        Route::get('/', [AdminController::class, 'users'])->name('admin.users');
        Route::get('/create', [AdminController::class, 'create'])->name('admin.users.create');
        Route::post('/create', [AdminController::class, 'store'])->name('admin.users.store');
        Route::get('/{id}/edit', [AdminController::class, 'edit'])->name('admin.users.edit');
        Route::put('/{id}', [AdminController::class, 'update'])->name('admin.users.update');
        Route::delete('/{id}', [AdminController::class, 'destroy'])->name('admin.users.destroy');
    });

    // institution module
    Route::get('institution/send-sms', [InstitutionController::class,  'send_sms'])->name('institution.send_sms');
    Route::post('institution/send-sms', [InstitutionController::class,  'send_sms_submit'])->name('institution.send_sms_submit');
    Route::post('institution/{institution}/comment', [InstitutionController::class,  'comment'])->name('institution.comment');
    Route::resource('institution', InstitutionController::class);

    Route::prefix('sms')->group(function(){
        Route::get('sms-purchase-history', [SMSController::class, 'sms_purchase_history'])->name('admin.sms_purchase_history');
    });
    
    // SMS Module 
    Route::resource('sms', SMSController::class);

    // user admin permission 
    Route::get('user-admin-permission', [SettingsController::class, 'user_admin_permission'])->name('user.admin.permission');
    Route::post('{role}/user-admin-permission', [SettingsController::class, 'user_admin_per_store'])->name('user.admin.per.store');
    
    // settings
    Route::prefix('settings')->group(function(){
        Route::get('general', [SettingsController::class, 'index'])->name('settings.general');
        Route::post('general', [SettingsController::class, 'store'])->name('settings.general_store');
    });

    // super admin logout 
    Route::post('/admin-logout', [AdminController::class, 'logout'])->name('admin.logout');
});