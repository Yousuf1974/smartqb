@extends('layouts.admin')
@section('title', 'Quick Payment')

@section('page-header')
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
            <h4 class="m-0">Quick Payment</h4>
            </div><!-- /.col -->
            <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item">
                    <a href="{{route("dashboard")}}">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Quick Payment</li>
            </ol>
            </div><!-- /.col -->
        </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
@endsection

{{-- main content --}}
@section('content')
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Quick Payment</h4>
                </div>
                <div class="card-body">
                    <form action="{{route("payments.quick")}}" method="GET" id="search_form">
                        <div class="row">
                            
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <input type="text" name="search_query" class="form-control form-control-sm" id="search_query" placeholder="Search By- Name, Batch,St. Phone, Guardian Phone" required />
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <select name="year" id="year" placeholder="Select Year" class="form-control form-control-sm" required>
                                        @for ($i = 0; $i < 10; $i++)
                                            <option @if(($year == (2020+$i))) selected @endif value="{{2020+$i}}">{{2020+$i}}</option>
                                        @endfor
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group text-center search_btn">
                                    <button type="submit" class="btn btn-dark btn-sm">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>

                    {{-- search result / student list body --}}
                    <div id="search_result"></div>
                    {{-- <div class="alert alert-success"></div> --}}
                    <div id="quick_payment_box"></div>
                </div>
            </div>
        </div>
    </div>
@endsection

{{-- extra css --}}
@push('css')
<link rel="stylesheet" href="{{asset('plugins/select2/css/select2.min.css')}}"/>
<link rel="stylesheet" href="{{asset('plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}"/>
{{-- nice checkbox --}}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/icheck-bootstrap/3.0.1/icheck-bootstrap.min.css" integrity="sha512-8vq2g5nHE062j3xor4XxPeZiPjmRDh6wlufQlfC6pdQ/9urJkU07NM0tEREeymP++NczacJ/Q59ul+/K2eYvcg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
@endpush

{{-- extra js cdn --}}
@push('js')
<script src="{{asset('plugins/select2/js/select2.min.js')}}"></script>
{{-- nice select --}}

@endpush

{{-- extra js --}}
@push('js')
    <script>
    
        $(document).ready(function(){
            let spinner = `<div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>`;
            let small_spinner = `<div class="spinner-border spinner-border-sm" role="status">
                          <span class="sr-only">Loading...</span>
                        </div>`;
            $("#search_form").on('submit', function(evt) {
                evt.preventDefault();
                $('.search_btn').html(spinner);
                $("#search_result").html('');
                $("#quick_payment_box").html('');
                var ajax = $.ajax({
                    type: "GET",
                    url: "{{route('payments.quick')}}",
                    data: {query:$(this).find('#search_query').val(), year: $('#year').val()},
                    success: function( body ) {
                        $('.search_btn').html(`<button type="submit" class="btn btn-dark">Search</button>`);
                        $("#search_result").html(body);
                    }
                });

                ajax.fail(function(jqXHR, textStatus){
                    $('.search_btn').html(`<button type="submit" class="btn btn-dark">Search</button>`);
                    $("#search_result").html(`<p class="text-center text-danger">${jqXHR.responseJSON.message}</p>`);
                });
                
            });

            $(document).on("change", 'input[name="month[]"]', function(){
                var m_box = [];
                $(this).closest('tr')
                .find('input[name="month[]"]')
                .each(function(index, item){
                    if($(item).is(':checked') && !$(item).attr('disabled')) 
                    {
                        m_box.push($(item).val());
                    }
                });
                
                if(m_box.length > 0) {
                    $(this).closest('tr').find('a.student_list').removeClass('disabled');
                }else {
                    $(this).closest('tr').find('a.student_list').addClass('disabled');
                }
            });

            $(document).on('click', '.student_list', function(evt) {
                var month_arr = [];
                var month_list = $(this).closest('tr').children();
              
                $(month_list[4]).find('input').each(function(index, item){
                    if($(item).is(':checked') && !$(item).attr('disabled')) 
                    {
                        month_arr.push($(item).val());
                    }
                });

                let id = $(this).data('id');
                let year = $(this).data('year');
                let preButton = $(this).parent().html();
                $('#action-'+id).html(small_spinner);
                $('#quick_payment_box').html('');
                $.get('{{route('payments.quick')}}', {student_id: id, year: year, months: month_arr}, function(res){
                    $('#action-'+id).html(preButton);
                    $('#quick_payment_box').html(res);
                });
            });

            // payment_save
            $(document).on('submit', '#qick_payment_save', function(evt){
                evt.preventDefault();
                let spinner = `<div class="spinner-border" role="status">
                                <span class="sr-only">Loading...</span>
                                </div>`;
                let form = new FormData(document.querySelector('#qick_payment_save'));
                let data = Object.fromEntries(form.entries())
                data.select_month = $('#selct_month').val();
                var request = $.ajax({
                    type: "POST",
                    url: "{{route('payments.quick_store')}}",
                    dataType: "json",
                    data: data,
                    beforeSend: function() {
                        $('#submit_button').html(spinner);
                    },
                    success: function(data) {
                        if(data.success) {
                            $(document).find('#qick_payment_save')[0].reset();
                            $(document).find('#qick_payment_save').hide();
                            Swal.fire(
                                'Created!',
                                data.message,
                                'success'
                            );
                            $('#search_form').submit();
                        }
                    }
                });
                request.fail(function(xhr, text){
                    Swal.fire('Error!', text, 'warning!');
                })
            });

        });
    </script>
@endpush