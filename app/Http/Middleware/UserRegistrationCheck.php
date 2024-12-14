<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class UserRegistrationCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if(auth("web")->check()){
            $institution = auth("web")->user()->institution;

            if(!$institution->is_active){
                abort(403, 'আপনার একাউন্টটি Inactive হয়ে আছে। Active করতে Pay Now button এ ক্লিক করুন।');
            }

            $firstRegistrationManager = $institution->registrationManagers()->orderBy("id", "desc")->first();
            if($firstRegistrationManager) {
                $validFrom = \Carbon\Carbon::parse($firstRegistrationManager->valid_from);
                $validTo = \Carbon\Carbon::parse($firstRegistrationManager->valid_to);
                $now = \Carbon\Carbon::now();
                if($now->lte($validTo)) {
                    return $next($request);
                }else {
                    // if the valid to date is over then ...
                    $_SESSION["id"] = $institution->id; // institution id
                    $_SESSION["institution_id"] = $institution->id; // institution id
                    $_SESSION["payment_type_id"] = 104;
                    $_SESSION["Account_Renew_Fee"] = 0; //
                    $_SESSION["Total_Days"] = 0;
                    $url = "https://www.shikkhafirst.com/sims/bkash.php?id=".$institution->id."&payment_type_id=104&Account_Renew_Fee=".$firstRegistrationManager->account_renew_fee."&Total_Days=".$firstRegistrationManager->total_days."";
                    return redirect()->to($url);
                }
            }
            return $next($request);
        }
    }
}
