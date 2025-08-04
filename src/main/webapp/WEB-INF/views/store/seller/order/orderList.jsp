<%@page import="com.intellimarket.store.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!-- DataTables -->
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/bootstrap/bootstrap.min.css">
<c:if test="${not empty msg}">
	<script>
		alert('${msg}');
	</script>
</c:if>
<!-- Content -->
<div class="content-wrapper">
	<!-- Content Header -->
	<div class="content-header">
      	<div class="container-fluid">
	        <div class="row mb-2">
	          	<div class="col-sm-12">
	            	<ol class="breadcrumb float-sm-right">
	              		<li class="breadcrumb-item">주문 관리</li>
	              		<li class="breadcrumb-item active">주문 목록</li>
	           		</ol>
	          	</div>
	       	</div>
		</div>
    </div>
    <!-- Main content -->
    <div class="content">
    	<div class="container-fluid">
      		<div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		              	<div class="card-body">
		                	<table id="orderListTable" class="table table-bordered table-hover text-center">
		                  		<thead class="align-middle">
			                  		<tr>
			                  			<th>주문번호</th>
					                    <th>이름</th>
					                    <th>연락처</th>
					                    <th>주문상품</th>
					                    <th>개수</th>
					                    <th>주문금액</th>
					                    <th>주문상태</th>
					                    <th>주문시간</th>
					                    <th>주문처리시간</th>
					                    <th>주문 상세</th>
					                    <th>1건 상태 변경</th>
					                    <th>일괄 상태 변경</th>
			                  		</tr>
			                  	</thead>
			                  	<tbody>
									<c:forEach var="order" items="${list}">
				                  		<tr>
				                  			<td>${order.orderId}</td>
				                    		<td>${order.member.name}</td>
				                    		<td>${order.member.phone}</td>
				                    		<td>${order.product.productName}</td>
				                    		<td>${order.quantity}</td>
				                    		<td>${order.totalPrice}</td>
				                    		<td>${order.orderStatus.label}</td>
				                    		<td>${order.createdDate}</td>
				                    		<td>${order.updatedDate}</td>
				                    		<td><button type="button" class="btn btn-block btn-info btn-sm" onclick="goToDetail(${order.orderId})">상세</button></td>
				                    		<td>
											  <button 
											    type="button" 
											    class="btn btn-block btn-primary btn-sm"
											    data-toggle="modal" 
											    data-target="#orderStatusModal"
											    onclick="setOrderStatus(${order.orderId}, '${order.orderStatus}')">
											    상태변경
											  </button>
											</td>
											<td><input type="checkbox" class="orderCheckbox" value="${order.orderId}"></td>
				                  		</tr>
									</c:forEach>
			               		</tbody>
		               		</table>
		               		
		               		<!-- 일괄 수정 버튼 -->
		               		<div class="mt-3 text-right">
        						<button class="btn btn-warning" data-target="#orderStatusModal" onclick="prepareBulkOrderStatus()">일괄 상태 변경</button>
    						</div>
    						
	               		</div>
		          	</div>
				</div>
			</div>
		</div>
    </div>
</div>

<!-- 주문 상태 수정 모달 -->
<div class="modal fade" id="orderStatusModal" tabindex="-1" role="dialog" aria-labelledby="orderStatusModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form id="setOrderStatusForm" method="post" action="/store/seller/manage/order/updateOrderStatus">
				<div class="modal-header">
					<h5 class="modal-title" id="orderStatusModalLabel">주문 상태 변경</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="닫기">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<input type="hidden" name="orderId" id="orderIdInput"/>
			
					<div class="form-group">
						<label>변경할 주문 상태를 선택하세요.</label>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="status" id="status2" value="PREPARING_SHIPMENT">
							<label class="form-check-label" for="status2">배송 준비중</label>
						</div>
			            <div class="form-check">
							<input class="form-check-input" type="radio" name="status" id="status3" value="IN_TRANSIT">
							<label class="form-check-label" for="status3">배송중</label>
			            </div>
			            <div class="form-check">
							<input class="form-check-input" type="radio" name="status" id="status4" value="DELIVERED">
							<label class="form-check-label" for="status4">배송완료</label>
			            </div>
			            <div class="form-check">
							<input class="form-check-input" type="radio" name="status" id="status5" value="CANCEL_COMPLETE">
							<label class="form-check-label" for="status5">취소완료</label>
			            </div>			            
			            <div class="form-check">
							<input class="form-check-input" type="radio" name="status" id="status6" value="CHANGE_COMPLETE">
							<label class="form-check-label" for="status6">교환완료</label>
			            </div>			            
			            <div class="form-check">
							<input class="form-check-input" type="radio" name="status" id="status7" value="RETURN_COMPLETE">
							<label class="form-check-label" for="status7">환불완료</label>
			            </div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="submitOrderStatusForm()">확인</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- DataTables  & Plugins -->
