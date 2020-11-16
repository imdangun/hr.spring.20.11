<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ include file='../include/lib.jsp' %>

<%
	String empId = request.getParameter("empId");
	String empName = request.getParameter("empName");
	String hireDate = request.getParameter("hireDate");
	
	String msgId = "";
	if(MyParam.isDigit(empId) && MyParam.isVal(empName) && MyParam.isVal(hireDate)) {
		msgId = new EmployeeServiceImpl().fixEmployee(
				new Employee(Integer.parseInt(empId), empName, MyParam.toDate(hireDate))) ? "121" : "120";
%>
		<jsp:forward page='listEmployees.jsp'>
			<jsp:param name='msgId' value='<%= msgId %>'/>
			<jsp:param name='job' value='1'/>
		</jsp:forward>
<%
	} else {
%>
		<c:redirect url='viewEmployee.jsp'>
			<c:param name='msg' value='사원명과 입사일을 입력하세요.'/>
			<c:param name='empId' value='<%= empId %>'/>
			<c:param name='job' value='1'/>
		</c:redirect>
<%
	}
%>		