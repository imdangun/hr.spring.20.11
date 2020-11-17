<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8' %>
<%@ include file='../include/lib.jsp' %>
<script>
// 메세지를 출력한다.
function alert(msg, result = true) {
	if(result) {
		listSales();		
		
		$('#sales').val('');
		
		$('#msg').removeClass('alert-danger').addClass('alert-success');
	} else $('#msg').removeClass('alert-success').addClass('alert-danger');	
	
	$('#msg').text(msg);
	$('#alert').show();
}

function closeAlert() {
	$('#alert').hide();
}

// 매출액을 입력했는지 조사한다.
function isSales() {
	let check = false;
	if($('#sales').val()) check = true;
	return check;
}

// 사원을 선택했는지 조사한다.
function isEmpId (){
	let check = false;
	if($(':radio:checked').length) check = true;
	return check;
}

function listSales() {
	$('#saleList').empty();
	
	$.ajax('sale/list').done(sales => {
		if(sales.length){	
			let saleList = [];
			
			$.each(sales, (idx, sale) => {
				saleList.push(
					`<tr>
						<th>
							<div class='form-check form-check-inline'>										
								<input type='radio' class='form-check-input' id='empId' name='empId'/>
								<label class='form-check-label' for='empId'>&nbsp; \${sale.empId}</label>
							</div>
						</th>
						<td class='text-center'>
							\${sale.sales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}
						</td>
						<td>\${sale.regDate}</td>
					</tr>`
				);
			});
			
			$('#saleList').append(saleList.join(''));
		} else $('#saleList').append('<tr><td colspan=4>매출이 없습니다.</td></tr>');	
	});
}

// handler 들을 등록한다.
function init() {
	listSales();
	
	closeAlert();	
	$('#closeBtn').click(() => closeAlert());
	
	// 매출 추가
	$('#addSaleBtn').click(() => {
		if(isSale()){			
			$.ajax({
				url: 'sale/add',
				data: $('#sales').val(),
				method: 'post'
			}).done(result => {
				if(result) alert('매출을 추가했습니다.');
				else alert('매출을 추가 하지 못했습니다.');
			});
		}else alert('매출액을 입력하세요.', false);
	});	
	
	// 매출 수정
	$('#fixSaleBtn').click(() => {
		if(isEmpId()){
			if(isSales()) {			
				let empId = $(':checked').parent().text().trim();				
				
				let sale = {	
					empId: empId,
					sales: $('#sales').val()
				};				
		
				console.log(sale);
				$.ajax({
					url: 'sale/fix',
					data: JSON.stringify(sale),
					contentType: 'application/json',
					method: 'put'
				}).done(result => {
					if(result) alert('매출을 수정했습니다.');
					else alert('매출을 수정 하지 못했습니다.');
				});
			}else alert('매출액을 입력하세요.', false);
		}else alert('매출을 수정할 사원을 선택하세요.', false);
	});

	// 매출 삭제
	$('#delSaleBtn').click(() => {
		if(isEmpId()) $('#delSaleModal').modal('show');
		else alert('삭제할 매출을 선택하세요.', false);
	});
	
	// 매출 삭제
	$('#delSaleOkBtn').click(() => {
		let empId = $(':checked').parent().text().trim();
		
		$.ajax({
			url: `sale/del/\${empId}`,
			method: 'delete'
		}).done(result => {
			$('#delSaleModal').modal('hide');
			
			if(result) alert('매출을 삭제했습니다.');
			else alert('매출을 삭제 하지 못했습니다.', false);
		});
	});
	
	// 사원ID를 선택하면
	$('#saleList').on({
		change() {
			let emp = $(this).parents('tr').find('td');
			
			$('#sales').val(emp.eq(0).text().trim().replaceAll(',', ''));
		}
	}, '#empId');
}

$(init);
</script>
<div class='container'>
	<%@ include file='../include/head.jsp' %>
	<div class='row mt-3'>
		<div class='offset-4 col-8'>
			<form class='form-inline'>
				<div class='form-group'>
					<label class='my-1 mr-1' for='sale'>매출액: </label>
					<input type='number' class='form-control-sm' id='sales'/>
				</div>
				<div class='ml-4'>	
					<button type='button' class='btn btn-sm btn-outline-info' id='fixSaleBtn'>수정</button>
					<button type='button' class='btn btn-sm btn-outline-success' id='delSaleBtn'>삭제</button>
					<button type='button' class='btn btn-sm btn-outline-secondary ml-3' id='addSaleBtn'>추가</button>					
				</div>					
			</form>
		</div>	
	</div>
	<div class='row'>
		<div class='col'>
			<table class='table table-sm'>
				<thead class='thead-light'>
					<tr><th>사원ID</th><th class='text-center'>매출(원)</th><th>&nbsp;&nbsp;등록일</th></tr>
				</thead>
				<tbody id='saleList'></tbody>
			</table>
		</div>
	</div>
</div>

<div id='delSaleModal' class='modal fade' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header'>
				<h5 class='modal-title'>매출 삭제</h5>
				<button type='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body'>
				<p>매출을 삭제하시겠습니까?</p>
			</div>
			<div class='modal-footer'>
				<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>
				<button type='button' class='btn btn-primary' id='delSaleOkBtn'>확인</button>
			</div>
		</div>
	</div>
</div>