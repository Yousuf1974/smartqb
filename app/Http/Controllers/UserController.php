<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Traits\AdminTrait;
use App\Traits\InstitutionTrait;
use App\Traits\PermissionTrait;
use App\Traits\SuperAdminTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UserController extends Controller
{
    use AdminTrait, SuperAdminTrait, InstitutionTrait, PermissionTrait;
    public function __construct()
    {
        // user permission
        $this->middleware('permission:user-index', ['only' => ['index','show']]);
        $this->middleware('permission:user-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:user-update', ['only' => ['edit','update']]);
        $this->middleware('permission:user-destroy', ['only' => ['destroy']]);
        $this->middleware('permission:miscellaneous-user_permission', ['only' => ['assign_permission', 'assign_permission_store']]);
        // user policy
        $this->authorizeResource(User::class, 'user');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if($this->admin()) {
            // admin
            $users = User::with('institution')->where('institution_id', $this->institution()->id)->get();
        } else {
            // super admin 
            $users = User::with('institution')->get();
        }
        
            
        return view('pages.users.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::all();
        return view('pages.users.create', compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'nullable|email:rfc,filter|unique:users,email,',
            'phone' => 'required|unique:users,phone,',
            'role_id' => 'nullable',
        ]);

        $data = $request->all();

        if($request->input('password')) {
            $data['password'] = Hash::make($request->password);
        }else {
            unset($data['password']);
        }
        
        if($request->active_status){
            $data['active_status'] = true;
        }else {
            $data['active_status'] = false;
        }
        
        if($this->super_admin()){
            $data['level'] = 1;
        }elseif($this->admin()){
            $data['level'] = 2;
            $data['institution_id'] = $this->institution_id();
        }

        $user = new User();
        $data['raw_psw'] = $request->password;
        $user->create($data);
        if($this->super_admin())
            $user->assignRole($request->role_id);

        return redirect()->route('users')->with('created', 'User create successfully!');
    }

    // assign user permission
    public function assign_permission(User $user)
    {
        $this->authorize('update', [User::class, $user]);

        $permissions = $user->getAllPermissions()->pluck('name')->toArray();
        $permission_list = $this->permission_list();
        $other_permissions = $this->other_permission_list();
        return view('pages.users.permission', compact('user', 'permissions', 'permission_list', 'other_permissions'));
    }

    // assign user permission store
    public function assign_permission_store(Request $request, User $user)
    {
        $this->authorize('update', [User::class, $user]);
        $permissions = $request->permission;
        // remove all old permission so thant agaim assing permission into role
        $old_permissions = $user->getAllPermissions()->pluck('name')->toArray();
        foreach($old_permissions as $old_permission) {
            $user->revokePermissionTo($old_permission);
        }
        
        if(!is_null($permissions)) {
            foreach($permissions as $permission) {
                foreach($permission as $value) {
                    $permission_ = Permission::where('name', $value)->first();
                    // assign permission into role
                    $user->givePermissionTo($permission_);
                }
            }
        }
        return redirect()->route('users')->with('updated', 'User permission updated successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        $permissions = $user->getAllPermissions()->pluck('name')->toArray();
        $permission_list = $this->permission_list();
        $other_permissions = $this->other_permission_list();
        return view('pages.users.show', compact('user', 'permissions', 'permission_list', 'other_permissions'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        $roles = Role::all();
        return view('pages.users.edit', compact('user','roles'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,User $user)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'nullable|email:rfc,filter|unique:users,email,'.$user->id,
            'phone' => 'required|unique:users,phone,'.$user->id,
            'role_id' => 'nullable',
        ]);

        $data = $request->all();

        if($request->input('password')) {
            $data['raw_psw'] = $request->password;
            $data['password'] = Hash::make($request->password);
        }else {
            unset($data['password']);
        }
        
        if($request->active_status){
            $data['active_status'] = true;
        }else {
            $data['active_status'] = false;
        }
        $user->update($data);
        if($this->super_admin())
            $user->assignRole($request->role_id);

        return redirect()->route('users')->with('updated', 'User update successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();
        return redirect()->route('users')->with('deleted', 'User delete Successfull!');
    }
}
