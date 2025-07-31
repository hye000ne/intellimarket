<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
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
	              		<li class="breadcrumb-item">배너 관리</li>
	              		<li class="breadcrumb-item active">배너 목록</li>
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
		              		<div class="card-header d-flex justify-content-between align-items-center">
						        <a href="/admin/market/banner/regist" class="btn btn-primary btn-sm">등록</a>
							</div>
		                	<table id="bannerListTable" class="table table-bordered table-hover text-center">
		                  		<thead class="align-middle">
			                  		<tr>
					                    <th style="width:25%">제목</th>
					                    <th style="width:40%">이미지</th>
					                    <th style="width:10%">노출여부</th>
					                    <th style="width:15%">등록일</th>
					                    <th style="width:10%">삭제</th>
			                  		</tr>
			                  	</thead>
			                  	<tbody>
			                  		<tr>
							            <td>메인 상단 배너</td>
							            <td><img src="" style="height:40px;"></td>
							            <td>Y</td>
						             	<td>2025-07-30</td>
							            <td><button class="btn btn-block btn-primary btn-sm" onclick="bannerDelete()">삭제</button></td>
						            </tr>
									<c:forEach var="banner" items="${list}">
				                  		<tr>
				                    		<td>${banner.title}</td>
				                    		<td>${banner.img}</td>
				                    		<td>${banner.status}</td>
				                    		<td>${banner.createdDate}</td>
								            <td><button class="btn btn-block btn-primary btn-sm" onclick="bannerDelete(${banner.bannerId})">삭제</button></td>
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
	function bannerDelete() {
		if (confirm('정말 삭제하시겠습니까?')) {
	    }
	}
	
	$(function() {
		$("#bannerListTable").DataTable({
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
		}).buttons().container().appendTo('#bannerListTable_wrapper .col-md-6:eq(0)');
	});
</script>