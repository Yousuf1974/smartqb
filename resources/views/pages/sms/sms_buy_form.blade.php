<form action="{{route('sms_buy_store')}}" method="post">
    @csrf
    <input type="hidden" name="id" value="{{session('sms_package')['id']}}">
    <input type="hidden" name="quantity" value="{{session('sms_package')['quantity']}}">
    <input type="hidden" name="validity" value="{{session('sms_package')['validity']}}">
    <input type="hidden" name="price" value="{{session('sms_package')['price']}}">
    <div class="form-group">
        <p>Quantity: <span class="float-right"><b>{{session('sms_package')['quantity']}} (SMS)</b></span></p>
        <p>Validity: 
            <span class="float-right">
                <b>
                    {{date('d-M,Y', strtotime('+' . session('sms_package')['validity'] . ' Day'))}}
                </b>
            </span>
        </p>
        <p>Price: <span class="float-right"><b>{{session('sms_package')['price']}} (TK)</b></span></p>
    </div>
    <div class="form-group">
        <label for="method">Payment Method</label>
        <select name="payment_method" id="" class="form-control form-control-sm">
            <option value="" hidden>Select Payment Method</option>
            <option value="1">Cash</option>
            <option value="2">Bkash</option>
        </select>
    </div>
    <div class="form-group text-center">
        <button type="button" class="btn btn-outline-info previous_proceed">Back</button>
        <button type="submit" class="btn btn-danger">Purchase</button>
    </div>
</form>