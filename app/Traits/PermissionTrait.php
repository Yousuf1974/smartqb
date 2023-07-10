<?php
namespace App\Traits;

trait PermissionTrait {
    // CRUD permissions
     // here difine user permissions
    // all permission table list
    /**
     * N:T: Demo permission -> "user" module permissio will be like this
     * "user-index", "user-create", "user-update", "user-destroy"
     * @return array
     */
    public function permission_list() {
       
        return [
            'user', 'batch', 'student', 'payment',
        ];
        // return [
        //     'user', 'role', 'institution', 'batch', 'student', 'payment', 'sms'
        // ];
    }

    // other permission
    // here difine user other permissions
    // other permission
    /**
     * N:T: other permission must be 4 permission in an array 
     * if no permission keep it empty stirng
     * ther permission will be like this "report-student"
     * @return array
     */
    public function other_permission_list() {
        
        return [
            'report' => [
                ['student', 'payment', 'batch', 'user'],
                ['student_payment', '', '', ''],
            ],
            'miscellaneous' => [
                [
                    'Institution Setting' => 'institution_setting', 
                    'User Permission' => 'user_permission',
                    'Custom SMS Send' => 'custom_sms_send', 
                    'SMS History' => 'sms_history',
                ],
                [
                    'SMS Template' => 'sms_template',
                    'SMS Buy' => 'sms_buy','',''
                ],
            ],
            // 'miscellaneous' => [
            //     [
            //         'General Setting' => 'general_setting', 
            //         'Backup Database' => 'database_backup', 
            //         'Institution Setting' => 'institution_setting', 
            //         'User Permission' => 'user_permission',
            //     ],
            //     [
            //         'Login as Institution' => 'login_as_ins', 
            //         'Show User Password' => 'show_psw', 
            //         'Custom SMS Send' => 'custom_sms_send', 
            //         'SMS History' => 'sms_history',
            //     ],
            //     [
            //         'SMS Template' => 'sms_template',
            //         'SMS Buy' => 'sms_buy', 
            //         'SMS Purchase History' => 'sms_purchase_history','',
            //     ],
            // ],
        ];
    }
}