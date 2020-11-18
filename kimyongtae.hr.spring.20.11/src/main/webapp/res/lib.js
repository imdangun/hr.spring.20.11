// alert 을 연다.
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

// alert 을 닫는다.
function closeAlert() {
	$('#alert').hide();
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

// 목록 조회 화면을 준비한다.
function prepareList() {
	list();
	
	closeAlert();
	
	$('#closeBtn').click(() => closeAlert());
}
