<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdminsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id();
            $table->string('name', 120);
            $table->string('email', 150)->unique()->nullable();
            $table->string('phone', 120)->unique()->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password', 250);
            $table->string('raw_psw', 120)->nullable();
            $table->boolean('active_status')->default(1)->comment('1=true,0=false');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('admins');
    }
}
