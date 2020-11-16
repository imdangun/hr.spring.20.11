<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.SaleServiceImpl' %>
<%@ page import='kimyongtae.hr.domain.Sale' %>
<%@ page import='kimyongtae.hr.util.MyParam' %>
<%@ include file='../include/lib.jsp' %>

<%
	Sale sale = null;
	String empId = request.getParameter("empId");
	
	if(MyParam.isDigit(empId)) {
		sale = new SaleServiceImpl().getSale(Integer.parseInt(empId));	
		pageContext.setAttribute("sale", sale);
%>
		<div class='container'>
			<%@ include file='../include/head.jsp' %>
			<form action='fixSale.jsp'>
				<div class='row form-group'>
					<label for='empId' class='col-2 col-form-label'>사원ID: </label>
					<div class='col-10'>
						<input type='text' class='form-control-plaintext' id='empId'
							name='empId' value='${sale.empId}' readonly/>
					</div>
				</div>
				<div class='row form-group'>
					<label for='sales' class='col-2 col-form-label'>매출액(억): </label>
					<div class='col-10'>						
						<input type='number' max='99' class='form-control' id='sales' autofocus 
							name='sales' value='${String.format("%.0f", sale.sales / 100000000)}'/>
					</div>
				</div>
				<div class='row justify-content-end'>
					<div class='offset-8 col-4'>
						<a href='listSales.jsp?job=2' class='btn btn-outline-secondary'>목록</a>
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
						<h5 class='modal-title'>매출 삭제</h5>
						<button type='button' class='close' data-dismiss='modal'>
							<span>&times;</span>
						</button>
					</div>
					<div class='modal-body'>
						<p>매출을 삭제하시겠습니까?</p>
					</div>
					<div class='modal-footer'>
						<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
						<a href='delSale.jsp?empId=${sale.empId}' class='btn btn-primary'>확인</a>
					</div>
				</div>
			</div>
		</div>
<%
	} else {
%>		
		<c:redirect url='listSales.jsp'>
			<c:param name='msg' value='사원ID를 선택하세요.'/>
			<c:param name='job' value='2'/>
		</c:redirect>
<%
	}
%>		