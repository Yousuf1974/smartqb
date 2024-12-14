<?php

use App\Http\Controllers\BatchController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\InstitutionController;
use App\Http\Controllers\MiscellaneousController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\SMSController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\UserController;
use App\Models\User;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function(){
    return redirect()->route('dashboard');
});

Route::middleware(['auth', 'is_active', 'user_registration_check'])->prefix('dashboard')->group(function(){

    Route::get('/', [HomeController::class, 'index'])->name('dashboard');
    Route::get('/redirectToPay', [HomeController::class, 'redirectToPay'])->name('redirectToPay')->withoutMiddleware(['is_active','user_registration_check']);

    // back to superadmin
    Route::get('/back-to-superadmin', function(){
        $user = User::find(auth()->user()->id);
        $user->institution_id = null;
        $user->save();
        return redirect()->route('dashboard');
    })->name('back-to-superadmin');

    // User Module
    Route::controller(UserController::class)->group(function(){
        Route::get('/users', 'index')->name('users');
        Route::get('/users/create', 'create')->name('users.create');
        Route::post('/users/create', 'store')->name('users.store');
        Route::get('/users/{user}', 'show')->name('users.show');
        Route::get('/users/{user}/edit', 'edit')->name('users.edit');
        Route::get('/users/assign-permission/{user}', 'assign_permission')->name('users.permission');
        Route::post('/users/assign-permission/{user}', 'assign_permission_store')->name('users.permission.store');
        Route::put('/users/{user}', 'update')->name('users.update');
        Route::delete('/delete/{user}', 'destroy')->name('users.destroy');
    });

    // Role Module
    Route::resource('roles', RoleController::class);
    Route::get('permission/{role}', [RoleController::class, 'permission'])->name('permission');
    Route::post('permission/{role}', [RoleController::class, 'permission_store'])->name('permission.store');

    // // institution module
    // Route::resource('institution', InstitutionController::class);
    // institution sms template
    Route::get('template', [InstitutionController::class, 'sms_template'])->name('sms.template');
    Route::post('template', [InstitutionController::class, 'sms_template_store'])->name('sms.template_store');

    // batch module
    Route::resource('batch', BatchController::class);

    // student module
    Route::resource('students', StudentController::class);
    // student unique id generate
    Route::post('generate-unique-id', [StudentController::class, 'generate_unique_id'])->name("generate_unique_id");

    // payment module
    // other payment route
    Route::prefix('payments')->group(function() {
        Route::get('quick', [PaymentController::class, 'quick_payment'])->name("payments.quick");
        Route::post('quick', [PaymentController::class, 'quick_store'])->name("payments.quick_store");
        Route::get('/online-payments', [PaymentController::class, 'online_payment'])->name('payments.online_payment');
        Route::get('/online-payments/{id}', [PaymentController::class, 'online_payment_view'])->name('payments.online_payment_view');
        Route::get('/online-payments/{id}/approved', [PaymentController::class, 'approved'])->name('payments.online_payment_approved');
        Route::delete('/online-payments/{id}', [PaymentController::class, 'online_payment_delete'])->name('payments.online_payment_delete');
    });

    Route::resource('payments', PaymentController::class);

    Route::prefix('sms')->group(function() {
        Route::get('sms-buy', [SMSController::class, 'sms_buy'])->name('sms_buy');
        Route::post('sms-buy', [SMSController::class, 'sms_buy_store'])->name('sms_buy_store');
        Route::get('custom-sms-send', [SMSController::class, 'custom_sms_send'])->name('custom_sms_send');
        Route::post('custom-sms-send', [SMSController::class, 'custom_sms_send_req'])->name('custom_sms_send_req');
        Route::get('sms-history', [SMSController::class, 'sms_history'])->name('sms.history');
        Route::post('retry-to-send', [SMSController::class, 'retry_to_send'])->name('sms.retry');
        Route::get('sms-purchase-history', [SMSController::class, 'sms_purchase_history'])->name('sms_purchase_history');
        Route::get('sms-balance', [SMSController::class, 'sms_balance_check'])->name('sms.balance_check');


        // sms participant collection
        Route::post('common-student-search', [SMSController::class, 'common_student_search'])->name('common-student-search');
        Route::post('generate-message', [SMSController::class, 'generateMessage'])->name('generate_message');
        Route::post('batch-sms-send', [SMSController::class, 'batch_sms_send_req'])->name('batch_sms_send_req');
        Route::post('upload-excel', [SMSController::class, 'uploadExcel'])->name('upload-excel');
    });


    // settings
    Route::prefix('settings')->group(function() {
        Route::get('institution', [SettingsController::class, 'institution_setting'])->name('settings.institution');
        Route::put('institution/{institution}', [SettingsController::class, 'institution_setting_store'])->name('settings.institution_update');
    });

    // report
    Route::prefix('report')->group(function() {
        // student report
        Route::get('student', [ReportController::class, 'student_report'])->name('report.student');
        Route::get('student-pdf', [ReportController::class, 'student_report_pdf'])->name('report.student.pdf');
        // payment report
        Route::get('payment', [ReportController::class, 'payment_report'])->name('report.payment');
        Route::get('payment-pdf', [ReportController::class, 'payment_report_pdf'])->name('report.payment.pdf');
        // individual student payment report
        Route::get('student-payment', [ReportController::class, 'student_payment'])->name("report.student_payment");
    });

    // miscellaneous miscellaneous
    Route::prefix('miscellaneous')->group(function() {
        // login as this institution
        Route::get('{institution}/login-as-this-institution', [MiscellaneousController::class, 'login_as_ins'])->name('login_as_ins');
    });

});

// institution registration
// Route::get('/institution-registration', [InstitutionController::class, 'create'])->name('ins.regi');
// Route::post('/institution-registration', [InstitutionController::class, 'store'])->name('ins.regi');

require __DIR__.'/auth.php';
require __DIR__.'/student.php';
require __DIR__.'/admin.php';
