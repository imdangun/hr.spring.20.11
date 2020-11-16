<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.SaleServiceImpl' %>
<%@ page import='kimyongtae.hr.util.MyParam' %>
<%@ include file='../include/lib.jsp' %>

<%
	String empId = request.getParameter("empId");

	String msgId = "";
	if(MyParam.isDigit(empId)) {
		msgId = new SaleServiceImpl().delSale(Integer.parseInt(empId)) ? "231" : "230";
%>
		<jsp:forward page='listSales.jsp'>
			<jsp:param name='msgId' value='<%= msgId %>'/>
			<jsp:param name='job' value='2'/>
		</jsp:forward>
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