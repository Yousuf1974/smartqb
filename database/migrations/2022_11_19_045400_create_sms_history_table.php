<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSmsHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sms_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('institution_id')->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('student_id')->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->char('mobile_nmber', 15)->nullable();
            $table->char('sms_count', 1)->default('1');
            $table->char('sms_send_id', 35)->nullable();
            $table->boolean('is_send')->default(true)->comment('1=yes,0=no');
            $table->text('message')->nullable();
            $table->foreignId('created_by');
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
        Schema::dropIfExists('sms_history');
    }
}
