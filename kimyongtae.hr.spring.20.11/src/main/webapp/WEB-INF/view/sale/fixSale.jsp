<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.SaleServiceImpl' %>
<%@ page import='kimyongtae.hr.util.MyParam' %>
<%@ include file='../include/lib.jsp' %>

<%
	String empId = request.getParameter("empId");
	String sales = request.getParameter("sales");
	
	String msgId = "";
	if(MyParam.isDigit(empId) && MyParam.isDigit(sales)) {
		msgId = new SaleServiceImpl().fixSale(
				Integer.parseInt(empId), Long.parseLong(sales) * 100_000_000) ? "221" : "220";	
	
%>
		<jsp:forward page='listSales.jsp'>
			<jsp:param name='msgId' value='<%= msgId %>'/>
			<jsp:param name='job' value='2'/>
		</jsp:forward>
<% 
	} else { 
%>
		<c:redirect url='viewSale.jsp'>
			<c:param name='msg' value='매출액을 입력하세요.'/>
			<c:param name='job' value='2'/>
		</c:redirect>
<%
	}
%>			