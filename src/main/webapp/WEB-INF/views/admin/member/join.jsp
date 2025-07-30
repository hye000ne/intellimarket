<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
	        <div class="row mb-2">
	            <div class="col-sm-12">
	                <ol class="breadcrumb float-sm-right">
	                    <li class="breadcrumb-item">회원 관리</li>
                    	<li class="breadcrumb-item active">회원 등록</li>
	                </ol>
	            </div>
	        </div>
	    </div>
	</section>

	<section class="content">
		<div class="container-fluid d-flex justify-content-center">
			<div class="card card-outline card-primary" style="width: 800px;">
				<div class="card-header">
					<h3 class="card-title">회원 등록</h3>
				</div>
				<form id="joinForm">
					<div class="card-body">
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">이메일</label>
							<div class="col-sm-9 d-flex">
								<input type="email" class="form-control mr-2" id="email" name="email" style="max-width: 300px;">
								<button type="button" id="btnCheckEmail" class="btn btn-outline-secondary">중복확인</button>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">비밀번호</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="password" name="password" placeholder="영문, 숫자, 특수문자 8~16자">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">비밀번호 확인</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">이름</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">생년월일</label>
							<div class="col-sm-9">
								<input type="date" class="form-control" id="birth" name="birth">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">휴대폰 번호</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="phone" name="phone" placeholder="숫자만 입력">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">성별</label>
							<div class="col-sm-9">
								<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="gender" id="genderM" value="M">
						        	<label class="form-check-label" for="genderM">남자</label>
						      	</div>
						      	<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="gender" id="genderF" value="F">
						        	<label class="form-check-label" for="genderF">여자</label>
					     		</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-3 col-form-label">구분</label>
							<div class="col-sm-9">
								<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="role" id="roleA" value="ADMIN">
						        	<label class="form-check-label" for="roleA">관리자</label>
						      	</div>
						      	<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="role" id="roleU" value="USER">
						        	<label class="form-check-label" for="roleU">회원</label>
					     		</div>
							</div>
						</div>
							<!-- 우편번호 -->
						    <div class="form-group row">
						        <label class="col-sm-3 col-form-label">우편번호</label>
						        <div class="col-sm-9 d-flex">
						            <input type="text" id="zipCode" name="zipCode" class="form-control mr-2" style="max-width: 200px;" readonly>
						            <button type="button" class="btn btn-outline-secondary" onclick="findZipCode()">우편번호 찾기</button>
						        </div>
						    </div>
						
						    <!-- 기본주소 -->
						    <div class="form-group row">
						        <label class="col-sm-3 col-form-label">주소</label>
						        <div class="col-sm-9">
						            <input type="text" id="address" name="address" class="form-control" readonly>
						        </div>
						    </div>
						
						    <!-- 상세주소 -->
						    <div class="form-group row">
						        <label class="col-sm-3 col-form-label">상세주소</label>
						        <div class="col-sm-9">
						            <input type="text" id="detailAddress" name="detailAddress" class="form-control">
						        </div>
						    </div>
					</div>
					<div class="card-footer text-center">
						<button type="button" onclick="handleActionBtnClick('save')" class="btn btn-primary btn" id="saveBtn">저장</button>
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
	let isEmailChecked = false; // 중복확인 여부 체크
	
	// 중복확인 Ajax
	function checkEmailDuplicate() {
		const email = $('#email').val();
		if (!email) {
			alert('이메일을 입력하세요.');
		    return;
		}
		  
		$.ajax({
			type: 'POST',
			url: '/shop/member/checkEmailDuplicate',
			data : {email : email},
			success : function(){
				alert('사용 가능한 이메일입니다.');
				isEmailChecked = true;
				$('#email').prop('readonly', true);
				$("#btnCheckEmail").text('재입력');
			}, 
			error : function(xhr) {
				alert('이미 사용 중인 이메일입니다.');
				isEmailChecked = false;
			}
		});
	}
	
	// 이메일 중복확인 or 재입력 처리
	function handleEmailBtnClick() {
		const isReadonly = $('#email').prop('readonly');
		
		// 재입력 버튼일 때
		if(isReadonly) {
			if(confirm('이메일을 재입력 하시겠습니까?')) {
				isEmailChecked = false;
				$('#email').prop('readonly', false).val('');
				$('#btnCheckEmail').text('중복확인');
			}
			return;
		}
		
		// 중복확인 버튼일 때
		checkEmailDuplicate();
	}
	
	// 회원가입 Ajax
	function submitJoinForm() {
		if (!validateJoinForm()) return;
		
		$.ajax({
			type: 'POST',
			url: '/shop/member/join',
			data: $('#joinForm').serialize(),
			success: function(res) {
				if(res.status === 'ok') {
					alert(res.msg);
					location.href= '/shop/login';
				}
			}, 
			error : function(xhr) {
				alert(xhr.responseText);
			}
		});
	}
	
	// 회원등록 저장 or 목록 이동 처리
	function handleActionBtnClick(action){
		if(action === 'save') {
			// 저장
			submitJoinForm();
		} else if(action === 'list') {
			// 목록
			location.href = '/admin/member/list';
		}
	}
	
	// 회원가입 Ajax
	function submitJoinForm() {
		if (!validateJoinForm()) return;
		
		$.ajax({
			type: 'POST',
			url: '/shop/member/join',
			data: $('#joinForm').serialize(),
			success: function(res) {
				if(res.status === 'ok') {
					alert(res.msg);
					location.href= '/admin/member/list';
				}
			}, 
			error : function(xhr) {
				alert(xhr.responseText);
			}
		});
	}
	
	// 회원가입 폼 유효성 검사
	function validateJoinForm() {
		const email = $('#email').val();
		const pw = $('#password').val();
		const pwConfirm = $('#passwordConfirm').val();
		const name = $('#name').val();
		const birth = $('#birth').val();
		const phone = $('#phone').val();
		const zipCode = $('#zipCode').val();
		const address = $('#address').val();
		const detailAddress = $('#detailAddress').val();
		
		if (!email) {
		  	alert('이메일을 입력하세요.');
		  	return false;
		}
		
		const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,}$/;
		if (!emailReg.test(email)) {
		  	alert('이메일 형식이 올바르지 않습니다.');
		  	return false;
		}
		
		if (!isEmailChecked) {
		  	alert('이메일 중복확인을 해주세요.');
		  	return false;
		}
		
		if (!pw || !pwConfirm) {
		  	alert('비밀번호를 입력하세요.');
		 	return false;
		}
		
		if (pw !== pwConfirm) {
		  	alert('비밀번호가 일치하지 않습니다.');
		  	return false;
		}
		
		const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=\-{}\[\]:;"'<>,.?/~`|\\]).{8,16}$/;
		if (!pwReg.test(pw)) {
			alert('비밀번호는 영문, 숫자, 특수문자를 포함해 8~16자로 입력하세요.');
		  	return false;
		}
		
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
		
		if (!$('[name="role"]').is(':checked')) {
		  	alert('구분 선택해주세요.');
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
		$('#btnCheckEmail').on('click', handleEmailBtnClick);
	    $('#zipCode').click(findZipCode);
	});
</script>
