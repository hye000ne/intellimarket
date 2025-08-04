<%@page import="com.intellimarket.store.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!-- DataTables -->
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
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
	              		<li class="breadcrumb-item">상품 관리</li>
	              		<li class="breadcrumb-item active">상품 목록</li>
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
		                	<table id="productListTable" class="table table-bordered table-hover text-center">
		                  		<thead class="align-middle">
			                  		<tr>
			                  			<th>카테고리</th>
					                    <th>상품명</th>
					                    <th>브랜드</th>
					                    <th>가격</th>
					                    <th>판매 건수</th>
					                    <th>재고</th>
					                    <th>등록일</th>
					                    <th>수정일</th>
					                    <th>상세</th>
					                    <th>수정</th>
					                    <th>상품 상태 변경</th>
			                  		</tr>
			                  	</thead>
			                  	<tbody>
									<c:forEach var="product" items="${list}">
				                  		<tr>
				                  			<td>${product.subCategory.topCategory.categoryName} > ${product.subCategory.categoryName}</td>
				                    		<td>${product.productName}</td>
				                    		<td>${product.brandName}</td>
				                    		<td>${product.price}</td>
				                    		<td>${product.salesCount}</td>
				                    		<td>${product.productStock}</td>
				                    		<!-- 판매중지 , 품절이 추가되면 <td>${product.status.label}</td> -->
				                    		<td>${product.createdDate}</td>
				                    		<td>${product.updatedDate}</td>
				                    		<td><button type="button" class="btn btn-block btn-info btn-sm" onclick="goToDetail(${product.productId})">상세</button></td>
				                    		<td><button type="button" class="btn btn-block btn-primary btn-sm" onclick="goToUpdate(${product.productId})">수정</button></td>
			                    			<td>
											<c:choose>
											  <c:when test="${product.status eq 'INACTIVATE'}">
											    <button type="button" class="btn btn-block btn-danger btn-sm" data-toggle="modal"
											            data-target="#statusModal"
											            onclick="setProductStatus(${product.productId}, 'ACTIVATE')">
											      비활성화
											    </button>
											  </c:when>
											  <c:when test="${product.status eq 'ACTIVATE'}">
											    <button type="button" class="btn btn-block btn-success btn-sm" data-toggle="modal"
											            data-target="#statusModal"
											            onclick="setProductStatus(${product.productId}, 'INACTIVATE')">
											      활성화
											    </button>
											  </c:when>
											</c:choose>
											</td>
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

<!-- 상품 상태 수정 모달 -->
<div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<form id="setProductStatusForm" method="post" action="/store/seller/manage/product/updateProductStatus">
        		<div class="modal-header">
	         		<h5 class="modal-title" id="statusModalLabel">상품 상태 변경</h5>
	          		<button type="button" class="close" data-dismiss="modal" aria-label="닫기">
	            		<span aria-hidden="true">&times;</span>
	          		</button>
        		</div>

		        <div class="modal-body">
		          	<input type="hidden" name="productId" id="statusProductId"/>
					<input type="hidden" name="status" id="statusValue"/>
		          	<div class="form-group">
		            	<label> 상품 상태가 활성화 <-> 비활성화 로 변경됩니다.</label>
		            	<label> 상품 상태가 비활성화인 경우 , 쇼핑몰에 노출되지 않습니다.</label>
		          	</div>
        		</div>

        		<div class="modal-footer">
          			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          			<button type="button" class="btn btn-danger" onclick="submitProductStatusForm()">확인</button>
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
	function goToDetail(productId) {
		location.href='/store/seller/manage/product/detail?productId='+productId;
	}
	
	function goToUpdate(productId) {
		location.href='/store/seller/manage/product/update?productId='+productId;
	}

	function setProductStatus(productId, status) {
	    document.getElementById("statusProductId").value = productId;
	    document.getElementById("statusValue").value = status;
	}

	function submitProductStatusForm() {
		if (confirm('정말 상품 상태를 변경 하시겠습니까?')) {
	        $('#setProductStatusForm').submit();
	    }
	}
	
	$(function() {
		$("#productListTable").DataTable({
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
		}).buttons().container().appendTo('#productListTable_wrapper .col-md-6:eq(0)');
	});
</script>