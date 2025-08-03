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
	              		<div class="card-header d-flex justify-content-end">
						  	<a href="/admin/market/banner/regist" class="btn btn-primary">등록</a>
						</div>
		              	<div class="card-body">
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
									<c:forEach var="banner" items="${list}">
				                  		<tr>
				                    		<td>${banner.title}</td>
				                    		<td><img src="${ctx}${banner.imagePath}" class="img-fluid" style="max-width: 150px; height: auto;"></td>
				                    		<td>
				                    			
				                    			<input type="checkbox" ${banner.status == 'Y'? 'checked' : ''} onchange="changeStatus(${banner.bannerId }, this.checked)"/>     	
			                    			</td>
				                    		<td>${banner.createdDate}</td>
								            <td><button class="btn btn-block btn-danger btn-sm" onclick="bannerDelete(${banner.bannerId})">삭제</button></td>
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
	function changeStatus(bannerId, isChecked){
		const status = isChecked? 'Y' : 'N';
		location.href = '/admin/market/banner/updateBannerStatus?bannerId='+bannerId+"&status="+status;
	}
	
	function bannerDelete(bannerId) {
		if (confirm('정말 삭제하시겠습니까?')) {
			location.href = '/admin/market/banner/delete?bannerId='+bannerId;
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