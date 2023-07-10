<?php

namespace App\Http\Controllers;

use App\Models\InsSms;
use App\Models\Institution;
use App\Models\Payment;
use App\Models\Setting;
use App\Models\Student;
use App\Models\User;
use App\Traits\AdminTrait;
use App\Traits\InstitutionTrait;
use App\Traits\SuperAdminTrait;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    use AdminTrait, SuperAdminTrait, InstitutionTrait;
    /**
     * dashboard
     */
    public function index()
    {
        $ins_id = $this->institution_id();
        $total_institution = Institution::count();
        $total_student = Student::select()->institution($this->institution_id())->count();
        $total_user = User::select()->institution($this->institution_id())->count();
        $total_payment = Payment::select()->institution($this->institution_id())->count();
        $latest_payments = Payment::with(['student', 'student.batch'])
                            ->institution($this->institution_id())
                            ->orderBy('id', 'desc')->limit(8)->get();
        $latest_students = Student::with(['batch'])->institution($this->institution_id())
                            ->orderBy('id', 'desc')->limit(8)->get();
        $total_sms = InsSms::where('institution_id', $this->institution_id())->first();   
        $user_manual_link = Setting::where('institution_id', 0)->first()->user_manual_file_link;
        return view('index', compact('total_student', 'total_institution', 'total_user', 'total_payment',  'latest_payments', 'latest_students', 'total_sms', 'user_manual_link'));
    }
}
