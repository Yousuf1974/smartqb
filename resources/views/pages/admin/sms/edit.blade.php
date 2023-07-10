{{-- edit form --}}

<form action="{{route('sms.update', ['sms' => $sMS->id])}}" method="POST">
    @csrf
    @method('PUT')
    <div class="form-group">
        <label for="qty">Quantity* (Pcs)</label>
        <input type="number" name="quantity" value="{{$sMS->quantity}}" id="qty" min="0" step="1" class="form-control form-control-sm" placeholder="Quantity" required>
        @error('quantity')
        <p class="text-danger"><small>{{$message}}</small></p>
        @enderror
    </div>
    <div class="form-group">
        <label for="validity">Validity* (Day)</label>
        <input type="number" name="validity" id="validity" value="{{$sMS->validity}}" min="0" step="1" class="form-control form-control-sm" placeholder="Validity(Day)" required>
        @error('validity')
        <p class="text-danger"><small>{{$message}}</small></p>
        @enderror
    </div>
    <div class="form-group">
        <label for="price">Price*</label>
        <input type="number" name="price" id="price" value="{{$sMS->price}}" min="0" step="1" class="form-control form-control-sm" placeholder="Price" required>
        @error('price')
        <p class="text-danger"><small>{{$message}}</small></p>
        @enderror
    </div>
    <div class="form-group">
        <label for="email">Active Status</label>
        <br/>
        <input 
            type="checkbox" 
            name="active_status" 
            value="1" 
            @if($sMS->is_active) checked @endif
            data-toggle="toggle"
            data-onstyle="success"   
            data-offstyle="warning"   
        />
    </div>
    <div class="form-group text-center">
        <button type="submit" class="btn btn-dark">Save</button>
    </div>
</form>

<script>
    $('input[name="active_status"]').bootstrapToggle();
</script>