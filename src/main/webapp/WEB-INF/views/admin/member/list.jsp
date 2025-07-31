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
	              		<li class="breadcrumb-item">회원 관리</li>
	              		<li class="breadcrumb-item active">회원 목록</li>
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
		                	<table id="memberListTable" class="table table-bordered table-hover text-center">
		                  		<thead class="align-middle">
			                  		<tr>
					                    <th>이메일</th>
					                    <th>이름</th>
					                    <th>연락처</th>
					                    <th>상태</th>
					                    <th>성별</th>
					                    <th>가입일</th>
					                    <th>수정일</th>
					                    <th>상세</th>
					                    <th>탈퇴</th>
			                  		</tr>
			                  	</thead>
			                  	<tbody>
									<c:forEach var="member" items="${list}">
				                  		<tr>
				                    		<td>${member.email}</td>
				                    		<td>${member.name}</td>
				                    		<td>${member.phone}</td>
				                    		<td>${member.status eq 'ACTIVE' ? '활성':'탈퇴'}</td>
				                    		<td>${member.gender eq 'M' ? '남자':'여자'}</td>
				                    		<td>${member.createdDate}</td>
				                    		<td>${member.updatedDate}</td>
				                    		<td><button type="button" class="btn btn-block btn-primary btn-sm" onclick="goToDetail(${member.memberId})">상세</button></td>
			                    			<td>
												<c:choose>
												    <c:when test="${member.status eq 'INACTIVE'}">탈퇴됨</c:when>
												    <c:otherwise>
												        <button type="button" class="btn btn-block btn-danger btn-sm" data-toggle="modal"
												        	 data-target="#inactiveModal" onclick="setInactiveMemberId(${member.memberId})">
												            탈퇴
												        </button>
												    </c:otherwise>
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

<!-- 탈퇴 모달 -->
<div class="modal fade" id="inactiveModal" tabindex="-1" role="dialog" aria-labelledby="inactiveModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<form id="memberInactiveForm" method="post" action="/admin/member/updateMemberStatus">
        		<div class="modal-header">
	         		<h5 class="modal-title" id="inactiveModalLabel">회원 탈퇴</h5>
	          		<button type="button" class="close" data-dismiss="modal" aria-label="닫기">
	            		<span aria-hidden="true">&times;</span>
	          		</button>
        		</div>

		        <div class="modal-body">
		          	<input type="hidden" name="memberId" id="inactiveMemberId"/>
		          	<input type="hidden" name="status" value="INACTIVE"/>
		          	<div class="form-group">
		            	<label for="inactiveReason">탈퇴 사유</label>
		            	<textarea name="inactiveReason" id="inactiveReason" class="form-control" required></textarea>
		          	</div>
        		</div>

        		<div class="modal-footer">
          			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          			<button type="button" class="btn btn-danger" onclick="submitMemberInactiveForm()">확인</button>
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
	function goToDetail(memberId) {
		location.href='/admin/member/detail?memberId='+memberId;
	}

	function setInactiveMemberId(memberId) {
	    $('#inactiveMemberId').val(memberId);
	}

	function submitMemberInactiveForm() {
		if (confirm('정말 탈퇴 처리하시겠습니까?')) {
	        $('#memberInactiveForm').submit();
	    }
	}
	
	$(function() {
		$("#memberListTable").DataTable({
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
		}).buttons().container().appendTo('#memberListTable_wrapper .col-md-6:eq(0)');
	});
</script>