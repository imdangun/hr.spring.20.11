// alert 을 연다.
function alert(msg, result = true) {
	if(result) {
		list();		
		
		for(input of inputs)
			input.val('');
		
		$('#alert').removeClass('alert-danger').addClass('alert-success');
	} else $('#alert').removeClass('alert-success').addClass('alert-danger');	
	
	$('#alert').text(msg);
	$('#alert').addClass('show');	
}

// 입력값이 있는 지 조사한다.
function isVal(input) {
	let check = false;
	if(input.val()) check = true;
	
	return check;
}

// 라디오 객체를 선택했는 지 조사한다.
function isChecked (){
	let check = false;
	if($(':radio:checked').length) check = true;
	
	return check;
}

// alert 창을 초기화한다.
function initAlert() {
	$('#closeBtn').click(() => closeAlert());
}

//alert 을 닫는다.
function closeAlert() {
	$('#alert').hide();
}
