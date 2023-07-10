<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInsSmsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ins_sms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('institution_id')->constrained()->onUpdate('cascade')->onDelete('cascade');
            $table->date('valid_till');
            $table->unsignedInteger('total_sms');
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
        Schema::dropIfExists('ins_sms');
    }
}
