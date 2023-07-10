<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOnlinePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('online_payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->char('reference', 6)->index();
            $table->char('payment_year', 4);
            $table->double('total_amount', 8, 2);
            $table->double('paid_amount', 8, 2);
            $table->char('phone_number', 15)->nullable();
            $table->text('transaction_id');
            $table->boolean('is_approved')->default(false);
            $table->softDeletes(); 
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
        Schema::dropIfExists('online_payments');
    }
}
