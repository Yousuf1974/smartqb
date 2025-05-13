<?php

return [
    'list' => [
//        1 => [
//            'title'   => 'Active Institutions list',
//            'query'   => 'SELECT * FROM institutions WHERE is_active = 1',
//            'type'    => 'institute',
//            'columns' => [
//                'id', 'name', 'phone', 'head_of_institution', 'email', 'address',
//            ]
//        ],
//        2 => [
//            'title'   => 'In-Active Institutions list',
//            'query'   => 'SELECT * FROM institutions WHERE is_active = 0',
//            'type'    => 'institute',
//            'columns' => [
//                'id', 'name', 'phone', 'head_of_institution', 'email', 'address',
//            ]
//        ],
        3 => [
            'title'               => 'Fetch Details using Transaction ID',
            'query'               => 'SELECT rm.`institution_id`,i.`name`, i.`head_of_institution`, i.`phone`, rm.`valid_from`, rm.`valid_to`, rm.`account_renew_fee`, rm.`total_days` FROM registration_managers rm LEFT JOIN institutions i ON rm.`institution_id` = i.`id` WHERE rm.transaction_id = {transaction_id};',
            'type'                => 'institute',
            "requiredInputFields" => [
                'transaction_id' => '<div class="col-md-4">
                            <div class="form-group">
                                <label for="transaction_id">Transaction ID <span class="text-danger">*<span></label>
                                <input type="text" class="form-control" id="transaction_id" placeholder="Enter your payment transaction ID">
                            </div>
                        </div>',
            ],
            'columns'             => [
                "institution_id", "name", "head_of_institution", "phone", "valid_from", "valid_to", "account_renew_fee", "total_days"
            ]
        ],
        4 => [
            'title'               => 'Registration Manager Details using date range',
            'query'               => "SELECT rm.`institution_id`, i.`name`,  i.`head_of_institution`, i.`phone`, rm.`valid_from`,  rm.`valid_to`,  rm.`account_renew_fee`, rm.`total_days` FROM registration_managers rm LEFT JOIN institutions i ON rm.`institution_id` = i.`id` WHERE ( rm.`created_at` >= '{from_date}' AND rm.`created_at` <= '{to_date}' ) GROUP BY rm.`institution_id`;",
            'type'                => 'institute',
            "requiredInputFields" => [
                'from_date' => '<div class="col-md-4">
                            <div class="form-group">
                                <label for="from_date">From Date <span class="text-danger">*</span></label>
                                <input type="date" class="form-control" id="from_date" name="from_date">
                            </div>
                        </div>',
                'to_date'   => '<div class="col-md-4">
                          <div class="form-group">
                              <label for="to_date">To Date <span class="text-danger">*</span></label>
                              <input type="date" class="form-control" id="to_date" name="to_date">
                          </div>
                      </div>',
            ],
            'columns'             => [
                "institution_id", "name", "head_of_institution", "phone", "valid_from", "valid_to", "account_renew_fee", "total_days"
            ]
        ],
        5 => [
            'title'               => 'Registration Manager Details based on Remaining Days',
            'query' => "SELECT
    rm.`institution_id`,
    i.`name`,
    i.`head_of_institution`,
    i.`phone`,
    rm.`valid_from`,
    rm.`valid_to`,
    rm.`account_renew_fee`,
    rm.`total_days`,
    IF(DATEDIFF(rm.`valid_to`, CURDATE()) < 0, 0, DATEDIFF(rm.`valid_to`, CURDATE())) AS remaining_days
FROM registration_managers rm
INNER JOIN (
    SELECT institution_id, MAX(valid_to) AS latest_valid_to
    FROM registration_managers
    GROUP BY institution_id
) latest_rm ON rm.institution_id = latest_rm.institution_id AND rm.valid_to = latest_rm.latest_valid_to
LEFT JOIN institutions i ON rm.`institution_id` = i.`id`
WHERE DATEDIFF(rm.`valid_to`, CURDATE()) BETWEEN 0 AND {days_value}
ORDER BY rm.`institution_id` ASC;
",
            'type'                => 'institute',
            "requiredInputFields" => [
                'days_value' => '<div class="col-md-4">
                            <div class="form-group">
                                <label for="days_value">Remaining Days <small><i>(Equal or less than)</i> </small><span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="days_value" name="days_value" placeholder="Enter remaining days">
                            </div>
                        </div>',
            ],
            'columns'             => [
                "institution_id", "name", "head_of_institution", "phone", "valid_from", "valid_to", "account_renew_fee", "total_days", "remaining_days"
            ]
        ],

    ]
];
