<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.SaleServiceImpl' %>
<%@ page import='java.util.List' %>
<%@ include file='../include/lib.jsp' %>

<%
	List<Integer> empIdList = null;
	Object empIdListObj = session.getAttribute("empIdList");
	
	if(empIdListObj != null) {
		empIdList = (List<Integer>) empIdListObj;
	} else {
		empIdList = new SaleServiceImpl().getEmployeeIdsNoSale();
		session.setAttribute("empIdList", empIdList);
	}
	
	int empIdListSize = empIdList.size();
	if(empIdListSize > 0) {
		int empId = empIdList.get(empIdListSize - 1);	
%>
		<div class='container'>
			<%@ include file='../include/head.jsp' %>
			<form action='addSaleProc.jsp'>
				<input type='hidden' name='empId' value='<%= empId %>'/>
				<div class='row form-group'>
					<label for='sales' class='col-4 col-form-label'>
						<strong><%= empId %></strong>번 사원의 매출액(억): 
					</label>
					<div class='col-5'>
						<input type='number' max='99' class='form-control' id='sales' 
							name='sales' placeholder='99억 이하를 입력하세요.' autofocus/>
					</div>
					<div class='col-3'>
						<a href='listSales.jsp?job=2' class='btn btn-outline-secondary'>취소</a>
						<button type='submit' class='btn btn-outline-primary'>확인</button> 
					</div>
				</div>
			</form>
		</div>
<%
	} else {
		session.removeAttribute("empIdList");		
%>
		<c:redirect url='listSales.jsp'>
			<c:param name='msg' value='매출 미동록 사원을 먼저 추가한 뒤, 매출을 추가하세요.'/>
			<c:param name='job' value='2'/>
		</c:redirect>
<%
	}
%>		