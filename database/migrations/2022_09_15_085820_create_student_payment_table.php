<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentPaymentTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('student_id')->index()->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->char('pay_year', 4);
            $table->char('pay_month', 2)->nullable();
            $table->double('pay_amount', 8, 2);
            $table->double('pay_discount', 8, 2)->nullable();
            $table->double('pay_due', 8, 2)->nullable();
            $table->boolean('is_paid')->default(false);
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
        Schema::dropIfExists('student_payment');
    }
}
