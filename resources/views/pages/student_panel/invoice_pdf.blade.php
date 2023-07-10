<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice Download</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <div class="row">
        <div class="col-md-6 col-sm-12 m-auto">
            @if($online_payment)
            <table class="table table-sm table-striped">
                <caption>Payment Invoice</caption>
                <tbody>
                    <tr>
                        <th>Reference</th>
                        <td>{{$online_payment->reference}}</td>
                        <th>Date</th>
                        <td>{{date('d/m/y', strtotime($online_payment->created_at))}}</td>
                    </tr>
                    <tr>
                        <th>Student Name</th>
                        <td>{{$online_payment->student->student_name}}</td>
                        <th>Batch</th>
                        <td>{{$online_payment->student->batch->batch_name}}</td>
                    </tr>
                    <tr>
                        <th>Payment Year</th>
                        <td>{{$online_payment->payment_year}}</td>
                        <th>Total Paid</th>
                        <td>{{$online_payment->paid_amount}}</td>
                    </tr>
                    <tr>
                        <th>Phone Number</th>
                        <td>{{$online_payment->phone_number}}</td>
                        <th>Trasaction Id</th>
                        <td>{{$online_payment->transaction_id}}</td>
                    </tr>
                    
                </tbody>
            </table>
            @if($online_payment->student->batch->batch_type == 1)
            <table class="table table-sm table-striped">
                <caption>Payment Details</caption>
                <thead>
                    <tr>
                        <th>SL</th>
                        <th>Month-Year</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                 @foreach($online_payment->online_payment_details as $online_payment_detail)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{MONTH_LIST[$online_payment_detail->month]}}-{{$online_payment_detail->payment_year}}</td>
                        <td>{{$online_payment_detail->amount}}</td>
                    </tr>
                 @endforeach
                </tbody>
            </table>
            @endif
            @else 
            <p class="text-center text-danger">No Payment Found!</p>
            @endif
        </div>
    </div>
</body>
</html>