<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Student Report</title>
    {{-- <link rel="stylesheet" href="{{asset('dist/css/adminlte.min.css')}}"> --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="row">
        <div class="col-md-12 col-sm-12 text-sm ">
            <table class="table table-sm text-center table-bordered">
                <thead>
                    <tr>
                        <th>SL</th>
                        <th>Ref. No</th>
                        <th>Date</th>
                        <th>Student</th>
                        <th>Batch</th>
                        <th>Year</th>
                        <th>Amount</th>
                        <th>Discount</th>
                        <th>Due</th>
                        <th>Received</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($payments as $payment)
                        <tr>
                            <td>{{$loop->iteration}}</td>
                            <td>{{$payment->ref_no}}</td>
                            <td>{{date('d-M,y', strtotime($payment->payment_date))}}</td>
                            <td>{{$payment->student->student_name}}</td>
                            <td>{{$payment->student->batch->batch_name}}</td>
                            <td>{{$payment->payment_year}}</td>
                            <td>{{$payment->amount ?? 0}}</td>
                            <td>{{$payment->discount ?? 0}}</td>
                            <td>{{$payment->due ?? 0}}</td>
                            <td>{{$payment->payment_received->name ?? "N/A"}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>