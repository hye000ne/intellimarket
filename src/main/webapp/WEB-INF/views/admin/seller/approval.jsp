<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<!-- DataTables -->
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<!-- Content -->
<div class="content-wrapper">
	<!-- Content Header -->
	<div class="content-header">
      	<div class="container-fluid">
	        <div class="row mb-2">
	          	<div class="col-sm-12">
	            	<ol class="breadcrumb float-sm-right">
	              		<li class="breadcrumb-item">판매자 관리</li>
	              		<li class="breadcrumb-item active">가입 승인</li>
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
		                	<table id="approvalListTable" class="table table-bordered table-hover text-center">
		                  		<thead class="align-middle">
			                  		<tr>
					                    <th>이메일</th>
					                    <th>이름</th>
					                    <th>연락처</th>
					                    <th>사업자등록번호</th>
					                    <th>가입일</th>
					                    <th>승인</th>
					                    <th>반려</th>
			                  		</tr>
			                  	</thead>
			                  	<tbody>
									<c:forEach var="seller" items="${list}">
				                  		<tr>
				                    		<td>${seller.email}</td>
				                    		<td>${seller.name}</td>
				                    		<td>${seller.tel}</td>
				                    		<td>${seller.businessNum}</td>
				                    		<td>${seller.createdDate}</td>
				                    		<td><button type="button" class="btn btn-block btn-primary btn-sm" onclick="approve(${seller.sellerId})">승인</button></td>
				                    		<td><button type="button" class="btn btn-block btn-danger btn-sm" onclick="openRejectModal(${seller.sellerId})">반려</button></td>
				                  		</tr>
									</c:forEach>
			               		</tbody>
		               		</table>
	               		</div>
		          	</div>
				</div>
			</div>
		</div>
    </div>
</div>
<form id="sellerApproveForm" name="sellerApproveForm" method="post" action="/admin/seller/changeSellerStatus">
	<input type="hidden" id="approveSellerId" name="sellerId"/>
	<input type="hidden" id="status" name="status" value="APPROVED"/>
</form>
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
	// 승인 처리
	function approve(sellerId) {
		if(confirm("정말 승인하시겠습니까?")) {
			$("#approveSellerId").val(sellerId);
			$("#sellerApproveForm").submit();
		}
	}
	
	// 반려 모달 창 열기
	function openRejectModal(sellerId) {
		$('#rejectModal input[name=sellerId]').val(sellerId);
		$('#rejectModal').modal('show');
	}
	
	// 반려
	$(function() {
		$("#approvalListTable").DataTable({
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
		}).buttons().container().appendTo('#approvalListTable_wrapper .col-md-6:eq(0)');
	});
</script>