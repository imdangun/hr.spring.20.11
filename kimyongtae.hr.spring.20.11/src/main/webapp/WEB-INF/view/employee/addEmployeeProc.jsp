<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.EmployeeServiceImpl' %>
<%@ page import='kimyongtae.hr.util.MyParam' %>
<%@ include file='../include/lib.jsp' %>

<%
	String empName = request.getParameter("empName");
	String hireDate = request.getParameter("hireDate");
	
	String msgId = "";
	if(MyParam.isVal(empName) && MyParam.isVal(hireDate)) {
		msgId = new EmployeeServiceImpl().addEmployee(empName, MyParam.toDate(hireDate)) ? "111" : "110";
%>
		<jsp:forward page='listEmployees.jsp'>
			<jsp:param name='msgId' value='<%= msgId %>'/>
			<jsp:param name='job' value='1'/>
		</jsp:forward>
<%
	} else {
%>		
		<c:redirect url='addEmployeeIn.jsp'>
			<c:param name='msg' value='사원명과 입사일을 입력하세요.'/>
			<c:param name='job' value='1'/>
		</c:redirect>
<%
	}
%>		