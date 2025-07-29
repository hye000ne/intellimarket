<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<c:set var="isEditMode" value="${mode eq 'edit'}"/> <!-- 수정 모드 여부 -->
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
	        <div class="row mb-2">
	            <div class="col-sm-12">
	                <ol class="breadcrumb float-sm-right">
	                    <li class="breadcrumb-item">회원 관리</li>
	                    <c:choose>
	                    	<c:when test="${isEditMode }"><li class="breadcrumb-item active">회원 수정</li></c:when>
	                    	<c:otherwise><li class="breadcrumb-item active">회원 상세</li></c:otherwise>
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
					<h3 class="card-title">회원 정보</h3>
				</div>
				<form id="updateForm">
					 <input type="hidden" id="memberId" name="memberId" value="${member.memberId}">
					 
					<div class="card-body">
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
							<label class="col-sm-3 col-form-label">생년월일</label>
							<div class="col-sm-9">
								<input type="date" class="form-control" id="birth" name="birth" value="${member.birth}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">연락처</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" readonly>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">성별</label>
							<div class="col-sm-9">
								<c:choose>
									<c:when test="${isEditMode}">
										<div class="form-check form-check-inline">
								        	<input class="form-check-input" type="radio" name="gender" id="genderM" value="M" <c:if test="${member.gender eq 'M'}">checked</c:if>>
								        	<label class="form-check-label" for="genderM">남자</label>
								      	</div>
								      	<div class="form-check form-check-inline">
								        	<input class="form-check-input" type="radio" name="gender" id="genderF" value="F" <c:if test="${member.gender eq 'F'}">checked</c:if>>
								        	<label class="form-check-label" for="genderF">여자</label>
							     		</div>
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" id="gender" name="gender" value="${member.gender eq 'M' ? '남자':'여자'}" readonly>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">상태</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="status" name="status" value="${member.status}" readonly>
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
							        <label class="col-sm-3 col-form-label">주소</label>
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
									<label class="col-sm-3 col-form-label">주소</label>
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
			location.href = '/admin/member/list';
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
		const name = $('#name').val();
		const birth = $('#birth').val();
		const phone = $('#phone').val();
		const zipCode = $('#zipCode').val();
		const address = $('#address').val();
		const detailAddress = $('#detailAddress').val();
		
		if (!name || !/^[가-힣]{2,}$/.test(name)) {
		  	alert('이름을 한글 2자 이상으로 입력하세요.');
		  	return false;
		}
		
		if (!birth) {
		  	alert('생년월일을 입력하세요.');
		  	return false;
		}
		
		if (!phone || !/^\d{10,11}$/.test(phone)) {
		  	alert('휴대폰 번호를 숫자만 입력하세요.');
		  	return false;
		}
		
		if (!zipCode || !address || !detailAddress) {
		  	alert('주소를 모두 입력해주세요.');
		 	return false;
		}
		
		if (!$('[name="gender"]').is(':checked')) {
		  	alert('성별을 선택해주세요.');
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
		    $('#name').prop('readonly', false);
		    $('#birth').prop('readonly', false);
		    $('#phone').prop('readonly', false);
		    $('#detailAddress').prop('readonly', false);
		}
		
	    $('#zipCode').click(findZipCode);
	});
</script>
