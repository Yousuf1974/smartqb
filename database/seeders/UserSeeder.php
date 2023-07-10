<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name' => "I'm Super Admin",
            "email" => "admin@gmail.com",
            "phone" => "01307035688",
            "level" => 1,
            "password" => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            "active_status" => true,
        ]);

        $role = Role::where('name', 'Super Admin')->first();
        $user->assignRole($role->id);
    }
}
