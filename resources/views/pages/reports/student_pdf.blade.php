<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Student Report</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <table class="table table-sm text-sm table-bordered">
                <thead class="text-center">
                    <tr>
                        <th>SL</th>
                        <th>Admission</th>
                        <th>Name</th>
                        <th>Contact</th>
                        <th>Guardian Name</th>
                        <th>Contact</th>
                        <th>Batch</th>
                        <th>Class</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    @foreach($students as $student)
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>{{date('d-M,y', strtotime($student->admission_date))}}</td>
                        <td>{{$student->student_name}}</td>
                        <td>{{$student->student_contact ?? "N/A"}}</td>
                        <td>{{$student->guardian_name ?? "N/A"}}</td>
                        <td>{{$student->guardian_contact ?? "N/A"}}</td>
                        <td>{{$student->batch->batch_name ?? "N/A"}}</td>
                        <td>{{$student->student_class}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>