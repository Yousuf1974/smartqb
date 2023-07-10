<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSmsPackagePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sms_package_purchases', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sms_package_id');
            $table->foreignId('institution_id')->index()->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->unsignedInteger('validity');
            $table->double('price');
            $table->unsignedInteger('quantity');
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
        Schema::dropIfExists('sms_package_purchases');
    }
}
