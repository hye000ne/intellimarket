<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!-- 상단 배너 -->
<div class="slider-area">
    <div class="single-slider slider-height2 d-flex align-items-center" data-background="${ctx}/resources/shop/assets/img/hero/category.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center">
                        <h2>회원가입</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="login_part section_padding">
    <div class="container">
        <div class="row justify-content-center">
        	<!-- 회원가입 폼 -->
			<div class="col-lg-8 col-md-10">
				<div class="login_part_form">
                    <div class="login_part_form_iner">
						<form class="row contact_form" id="joinForm">
							<input type="hidden" id="role" name="role" value="USER"/>
							<!-- 이메일 -->
							<div class="col-md-12 form-group">
							  	<label for="email">이메일</label>
							  	<div class="email-check-group">
							    	<input type="email" id="email" name="email" class="form-control" required />
							    	<button type="button" id="btnCheckEmail" class="btn-check">중복확인</button>
							  	</div>
							</div>
			
			              	<!-- 비밀번호 -->
						    <div class="col-md-6 form-group">
						      	<label for="password">비밀번호 (영문, 숫자, 특수문자 8~16자)</label>
						      	<input type="password" id="password" name="password" class="form-control" required />
						    </div>
						    <div class="col-md-6 form-group">
						      	<label for="passwordConfirm">비밀번호 확인</label>
						      	<input type="password" id="passwordConfirm" name="passwordConfirm" class="form-control" required />
						    </div>
			
			              	<!-- 이름 -->
						    <div class="col-md-6 form-group">
						      	<label for="name">이름</label>
						      	<input type="text" id="name" name="name" class="form-control" required />
						    </div>
			
			              	<!-- 생년월일 -->
						    <div class="col-md-6 form-group">
						      	<label for="birth">생년월일</label>
						      	<input type="date" id="birth" name="birth" class="form-control" required />
						    </div>
			
			              	<!-- 휴대폰 -->
						    <div class="col-md-12 form-group">
						      	<label for="phone">휴대폰 번호 (숫자만 입력)</label>
						      	<input type="text" id="phone" name="phone" class="form-control" required />
						    </div>
						    
						    <!-- 주소 -->
							<div class="col-md-12 form-group">
							  	<label for="address" class="form-label">주소</label>
							  	<div class="row g-2">
							    	<!-- 우편번호 -->
							    	<div class="col-5 col-sm-4">
							      		<input type="text" id="zipCode" name="zipCode" class="form-control" placeholder="우편번호" readonly required>
							    	</div>
							    	<div class="col-7 col-sm-4">
							      		<button type="button" class="btn-check" onclick="findZipCode()">우편번호 찾기</button>
						    		</div>
							    	<!-- 기본주소 -->
							    	<div class="col-12 mt-2">
							      		<input type="text" id="address" name="address" class="form-control" placeholder="기본 주소" readonly required>
							    	</div>
							    	<!-- 상세주소 -->
							    	<div class="col-12 mt-2">
							      		<input type="text" id="detailAddress" name="detailAddress" class="form-control" placeholder="상세 주소" required>
							    	</div>
							  	</div>
							</div>
										
			              	<!-- 성별 -->
						    <div class="col-md-12 form-group">
						      	<label>성별</label><br />
						      	<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="gender" id="genderM" value="M" checked/>
						        	<label class="form-check-label" for="genderM">남자</label>
						      	</div>
						      	<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="gender" id="genderF" value="F" />
						        	<label class="form-check-label" for="genderF">여자</label>
					     		</div>
						    </div>
						
						    <!-- 약관 동의 -->
						    <div class="col-md-12 form-group">
						      	<div class="form-check">
						        	<input class="form-check-input" type="checkbox" id="agree" required />
						        	<label class="form-check-label" for="agree">이용약관 및 개인정보 수집에 동의합니다. (필수)</label>
						      	</div>
						    </div>
						
						    <!-- 버튼 -->
						    <div class="col-md-12 form-group">
						      	<button type="button" class="btn_3 w-100" onclick="submitJoinForm()">회원가입</button>
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
			success : function(res){
				if(res.status === 'ok') {
					alert(res.msg);
					isEmailChecked = true;
					$('#email').prop('readonly', true);
					$("#btnCheckEmail").text('재입력');
				} else {
					alert(res.msg);
					isEmailChecked = false;
				}
			}, 
			error : function(xhr) {
				const res = JSON.parse(xhr.responseText);
				alert(res.msg);
			}
		});
	}
	
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
				} else { 
					alert(res.msg);
				}
			}, 
			error : function(xhr) {
				const res = JSON.parse(xhr.responseText);
				alert(res.msg);
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
		
		if (!$('#agree').is(':checked')) {
		  	alert('약관에 동의해주세요.');
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