<?php

namespace Database\Seeders;

use App\Models\Admin;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = Admin::create([
            'name' => "I'm Super Admin",
            "email" => "admin@gmail.com",
            "phone" => "01307035688",
            "password" => Hash::make('password'), // password
            "raw_psw" => "password",
            "active_status" => true,
        ]);
    }
}
