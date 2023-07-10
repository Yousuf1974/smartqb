<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\UserTrait;
use Illuminate\Http\Request;

class MiscellaneousController extends Controller
{
    use UserTrait;
    public function __construct()
    {
        $this->middleware('permission:miscellaneous-login_as_ins')->only('login_as_ins');
    }
    public function login_as_ins($institution)
    {
        $user = User::findOrFail($this->user()->id);
        $user->institution_id = $institution;
        $user->save();
        return redirect()->route('dashboard');
    }
}
