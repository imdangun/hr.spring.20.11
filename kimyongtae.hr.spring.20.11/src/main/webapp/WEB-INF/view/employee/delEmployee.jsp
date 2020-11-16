<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.EmployeeServiceImpl' %>
<%@ page import='kimyongtae.hr.util.MyParam' %>
<%@ include file='../include/lib.jsp' %>

<%
	String empId = request.getParameter("empId");

	String msgId = "";
	if(MyParam.isDigit(empId)) {
		msgId = new EmployeeServiceImpl().delEmployee(Integer.parseInt(empId)) ? "131" : "130";
%>
	<jsp:forward page='listEmployees.jsp'>
		<jsp:param name='msgId' value='<%= msgId %>'/>
		<jsp:param name='job' value='1'/>
	</jsp:forward>
<%
	} else {
%>	
		<c:redirect url='listEmployees.jsp'>
			<c:param name='msg' value='사원ID를 선택하세요.'/>
			<c:param name='job' value='1'/>
		</c:redirect>
<%
	}
%>	