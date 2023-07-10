<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->string('ref_no');
            $table->date('payment_date');
            $table->foreignId('student_id')->index()->constrained('students')->onDelete('cascade')->onUpdate('cascade');
            $table->tinyInteger('method')->comment('1=cash')->default(1);
            $table->double('amount', 8, 2);
            $table->double('discount', 8, 2)->nullable();
            $table->boolean('is_paid')->default(true);
            $table->double('total_amount');
            $table->foreignId('created_by')->nullable();
            $table->foreignId('updated_by')->nullable();
            $table->string('note')->nullable();
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
        Schema::dropIfExists('payments');
    }
}
