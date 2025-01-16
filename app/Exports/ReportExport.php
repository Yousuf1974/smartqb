<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ReportExport implements FromArray, WithHeadings
{
    protected $data;
    protected $headings;

    public function __construct(array $data, array $headings)
    {
        $this->data = array_map(function ($row) {
            return array_map(function ($value) {
                return $value === 0 ? '0' : $value;
            }, $row);
        }, $data);
        $this->headings = $headings;
    }

    public function array(): array
    {
        return $this->data;
    }

    public function headings(): array
    {
        return $this->headings;
    }
}

