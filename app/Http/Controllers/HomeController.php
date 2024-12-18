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
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    use AdminTrait, SuperAdminTrait, InstitutionTrait;
    /**
     * dashboard
     */
    public function index()
    {
        /**
         * if user click the paynow button from dashboard page
         * then it will redirect to bakash payment page
         */
        if(request("paynow")) {
            $institution = auth("web")->user()->institution;
            $firstRegistrationManager = $institution->registrationManagers()->orderBy("id", "desc")->first();
            $_SESSION["id"] = $institution->id; // institution id
            $_SESSION["institution_id"] = $institution->id; // institution id
            $_SESSION["payment_type_id"] = 104;
            $_SESSION["Account_Renew_Fee"] = 0; //
            $_SESSION["Total_Days"] = 0;
            $url = "https://www.shikkhafirst.com/sims/bkash.php?id=".$institution->id."&payment_type_id=104&Account_Renew_Fee=".$firstRegistrationManager->account_renew_fee."&Total_Days=".$firstRegistrationManager->total_days."";
            return redirect()->to($url);
        }

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
        $registrationManager = \App\Models\RegistrationManager::where("institution_id", $this->institution_id())->orderBy("id", "desc")->first();
        if ($registrationManager !== null) {
$validTo = \Carbon\Carbon::parse($registrationManager->valid_to);
$remaining_days = $validTo->diffInDays(now());
} else {
    // Handle the case when $registrationManager is null
    $remaining_days = 365; // or any default value you want
}
        //$validTo = \Carbon\Carbon::parse($registrationManager->valid_to);
        //$remaining_days = $validTo->diffInDays(now());
        return view('index', compact('total_student', 'total_institution', 'total_user', 'total_payment',  'latest_payments', 'latest_students', 'total_sms', 'user_manual_link', 'remaining_days'));
    }

    public function redirectToPay(): RedirectResponse
    {
        $institution = auth("web")->user()->institution;
        $firstRegistrationManager = $institution->registrationManagers()->orderBy("id", "desc")->first();
        $_SESSION["id"] = $institution->id; // institution id
        $_SESSION["institution_id"] = $institution->id; // institution id
        $_SESSION["payment_type_id"] = 104;
        $_SESSION["Account_Renew_Fee"] = 0; //
        $_SESSION["Total_Days"] = 0;
        $url = "https://www.shikkhafirst.com/sims/bkash.php?id=".$institution->id."&payment_type_id=104&Account_Renew_Fee=".$firstRegistrationManager->account_renew_fee."&Total_Days=".$firstRegistrationManager->total_days."";
        //$url = "https://www.shikkhafirst.com/sims/bkash.php?id=".$institution->id."&payment_type_id=104&Account_Renew_Fee=99&Total_Days=30";
        return redirect()->to($url);
    }
    
    public function redirectToPayRegister(): RedirectResponse
    {
        // Institution created successfully
        $institution = auth("web")->user()->institution;
        $_SESSION["id"] = $institution->id;
        $_SESSION["payment_type_id"] = 103;
        return redirect()->away('https://shikkhafirst.com/sims/bkash.php?id='.$institution->id.'&payment_type_id=103'); // Replace with your payment URL
    }
}
