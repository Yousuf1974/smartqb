<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('student_name');
            $table->string('student_class')->nullable();
            $table->string('student_contact')->nullable();
            $table->string('guardian_contact')->nullable();
            $table->string('clg_name')->nullable();
            $table->foreignId('batch_id')->index()->constrained()->onDelete('cascade')->onUpdate('cascade');
            $table->foreignId('institution_id')->index();
            $table->string('user_profile')->nullable();
            $table->boolean('is_active')->default(true);
            $table->tinyText('note_address')->nullable();
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
        Schema::dropIfExists('students');
    }
}
