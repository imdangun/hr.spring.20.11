function alert(msg, result = true) {
	if(result) {
		list();		
		
		for(input of inputs)
			input.val('');
		
		$('#msg').removeClass('alert-danger').addClass('alert-success');
	} else $('#msg').removeClass('alert-success').addClass('alert-danger');	
	
	$('#msg').text(msg);
	$('#alert').show();	
}