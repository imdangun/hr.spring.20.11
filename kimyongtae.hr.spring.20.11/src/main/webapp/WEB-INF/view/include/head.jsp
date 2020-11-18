<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%
	application.setAttribute("contextPath", request.getContextPath());
	request.setAttribute("myUri", request.getRequestURI());
%>
<script>
$(initAlert);
</script>
<div class='row'>
	<div class='col'>
		<div class='card bg-light p-1 text-center mb-4'>
			<h3><a href='${contextPath}' class='text-decoration-none' tabindex='-1'>HR</a></h3>
		</div>
	</div>
</div>
<div class='row'>
	<div class='col-4'>
		<nav>
			<div class='nav nav-tabs nav-pills'>
				<a href='${contextPath}/employee' class='nav-link 
				${myUri.contains("employee") ? "active" : "" }'>&nbsp;사원&nbsp;</a>
				<a href='${contextPath}/sale' class='nav-link 
				${myUri.contains("sale") ? "active" : "" }''>&nbsp;매출&nbsp;</a>
			</div>
		</nav>
	</div>
	
	<div class='col'>
		<div id='alert' class='alert alert-success alert-dismissible fade p-0 pl-4 mb-1'>
			<span id='msg'></span>
			<button type='button' id='closeBtn' class='close p-0'>
				<span>&times;</span>
			</button>	
			<button type='button' class='close' data-dismiss='alert'>
				<span>&times;</span>
			</button>	
		</div>		
	</div>		
</div>