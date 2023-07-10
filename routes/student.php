<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\StudentPanelController;

Route::get('/student-panel/login', [StudentPanelController::class, 'login_page'])->name('student.login');
Route::post('student-panel/login', [StudentPanelController::class, 'login'])->name('student_login');

// student panel module
Route::middleware(['student_auth:auth'])->prefix('student-panel')->group(function(){
    Route::get('/', [StudentPanelController::class, 'index'])->name('student_panel');
    Route::get('/payment', [StudentPanelController::class, 'payment'])->name('student_panel.payment');
    Route::post('/payment', [StudentPanelController::class, 'payment_store'])->name('student_panel.payment_store');
    Route::get('/payment-history', [StudentPanelController::class, 'payment_history'])->name('student_panel.payment_history');
    Route::get('/payment/{reference}', [StudentPanelController::class, 'invoice'])->name('student_panel.invoice');
    Route::get('/payment/{reference}/download', [StudentPanelController::class, 'invoice_download'])->name('student_panel.invoice_download');
    Route::post('/logout', [StudentPanelController::class, 'logout'])->name('student_logout');
});
