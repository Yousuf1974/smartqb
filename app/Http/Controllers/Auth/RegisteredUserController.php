<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Institution;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Spatie\Permission\Models\Role;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'string', 'email', 'max:255', 'unique:users'],
            'phone' => ['required', 'numeric', 'min:11', 'unique:users'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'institution_user' => 'nullable',
            'institution_id' => 'nullable|numeric'
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'level' => 2, // instituion
            'raw_psw' => $request->password,
        ]);

        if($request->has('institution_user')) 
        {
            $institution = Institution::create([
                'name' => 'My Institution', 
                'phone' => $request->phone, 
                'head_of_institution' => $request->name ?? "Jone Doe", 
                'email' => $request->email, 
                'is_active' => true,
            ]);

            $user->institution_id = $institution->id;
            $user->save();
            $user->assignRole(Role::where('name', 'Admin')->first()->id);
        }

        event(new Registered($user));

        Auth::login($user);

        return redirect(RouteServiceProvider::HOME);
    }
}
