<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTransactionIdToRegistrationManagersTable extends Migration
{
    public function up()
    {
        Schema::table('registration_managers', function (Blueprint $table) {
            $table->string('transaction_id')->nullable()->after('total_days');
        });
    }

    public function down()
    {
        Schema::table('registration_managers', function (Blueprint $table) {
            $table->dropColumn('transaction_id');
        });
    }
}
