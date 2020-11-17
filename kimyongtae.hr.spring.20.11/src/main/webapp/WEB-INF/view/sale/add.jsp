<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ include file='../include/lib.jsp' %>
<script>
const empIdList = ${empIdList};

function init() {
	$('button').click(() => {
		if($('#sales').val()) {
			$.ajax({	
				data: {
					empId: $('#empId').val(),
					sales: $('#sales').val() * 100000000,
				},
				method: 'post'
			}).done(result => {
				if(result) {
					$('#msg').removeClass('alert-danger').addClass('alert-success');
					$('#msg').text('매출을 추가했습니다.');
				} else {
					$('#msg').removeClass('alert-success').addClass('alert-danger');
					$('#msg').text('매출을 추가 못했습니다.');
				}
				
				nextSale();
			});
		} else {
			$('#msg').removeClass('alert-success').addClass('alert-danger');
			$('#msg').text('매출액을 입력하세요.');
		}
	})
}

function nextSale() {
	if(empIdList.length) {
		let empId = empIdList.pop();
		$('#empId').val(empId);
		$('#empIdLabel').text(empId);
	} else {
		$('#msg').removeClass('alert-success').addClass('alert-danger');
		$('#msg').text('매출을 추가할 사원이 없습니다.');
	}
}

$(() => {
	init();
	nextSale();	
});
</script>
<div class='container'>
	<%@ include file='../include/head.jsp' %>
	<form class='mt-5'>
		<input type='hidden' id='empId' />
		<div class='row'>
			<label for='sales' class='col-4 col-form-label'>
				<strong id='empIdLabel'></strong>번 사원의 매출액(억): 
			</label>
			<div class='col-5'>
				<input type='number' max='99' class='form-control' id='sales' 
					name='sales' placeholder='99억 이하를 입력하세요.'/>
			</div>
			<div class='col-3'>
				<a href='../sale' class='btn btn-outline-secondary'>취소</a>
				<button type='button' class='btn btn-outline-primary'>확인</button> 
			</div>
		</div>
	</form>
</div>