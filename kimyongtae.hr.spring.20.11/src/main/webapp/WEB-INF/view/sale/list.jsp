<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ include file='../include/lib.jsp' %>
<div class='container'>
	<%@ include file='../include/head.jsp' %>
	<div class='row pb-1'>
		<div class='col-2 offset-10'>
			<a href='addSaleIn.jsp?job=2' class='btn btn-sm btn-outline-primary'>추가</a>
		</div>
	</div>
	<div class='row'>
		<div class='col'>
			<table class='table table-sm'>
				<thead class='thead-light'>
					<tr><th>사원ID</th><th class='text-center'>매출(원)</th><th>&nbsp;&nbsp;등록일</th></tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test='${saleList.size() > 0}'>
							<c:forEach var='sale' items='${saleList}'>
								<tr>
									<th>
										<a href='viewSale.jsp?empId=${sale.empId}&job=2' class='text-decoration-none'>
											&nbsp;&nbsp;&nbsp;${sale.empId}
										</a>
									</th>
									<td class='text-center'>
										${String.format("%,10d", sale.sales)}
									</td>
									<td>${sale.regDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan='4' class='text-center'>매출이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>