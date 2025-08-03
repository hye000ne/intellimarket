<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<c:set var="isEditMode" value="${mode eq 'edit'}"/> <!-- 수정 모드 여부 -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
	        <div class="row mb-2">
	            <div class="col-sm-12">
	                <ol class="breadcrumb float-sm-right">
	                    <li class="breadcrumb-item">주문 관리</li>
	                    <c:choose>
	                    	<c:when test="${isEditMode }"><li class="breadcrumb-item active">주문 수정</li></c:when>
	                    	<c:otherwise><li class="breadcrumb-item active">주문 상세</li></c:otherwise>
	                    </c:choose>
	                </ol>
	            </div>
	        </div>
	    </div>
	</section>

	<section class="content">
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<div class="card-header">
					<h3 class="card-title">주문 정보</h3>
				</div>
				<form id="updateForm">
					 <input type="hidden" id="adressSnapshotId" name="adressSnapshotId" value="${addressSnapshot.adressSnapshotId}">
					 
					<div class="card-body">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문번호</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="orderId" name="orderId" value="${member.email}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9">
								<input type="email" class="form-control" id="email" name="email" value="${member.email}" readonly>
							</div>
						</div>						
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name" value="${member.name}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 상품 카테고리</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 상품</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 개수</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 금액</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 상태</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 시간</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">주문 처리 시간</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<c:choose>
							<c:when test="${isEditMode}">
								<!-- 우편번호 -->
							    <div class="form-group row">
							        <label class="col-sm-3 col-form-label">우편번호</label>
							        <div class="col-sm-9 d-flex">
							            <input type="text" id="zipCode" name="zipCode" class="form-control mr-2" value="${member.zipCode}" readonly style="max-width: 200px;">
							            <button type="button" class="btn btn-outline-secondary" onclick="findZipCode()">우편번호 찾기</button>
							        </div>
							    </div>
							
							    <!-- 기본주소 -->
							    <div class="form-group row">
							        <label class="col-sm-3 col-form-label">배송받을 주소</label>
							        <div class="col-sm-9">
							            <input type="text" id="address" name="address" class="form-control" value="${member.address}" readonly>
							        </div>
							    </div>
							
							    <!-- 상세주소 -->
							    <div class="form-group row">
							        <label class="col-sm-3 col-form-label">상세주소</label>
							        <div class="col-sm-9">
							            <input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${member.detailAddress}">
							        </div>
							    </div>
							</c:when>
							<c:otherwise>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">우편번호</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="zipCode" name="zipCode" value="${member.zipCode}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">배송받을 주소</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="address" name="address" value="${member.address}" readonly>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label">상세주소</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="detailAddress" name="detailAddress" value="${member.detailAddress}" readonly>
									</div>
								</div>
							</c:otherwise>						  	
						</c:choose>
					</div>
					<div class="card-footer text-center">
						<c:choose>
							<c:when test="${isEditMode}">
								<button type="button" onclick="handleActionBtnClick('save')" class="btn btn-primary btn" id="editBtn">저장</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="handleActionBtnClick('edit')" class="btn btn-primary btn" id="editBtn">수정</button>
							</c:otherwise>
						</c:choose>
						<button type="button" onclick="handleActionBtnClick('list')" class="btn btn-secondary btn">목록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>

<!-- 도로명 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function handleActionBtnClick(action){
		if(action === 'edit') {
			location.href = '/admin/member/detail?memberId=' + $("#memberId").val() + '&mode=edit';

		} else if(action === 'save') {
			// 저장
			submitUpdateForm();
		} else if(action === 'list') {
			// 목록
			location.href = '/store/seller/manage/order/list';
		}
	}
	
	function submitUpdateForm(){
		if(!validateUpdateForm()) return;
		
		$.ajax({
			type: 'POST',
			url: '/shop/member/update',
			data: $("#updateForm").serialize(),
			success: function(res) {
				if(res.status === 'ok') {
					alert(res.msg);
					location.href='/admin/member/detail?memberId='+$("#memberId").val();
				} 
			},
			error: function() {
				alert("회원 정보 수정에 실패했습니다.");
			}
		});
	}
	
	// 수정 폼 유효성 검사
	function validateUpdateForm() {
		const zipCode = $('#zipCode').val();
		const address = $('#address').val();
		const detailAddress = $('#detailAddress').val();
		
		if (!zipCode || !address || !detailAddress) {
		  	alert('주소를 모두 입력해주세요.');
		 	return false;
		}
		
		return true;
	}
	
	function findZipCode() {
		// 주소 초기화
		$('#zipCode').val("");
		$('#address').val("");
		$('#detailAddress').val("");
		
	    new daum.Postcode({
	        oncomplete: function(data) {
				$('#zipCode').val(data.zonecode);
				$('#address').val(data.roadAddress);
				$('#detailAddress').focus();
	        }
	    }).open();
	}
	
	$(function(){
		const isEditMode = ${isEditMode};
		if (isEditMode) {
		    $('#detailAddress').prop('readonly', false);
	    	$('#zipCode').click(findZipCode);
		}
		
	});
</script>
