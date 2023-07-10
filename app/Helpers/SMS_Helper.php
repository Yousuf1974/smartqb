<?php
use Illuminate\Support\Facades\Http;

if(!function_exists('valid_sms')) 
{
    /**
     * check have sms validity or sms
     * @return boolean
     */
    function valid_sms() 
    {
        return true;
    }
}

if(!function_exists('total_sms')) 
{
    /**
     * get total sms
     * @return int
     */
    function total_sms()
    {
        $url = "https://sms.smartqb.info/GetBalance.php?link_id=".auth()->user()->institution_id."&user_type=C";
        $response = Http::accept('application/json')->get($url);
        if($response->ok() && $response->json()['status'] == 'success') {
            return (int)$response->json()['balance'];
        }
        
        return 0;
    }
}
