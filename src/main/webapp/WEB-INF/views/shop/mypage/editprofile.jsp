<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<c:set var="selectedMenu" value="editProfile" />
<%@ include file="/WEB-INF/views/shop/mypage/common/mypageui.jsp" %>
<section class="login_part">
    <div class="container">
        <div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<div class="login_part_form">
                    <div class="login_part_form_iner">
						<form class="row contact_form" id="editForm">
							<input type="hidden" name="memberId" value="${member.memberId }"/>							
							<div class="col-md-12 form-group">
								<label for="email">이메일</label>
								<input type="email" id="email" name="email" value="${member.email}" class="form-control" readonly />
							</div>
						
							<!-- 이름 -->
							<div class="col-md-6 form-group">
								<label for="name">이름</label>
								<input type="text" id="name" name="name" value="${member.name}" class="form-control" required />
							</div>
						
							<!-- 생년월일 -->
							<div class="col-md-6 form-group">
								<label for="birth">생년월일</label>
								<input type="date" id="birth" name="birth" value="${member.birth}" class="form-control" required />
							</div>
						
							<!-- 휴대폰 -->
							<div class="col-md-12 form-group">
								<label for="phone">휴대폰 번호 (숫자만 입력)</label>
								<input type="text" id="phone" name="phone" value="${member.phone}" class="form-control" required />
							</div>
						
							<!-- 주소 -->
							<div class="col-md-12 form-group">
								<label for="address" class="form-label">주소</label>
								<div class="row g-2">
									<div class="col-5 col-sm-4">
										<input type="text" id="zipCode" name="zipCode" value="${member.zipCode}" class="form-control" readonly required>
									</div>
									<div class="col-7 col-sm-4">
										<button type="button" class="btn-check" onclick="findZipCode()">우편번호 찾기</button>
									</div>
									<div class="col-12 mt-2">
										<input type="text" id="address" name="address" value="${member.address}" class="form-control" readonly required>
									</div>
									<div class="col-12 mt-2">
										<input type="text" id="detailAddress" name="detailAddress" value="${member.detailAddress}" class="form-control" required>
									</div>
								</div>
							</div>
						
							<!-- 성별 -->
							<div class="col-md-12 form-group">
								<label>성별</label><br />
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender" id="genderM" value="M" ${member.gender eq 'M' ? 'checked' : ''} />
									<label class="form-check-label" for="genderM">남자</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender" id="genderF" value="F" ${member.gender eq 'F' ? 'checked' : ''} />
									<label class="form-check-label" for="genderF">여자</label>
								</div>
							</div>
						
							<!-- 버튼 -->
							<div class="col-md-12 form-group">
								<button type="button" class="btn_3 w-100" onclick="submitEditForm()">회원정보 수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- 도로명 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function submitEditForm() {
		if (!validateEditForm()) return;
	
		$.ajax({
			type: 'POST',
			url: '/shop/member/update',
			data: $('#editForm').serialize(),
			success: function(res) {
				if (res.status === 'ok') {
					alert(res.msg);
					location.reload();
				} else {
					alert(res.msg);
				}
			},
			error: function(xhr) {
				const res = JSON.parse(xhr.responseText);
				alert(res.msg);
			}
		});
	}
	
	function validateEditForm() {
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
		return true;
	}
	
	function findZipCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
				$('#zipCode').val(data.zonecode);
				$('#address').val(data.roadAddress);
				$('#detailAddress').focus();
	        }
	    }).open();
	}
	
	$(function(){
	    $('#zipCode').click(findZipCode);
	});
</script>
