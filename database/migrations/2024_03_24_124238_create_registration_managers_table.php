<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRegistrationManagersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('registration_managers', function (Blueprint $table) {
            $table->id();
            $table->foreignId("institution_id")->constrained("institutions")->cascadeOnDelete();
            $table->date("valid_from")->comment("from date");
            $table->date("valid_to")->comment("to date");
            $table->double("account_renew_fee", 2);
            $table->unsignedBigInteger("total_days");
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
        Schema::dropIfExists('registration_managers');
    }
}
