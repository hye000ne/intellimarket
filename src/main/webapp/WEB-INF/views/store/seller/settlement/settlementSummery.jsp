<%@page import="com.intellimarket.store.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<%
	//현재 년도 및 현재 월 계싼
    java.time.LocalDate today = java.time.LocalDate.now();
    request.setAttribute("currentYear", today.getYear());
    request.setAttribute("currentMonth", String.format("%02d", today.getMonthValue()));
%>
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
<div class="content-wrapper bg-white">
	<!-- Content Header -->
	<div class="content-header">
      	<div class="container-fluid">
	        <div class="row mb-2">
	          	<div class="col-sm-12">
	            	<ol class="breadcrumb float-sm-right">
	              		<li class="breadcrumb-item">정산 관리</li>
	              		<li class="breadcrumb-item active">정산 확인</li>
	           		</ol>
	          	</div>
	       	</div>
		</div>
    </div>

    <!-- Main content -->
	<div class="container p-3">
		<!-- 년도/월 선택 -->
		<form method="get" action="/store/seller/manage/settlement/summery" class="mb-4 d-flex align-items-center">
			<label class="mr-2">년도</label>
			<select name="year" class="form-control mr-3" style="width:120px;" onchange="this.form.submit()">
				<c:forEach begin="2023" end="2025" var="y">
					<option value="${y}" 
					    <c:choose>
					        <c:when test="${not empty param.year}">
					            <c:if test="${param.year == y}">selected</c:if>
					        </c:when>
					        <c:otherwise>
					            <c:if test="${currentYear == y}">selected</c:if>
					        </c:otherwise>
					    </c:choose>
					>${y}년</option>
				</c:forEach>
			</select>

			<label class="mr-2">월</label>
			<select name="month" class="form-control" style="width:100px;" onchange="this.form.submit()">
				<c:forEach begin="1" end="12" var="m">
					<c:set var="monthVal" value="${m lt 10 ? '0' + m : m}" />
					<option value="${monthVal}"
					    <c:choose>
					        <c:when test="${not empty param.month}">
					            <c:if test="${param.month == monthVal}">selected</c:if>
					        </c:when>
					        <c:otherwise>
					            <c:if test="${currentMonth == monthVal}">selected</c:if>
					        </c:otherwise>
					    </c:choose>
					>${m}월</option>
				</c:forEach>
			</select>
		</form>

		<!-- 정산 건수 정보 -->
		<div class="row">
			<div class="col-md-4 col-sm-6 col-12 mb-3">
				<div class="info-box border rounded shadow-sm">
					<span class="info-box-icon bg-warning"><i class="fas fa-clock"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">정산 대기 건수</span>
						<span class="info-box-number">${readyCount}</span>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-12 mb-3">
				<div class="info-box border rounded shadow-sm">
					<span class="info-box-icon bg-primary"><i class="fas fa-sync-alt"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">정산 요청 건수</span>
						<span class="info-box-number">${requestedCount}</span>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-12 mb-3">
				<div class="info-box border rounded shadow-sm">
					<span class="info-box-icon bg-success"><i class="fas fa-check-circle"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">정산 완료 건수</span>
						<span class="info-box-number">${completedCount}</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 정산 금액 정보 -->
		<div class="row mt-3">
			<div class="col-md-4 col-sm-6 col-12 mb-3">
				<div class="info-box border rounded shadow-sm">
					<span class="info-box-icon bg-warning"><i class="fas fa-coins"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">정산 대기 금액</span>
						<span class="info-box-number"><fmt:formatNumber value="${readyAmount}" pattern="#,##0" /> 원</span>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-12 mb-3">
				<div class="info-box border rounded shadow-sm">
					<span class="info-box-icon bg-primary"><i class="fas fa-exchange-alt"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">정산 요청 금액</span>
						<span class="info-box-number"><fmt:formatNumber value="${requestedAmount}" pattern="#,##0" /> 원</span>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-12 mb-3">
				<div class="info-box border rounded shadow-sm">
					<span class="info-box-icon bg-success"><i class="fas fa-dollar-sign"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">정산 완료 금액</span>
						<span class="info-box-number"><fmt:formatNumber value="${completedAmount}" pattern="#,##0" /> 원</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 정산 요청 버튼 -->
		<div class="mt-4 text-right">
		    <button type="button" class="btn btn-danger btn-lg" id="requestSettlementBtn" data-toggle="modal" data-target="#statusModal">
		        정산 요청
		    </button>
		</div>
	</div>
</div>

<!-- 정산 상태 수정 모달 -->
<div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-labelledby="statusModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
    	<div class="modal-content">
      		<form id="settlementStatusForm" method="post" action="/store/seller/manage/settlement/updatestatus">
        		<div class="modal-header">
	         		<h5 class="modal-title" id="statusModalLabel">정산 요청 확인</h5>
	          		<button type="button" class="close" data-dismiss="modal" aria-label="닫기">
	            		<span aria-hidden="true">&times;</span>
	          		</button>
        		</div>

		        <div class="modal-body">
		            <input type="hidden" name="year" value="${param.year}" />
		            <input type="hidden" name="month" value="${param.month}" />
		          	<div class="form-group">
		            	<label>선택한 월의 정산 상태를 <strong>정산요청</strong>으로 변경하시겠습니까?</label>
		          	</div>
        		</div>

        		<div class="modal-footer">
        			<button type="button" class="btn btn-danger" onclick="submitSettlementStatusForm()">확인</button>
          			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        		</div>
      		</form>
    	</div>
  	</div>
</div>

<script>

	function submitSettlementStatusForm() {
		if (confirm('해당 월의 정산 요청을 진행하시겠습니까?')) {
	        $('#settlementStatusForm').submit();
	    }
	}
	
    const readyCount = Number('${readyCount}');

    $('#requestSettlementBtn').click(function(event) {
        if (readyCount === 0) {
            alert('현재 정산 요청 가능한 건이 없습니다.');
            return false;  // 이벤트 전파 및 기본 동작 차단
        }
    });
</script>