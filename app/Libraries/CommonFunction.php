<?php

namespace App\Libraries;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;

class CommonFunction
{
    public static function convert2Bangla($eng_number)
    {
        $eng = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        $ban = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
        return str_replace($eng, $ban, $eng_number);
    }

    public static function convert2English($ban_number)
    {
        $eng = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        $ban = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
        return str_replace($ban, $eng, $ban_number);
    }

    public static function validateBangladeshMobileNumber($number) {
        // Remove any non-digit characters from the input
        $number = preg_replace('/[^0-9]/', '', $number);

        // Define the regex pattern for Bangladesh mobile numbers
        $pattern = '/^(?:\+?88|0)?(?:\d{11}|\d{13})$/';

        // Perform the regex match
        return preg_match($pattern, $number) === 1;
    }

    public static function replacePlaceholders($string, $data)
    {
        $pattern = '/{{(.*?)}}/';
        preg_match_all($pattern, $string, $matches);

        foreach ($matches[1] as $placeholder) {
            if (isset($data[$placeholder]) && !is_null($data[$placeholder])) {
                $string = str_replace("{{{$placeholder}}}", $data[$placeholder], $string);
            } else {
                $string = str_replace("{{{$placeholder}}}", '', $string);
            }
        }
        return $string;
    }
}
