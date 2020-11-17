<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ include file='../include/lib.jsp' %>
<script>
// 메세지를 출력한다.
/*
function alert(msg, result = true) {
	if(result) {
		listEmployees();		
		
		$('#empName').val('');
		$('#hireDate').val('');
		
		$('#msg').removeClass('alert-danger').addClass('alert-success');
	} else $('#msg').removeClass('alert-success').addClass('alert-danger');	
	
	$('#msg').text(msg);
	$('#alert').show();
}
*/

function closeAlert() {
	$('#alert').hide();
}

// 사용자명을 입력했는지 조사한다.
function isEmpName() {
	let check = false;
	if($('#empName').val()) check = true;
	return check;
}

// 입사일을 입력했는지 조사한다.
function isHireDate() {
	let check = false;
	if($('#hireDate').val()) check = true;
	return check;
}

// 사원을 선택했는지 조사한다.
function isEmpId (){
	let check = false;
	if($(':radio:checked').length) check = true;
	return check;
}

function listEmployees() {
	$('#empList').empty();
	
	$.ajax('employee/list').done(emps => {
		if(emps.length){	
			let empList = [];
			
			$.each(emps, (idx, emp) => {
				empList.push(
					`<tr>
						<th>
							<div class='form-check form-check-inline'>										
								<input type='radio' class='form-check-input' id='empId' name='empId'/>
								<label class='form-check-label' for='empId'>&nbsp; \${emp.empId}</label>
							</div>
						</th>
						<td>\${emp.empName}</td>
						<td class='text-center'>
							\${emp.salary.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}
						</td>
						<td>\${emp.hireDate}</td>
					</tr>`
				);
			});
			
			$('#empList').append(empList.join(''));
		} else $('#empList').append('<tr><td colspan=4>사원이 없습니다.</td></tr>');	
	});
}

// handler 들을 등록한다.
function init() {
	listEmployees();
	
	closeAlert();	
	$('#closeBtn').click(() => closeAlert());
	
	// 사원 추가
	$('#addEmpBtn').click(() => {
		if(isEmpName() && isHireDate()){			
			let emp = {				
				empName: $('#empName').val(),				
				hireDate: $('#hireDate').val()
			};		
			
			$.ajax({
				url: 'employee/add',
				data: emp,
				method: 'post'
			}).done(result => {
				if(result) alert('사원을 추가했습니다.');
				else alert('사원을 추가 하지 못했습니다.');
			});
		}else alert('사원명과 입사일을 입력하세요.', false);
	});	
	
	// 사원 수정
	$('#fixEmpBtn').click(() => {
		if(isEmpId()){
			if(isEmpName() && isHireDate()) {
				let empId = $(':checked').parent().text().trim();
				
				let emp = {	
					empId: empId,
					empName: $('#empName').val(),				
					hireDate: $('#hireDate').val()
				};				
		
				$.ajax({
					url: 'employee/fix',
					data: JSON.stringify(emp),
					contentType: 'application/json',
					method: 'put'
				}).done(result => {
					if(result) alert('사원을 수정했습니다.');
					else alert('사원을 수정 하지 못했습니다.');
				});
			}else alert('사원명과 입사일을 입력하세요.', false);
		}else alert('수정할 사원을 선택하세요.', false);
	});

	// 사원 삭제
	$('#delEmpBtn').click(() => {
		if(isEmpId()) $('#delEmpModal').modal('show');
		else alert('삭제할 사원을 선택하세요.', false);
	});
	
	// 사원 삭제
	$('#delEmpOkBtn').click(() => {
		let empId = $(':checked').parent().text().trim();
		
		$.ajax({
			url: `employee/del/\${empId}`,
			method: 'delete'
		}).done(result => {
			$('#delEmpModal').modal('hide');
			
			if(result) alert('사원을 삭제했습니다.');
			else alert('사원을 삭제 하지 못했습니다.', false);
		});
	});
	
	// 사원ID를 선택하면
	$('#empList').on({
		change() {
			let emp = $(this).parents('tr').find('td');
			
			$('#empName').val(emp.eq(0).text());
			$('#hireDate').val(emp.eq(2).text());
		}
	}, '#empId');
	
	// 연봉 산정
	$('#salaryBtn').click(() => {
		$.ajax('employee/salary').done(result => {
			if(result) alert('연봉을 산정했습니다.');
			else alert('연봉을 산정하지 못했습니다. 매출 추가하세요.', false);
		});
	});
}

$(init);
</script>
<div class='container'>
	<%@ include file='../include/head.jsp' %>
	<div class='row mt-3'>
		<div class='col'>
			<form class='form-inline'>
				<div class='form-group'>
					<label class='my-1 mr-1' for='empName'>사원명:</label>
					<input type='text' class='form-control-sm' id='empName'/>
				</div>
				<div class='form-group mr-1'>
					<label class='my-1 mx-1' for='hireDate'>입사일:</label>
					<input type='date' class='form-control-sm' id='hireDate'/>
				</div>
				<div class='from-group ml-4'>							
					<button type='button' class='btn btn-sm btn-outline-primary' id='addEmpBtn'>추가</button>							
					<button type='button' class='btn btn-sm btn-outline-info' id='fixEmpBtn'>수정</button>
					<button type='button' class='btn btn-sm btn-outline-success' id='delEmpBtn'>삭제</button>
					<button type='button' class='btn btn-sm btn-outline-secondary' id='salaryBtn'>연봉</button>
				</div>	
			</form>
		</div>	
	</div>
	
	<div class='row'>
		<table class='table table-sm'>
			<thead class='thead-light'>
				<tr><th>사원ID</th><th>사원명</th><th class='text-center'>연봉(원)</th><th>&nbsp;&nbsp;입사일</th></tr>
			</thead>
			<tbody id='empList'></tbody>
		</table>
	</div>
</div>

<div id='delEmpModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h5 class='modal-title'>사원 삭제</h5>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p>사원을 삭제하시겠습니까?</p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
				<button type='button' class='btn btn-primary' id='delEmpOkBtn'>확인</button>
			</div>
		</div>
	</div>
</div>