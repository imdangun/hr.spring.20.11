<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ include file='../include/lib.jsp' %>

<div class='container'>
	<%@ include file='../include/head.jsp' %>
	<form action='fix'>
		<div class='row form-group'>
			<label for='empId' class='col-2 col-form-label'>사원ID: </label>
			<div class='col-10'>
				<input type='text' class='form-control-plaintext' id='empId'
					name='empId' value='${emp.empId}' readonly/>
			</div>
		</div>
		<div class='row form-group'>
			<label for='empName' class='col-2 col-form-label'>사원명: </label>
			<div class='col-10'>
				<input type='text' class='form-control' id='empName'
					name='empName' value='${emp.empName}'/>
			</div>
		</div>
		<div class='row form-group'>
			<label for='salary' class='col-2 col-form-label'>연봉: </label>
			<div class='col-10'>
				<input type='text' class='form-control-plaintext' id='salary'
					name='salary' value='${emp.salary} 원' readonly/>
			</div>
		</div>
		<div class='row form-group'>
			<label for='hireDate' class='col-2 col-form-label'>입사일: </label>
			<div class='col-10'>
				<input type='date' class='form-control' id='hireDate'
					name='hireDate' value='${emp.hireDate}'/>
			</div>
		</div>
		<div class='row justify-content-end'>
			<div class='offset-8 col-4'>
				<a href='list' class='btn btn-outline-secondary'>목록</a>
				<button type='submit' class='btn btn-outline-primary'>수정</button>
				<button type='button' class='btn btn-outline-danger'
					data-toggle='modal' data-target='#delModal'>삭제</button>
			</div>
		</div>
	</form>
</div>

<div id='delModal' class='modal fade' tabindex='-1'>
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
				<a href='delEmployee.jsp?empId=${emp.empId}' class='btn btn-primary'>확인</a>
			</div>
		</div>
	</div>
</div>	