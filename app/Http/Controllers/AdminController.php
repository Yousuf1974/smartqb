<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Admin;
use App\Models\Institution;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{

    public function index() 
    {
        $latest_institutions = Institution::with(['students'])->orderBy('id', "desc")->take(10)->get();
        return view('pages.admin.dashboard', compact('latest_institutions'));
    }

    public function users(Request $request) 
    {
        $admins = Admin::get();
        return view('pages.admin.users.index', compact('admins'));
    }

    public function create() 
    {
        return view('pages.admin.users.create');
    }

    public function store(Request $request) 
    {
        $request->validate([
            'name' => 'required|string',
            'phone' => 'required|numeric|unique:admins,phone',
            'email' => 'nullable|email:rfc,filter|unique:admins,email',
            'password' => 'required|min:8|max:25',
        ]);
        $data = $request->all();
        $data['password'] = Hash::make($request->password);
        $data['raw_psw'] = $request->password;
        Admin::create($data);
        return redirect()->route("admin.users")->with('created', 'Admin user create successfull!');
    }

    public function edit($id)
    {
        $user = Admin::findOrFail($id);
        return view('pages.admin.users.edit', compact('user'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string',
            'phone' => 'required|numeric|unique:admins,phone,'.$id,
            'email' => 'nullable|email:rfc,filter|unique:admins,email,'.$id,
            'password' => 'required|min:8|max:25',
        ]);

        $admin = Admin::findOrFail($id);
        $data = $request->all();
        $data['password'] = Hash::make($request->password);
        $data['raw_psw'] = $request->password;
        $admin->update($data);
        return redirect()->route('admin.users')->with('updated', 'Admin user update successfull!');
    }

    public function destroy($id) 
    {
        $admin = Admin::findOrFail($id);
        $admin->delete();
        return redirect()->route('admin.users')->with('deleted', "Admin user delete successfull!");
    }


    public function login() 
    {
        return view('auth.admin');
    }

    public function logout(Request $request)
    {
        Auth::guard('admin')->logout(); 
        $request->session()->invalidate();    
        $request->session()->regenerateToken();    
        return redirect()->route('admin.login');
    }

    public function authenticate(Request $request)
    {
        $request->validate([
            'phone' => ['required', 'numeric', 'min:11'],
            'password' => ['required', 'string'],
        ]);
        if(Auth::guard('admin')->attempt($request->only('phone', 'password'))) {
            return redirect()->route('admin');
        }
        return redirect()->back()->with('error', 'Crediantial not found!');
    }
}
