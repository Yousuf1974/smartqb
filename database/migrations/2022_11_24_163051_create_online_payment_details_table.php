<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOnlinePaymentDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('online_payment_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('online_payment_id')->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->char('payment_year', 4)->nullable();
            $table->char('month', 2)->nullable();
            $table->double('amount', 6,2);
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
        Schema::dropIfExists('online_payment_details');
    }
}
