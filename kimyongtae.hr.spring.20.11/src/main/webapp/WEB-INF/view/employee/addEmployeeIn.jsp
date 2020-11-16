<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.EmployeeServiceImpl' %>
<%@ include file='../include/lib.jsp' %>

<div class='container'>
	<%@ include file='../include/head.jsp' %>
	<form action='addEmployeeProc.jsp'>
		<div class='row form-group'>
			<label for='empName' class='col-2 col-form-label'>사원명: </label>
			<div class='col-10'>
				<input type='text' class='form-control' id='empName' name='empName'/>
			</div>
		</div>
		<div class='row form-group'>
			<label for='hireDate' class='col-2 col-form-label'>입사일: </label>
			<div class='col-10'>
				<input type='date' class='form-control' id='hireDate' name='hireDate'/>
			</div>
		</div>
		<div class='row justify-content-end'>
			<div class='offset-9 col-3'>
				<a href='listEmployees.jsp?job=1'>
					<button type='button' class='btn btn-outline-secondary'>취소</button>
				</a>
				<button type='submit' class='btn btn-outline-primary'>확인</button>
			</div>
		</div>
	</form>	
</div>