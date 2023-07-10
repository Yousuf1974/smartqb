<?php

namespace App\Http\Controllers;

use App\Models\Institution;
use App\Models\Setting;
use App\Traits\InstitutionTrait;
use App\Traits\PermissionTrait;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class SettingsController extends Controller
{
    use InstitutionTrait, PermissionTrait;
    public function __construct()
    {
        $this->middleware('permission:miscellaneous-institution_setting')->only(['institution_setting', 'institution_setting_store']);
        // $this->middleware('permission:miscellaneous-database_backup', ['']);
    }
    
    public function index() 
    {
        $setting = Setting::where('institution_id', 0)->first();
        return view('pages.admin.settings.index', compact('setting'));
    }

    public function store(Request $request) 
    {
        $data = $request->all();
        if($request->has('active_sms')) 
            $data['active_sms'] = 1;
        else
            $data['active_sms'] = 0;

        if($request->has('is_maitanence_mood')) 
            $data['is_maitanence_mood'] = 1;
        else
            $data['is_maitanence_mood'] = 0;
        $setting = Setting::where('institution_id', 0)->first();
        $setting->update($data);
        return redirect()->route('settings.general')->with('updated', 'Setting update successfull!');
    }

    public function institution_setting() 
    {
        $institution = Institution::where('id', $this->institution_id())->first();
        return view('pages.settings.institution', compact('institution'));
    }

    public function institution_setting_store(Request $request, Institution $institution) 
    {
        $request->validate([
            'institution_name' => 'required|string',
            'head_of_institution' => 'required|string',
            'phone' => 'required|min:11|unique:institutions,phone,'.$institution->id,
            'email' => 'nullable|email:rfc,filter|unique:institutions,email,'.$institution->id,
            'address' => 'nullable',
        ]);
        
        $data = $request->all();
        $data['name'] = $request->institution_name;

        if($request->is_active) {
            $data['is_active'] = true;
        } else {
            $data['is_active'] = false;
        }

        $institution->update($data);
        // $this->authorize('update', [Institution::class, $institution]); // check policy

        return redirect()->back()->with('updated', 'Institution updated successfully!');
    }

    public function user_admin_permission() 
    {
        $role = Role::where('name', 'admin')->first();
        $permissions = $role->permissions->pluck('name')->toArray();
        $permission_list = $this->permission_list();
        $other_permissions = $this->other_permission_list();
        return view('pages.admin.settings.admin_permission', compact('role', 'permissions', 'permission_list', 'other_permissions'));
    }

    public function user_admin_per_store(Request $request, $role) 
    {
        $permissions = $request->permission;
        $role = Role::find($role);

        // remove all old permission so thant agaim assing permission into role
        $old_permissions = $role->permissions->pluck('name')->toArray();
        foreach($old_permissions as $old_permission) {
            $role->revokePermissionTo($old_permission);
        }
        if(!is_null($permissions)) {
            foreach($permissions as $permission) {
                foreach($permission as $value) {
                    // create permission if not exist in permission table
                    $permission_ = Permission::where('name', $value)->first();
                    if(is_null($permission_)) {
                        $permission_ = Permission::create(['name' => $value]);
                    }
                    // assign permission into role
                    $role->givePermissionTo($permission_);
                    // $permission_->assignRole($role);
                }
            }
        }
        return back()->with('updated', 'Role permission updated successfully!');
    }
}
