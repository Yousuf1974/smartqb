<?php

namespace Database\Seeders;

use App\Traits\PermissionTrait;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionSeeder extends Seeder
{
    use PermissionTrait;
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permission_list = $this->permission_list();

        $other_permissions = $this->other_permission_list();

        $role = Role::where('name', 'Super Admin')->first();
        $role = Role::find($role->id);
        foreach($permission_list as $item) {
            foreach(['index', 'create', 'update', 'destroy'] as $sub) {
                $permission_ = Permission::create(['name' => $item.'-'.$sub]);
                $role->givePermissionTo($permission_);
            }
        }

        foreach($other_permissions as $key => $item) {
            foreach($item as $sub) {
                foreach($sub as $_sub) {
                    $permission_ = Permission::create(['name' => $key.'-'.$_sub]);
                    $role->givePermissionTo($permission_);
                }                
            }
        }
    }
}
