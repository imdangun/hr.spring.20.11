<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ page import='kimyongtae.hr.service.SaleServiceImpl' %>
<%@ page import='kimyongtae.hr.util.MyParam' %>
<%@ page import='java.util.List' %>
<%@ include file='../include/lib.jsp' %>

<%
	String empId = request.getParameter("empId");
	String sales = request.getParameter("sales");
	
	Object empIdListObj = session.getAttribute("empIdList");
	
	String msgId = "";
	if(MyParam.isDigit(empId) && MyParam.isDigit(sales) && empIdListObj != null) {
		msgId = new SaleServiceImpl().addSale(
				Integer.parseInt(empId), Long.parseLong(sales) * 100_000_000) ? "211" : "210";
	
		List<Integer> empIdList = (List<Integer>) empIdListObj;
		empIdList.remove(empIdList.size() - 1);
%>
		<jsp:forward page='addSaleIn.jsp'>
			<jsp:param name='msgId' value='<%= msgId %>'/>
			<jsp:param name='job' value='2'/>
		</jsp:forward>
<%
	} else {
%>
		<c:redirect url='addSaleIn.jsp'>
			<c:param name='msg' value='매출액을 입력하세요.'/>
			<c:param name='job' value='2'/>
		</c:redirect>
<%
	}
%>		