function customAlertBox(icon,title, msg, showCancel, confirmBtnText) {
    return Swal.fire({
        icon: icon,
        title: title,
        text: msg,
        showCancelButton: showCancel,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: confirmBtnText,
        reverseButtons: true,
        showCloseButton: true,
    });
}

function toaster(icon,msg,timer=1000){
    Toast.fire({
        icon: icon,
        text: msg,
        timer: timer,
    });
}