<script src="${ctx}/resources/admin/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/jszip/jszip.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/pdfmake/pdfmake.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/pdfmake/vfs_fonts.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="${ctx}/resources/admin/assets/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>

<script>

	function goToDetail(orderId) {
		location.href='/store/seller/manage/order/detail?orderId='+orderId;
	}

	// 단건 상태 변경을 위한 세팅
	function setOrderStatus(orderId, status) {
		// 단건 상태 변경 labl text 변경
		$('#orderStatusModalLabel').text('단건 상태 변경');
		
	    // 기존 복수용 input 제거
	    $('#orderIdsInput').remove();
	
	    // 단건용 input 세팅
	    if ($('#orderIdInput').length === 0) {
	        $('<input>', {
	            type: 'hidden',
	            id: 'orderIdInput',
	            name: 'orderId',
	            value: orderId
	        }).appendTo('#setOrderStatusForm');
	    } else {
	        $('#orderIdInput').val(orderId);
	    }
	
	    $('input[name="status"]').prop('checked', false);
	    $('input[name="status"][value="' + status + '"]').prop('checked', true);
	}
	
	// 복수 상태 변경을 위한 세팅
	function prepareBulkOrderStatus() {
	    let checkedIds = $('.orderCheckbox:checked').map(function () {
	        return $(this).val();
	    }).get();
	
	    if (checkedIds.length === 0) {
	        alert('선택된 주문이 없습니다.');
	        return; // 모달 열기 중단
	    }
	
	    // 라벨 텍스트 변경
	    $('#orderStatusModalLabel').text('복수건 상태 변경');
	
	    // 단건용 input 제거
	    $('#orderIdInput').remove();
	
	    // 복수용 input 생성/갱신
	    if ($('#orderIdsInput').length === 0) {
	        $('<input>', {
	            type: 'hidden',
	            id: 'orderIdsInput',
	            name: 'orderIds',
	            value: checkedIds.join(',')
	        }).appendTo('#setOrderStatusForm');
	    } else {
	        $('#orderIdsInput').val(checkedIds.join(','));
	    }
	
	    // 모달 강제 열기
	    $('#orderStatusModal').modal('show');
	}
	
	function submitOrderStatusForm() {
		if (confirm('정말 주문 상태를 변경 하시겠습니까?')) {
	        $('#setOrderStatusForm').submit();
	    }
	}
	
	$(function() {
		$("#orderListTable").DataTable({
			responsive: true,
			lengthChange: false,
			autoWidth: false,
			buttons: [ "copy", "csv", "excel", "pdf", "print", "colvis" ],
			language: {
				search: "검색 :",
				lengthMenu: "_MENU_ 개씩 보기",
				zeroRecords: "일치하는 결과가 없습니다.",
				info: "총 _TOTAL_건 중 _START_ ~ _END_",
				infoEmpty: "데이터 없음",
				infoFiltered: "(전체 _MAX_건 중 필터링)",
				paginate: {
					first: "처음",
					last: "마지막",
					next: "다음",
					previous: "이전"
				},
				buttons: {
					copy: "복사",
					csv: "CSV",
					excel: "엑셀",
					pdf: "PDF",
					print: "인쇄",
					colvis: "컬럼"
				}
			}
		}).buttons().container().appendTo('#orderListTable_wrapper .col-md-6:eq(0)');
	});
</script>