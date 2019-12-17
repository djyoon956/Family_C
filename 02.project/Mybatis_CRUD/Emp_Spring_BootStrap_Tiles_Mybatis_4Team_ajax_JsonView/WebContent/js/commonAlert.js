function errorAlert(message){
	callAlert("error", message);
}

function successAlert(message){
	callAlert("success", message);
}

function warningAlert(message){
	callAlert("warning", message);
}

function callAlert(icon, message){
	 Swal.fire({
         icon: icon,
         title: message,
         showConfirmButton: false,
         timer: 1500
       })
}