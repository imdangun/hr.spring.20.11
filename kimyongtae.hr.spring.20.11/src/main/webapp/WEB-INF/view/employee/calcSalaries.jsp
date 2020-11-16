<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.EmployeeServiceImpl' %>

<%	
	String msgId = "";
	msgId = new EmployeeServiceImpl().calcSalaries() ? "141" : "140";
%>
	<jsp:forward page='listEmployees.jsp'>	
		<jsp:param name='msgId' value='<%= msgId %>'/>
		<jsp:param name='job' value='1'/>
	</jsp:forward>