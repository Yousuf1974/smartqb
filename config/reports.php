<?php

return [
    'list' => [
        1 => [
            'title'   => 'Active Institutions list',
            'query'   => 'SELECT * FROM institutions WHERE is_active = 1',
            'type'    => 'institute',
            'columns' => [
                'id', 'name', 'phone', 'head_of_institution', 'email', 'address',
            ]
        ],
        2 => [
            'title'   => 'In-Active Institutions list',
            'query'   => 'SELECT * FROM institutions WHERE is_active = 0',
            'type'    => 'institute',
            'columns' => [
                'id', 'name', 'phone', 'head_of_institution', 'email', 'address',
            ]
        ],
    ]
];
