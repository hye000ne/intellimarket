<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<!-- 상단 배너 -->
<div class="slider-area">
	<div class="single-slider slider-height2 d-flex align-items-center"
		data-background="${ctx}/resources/shop/assets/img/hero/category.jpg">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="hero-cap text-center">
						<h2>비밀번호 찾기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="login_part section_padding">
	<div class="container">
		<div class="row justify-content-center">
			<!-- 비밀번호 찾기 폼 -->
			<div class="col-lg-6 col-md-8">
				<div class="login_part_form">
					<div class="login_part_form_iner">
						<form class="row contact_form" id="findPwForm">
							<!-- 이메일 -->
							<div class="col-md-12 form-group">
								<label for="email">이메일</label>
								<div class="email-check-group">
									<input type="email" id="email" name="email"
										class="form-control" placeholder="가입 시 등록한 이메일을 입력하세요."
										required />
									<button type="button" class="btn-check"
										onClick="sendAuthCode()">인증 요청</button>
								</div>
							</div>

							<!-- 인증코드 -->
							<div class="col-md-12 form-group">
								<label for="authCode">인증코드</label> <input type="text"
									id="authCode" name="authCode" class="form-control"
									placeholder="이메일로 받은 인증코드 입력" required />
							</div>

							<!-- 버튼 -->
							<div class="col-md-12 form-group">
								<button type="button" class="btn_3 w-100"
									onclick="submitFindPwForm()">임시 비밀번호 발급</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	//이메일 유효성 검사
	function validateEmail(callback) {
		const email = $('#email').val();

		if (!email) {
			alert('이메일을 입력하세요.');
			callback(false);
			return;
		}

		$.ajax({
			type : 'POST',
			url : '/shop/member/checkEmailExist',
			data : { email : email },
			success : function(res) {
				if (res) {
					callback(true);
				} else {
					alert("해당 이메일로 가입된 회원이 없습니다.")
					callback(false);
				}
			},
			error : function() {
				alert('이메일 검사에 실패했습니다.');
				callback(false);
			}
		});
	}

	// 인증코드 요청 처리 
	function sendAuthCode() {
		showLoading();
		
		validateEmail(function(isValid) {
			if (!isValid){
				hideLoading();				
				return;
			}

			$.ajax({
				type : 'POST',
				url : '/sendAuthEmail',
				data : { email : $('#email').val() },
				success : function(res) {
					if (res.status === 'ok') {
						alert(res.msg);
					} else {
						alert(res.msg);
					}
				},
				error : function(xhr) {
					alert('인증 메일 전송에 실패했습니다.');
				},
				complete : function() {
					hideLoading();
				}
			});
		});
	}

	// 인증번호 유효성 검사
	function validateAuthCode(callback) {
		const authCode = $('#authCode').val();
		
		if (!authCode) {
			alert('인증코드를 입력하세요.');
			callback(false);
			return;
		}

		$.ajax({
			type : 'POST',
			url : '/shop/member/verifyAuthCode',
			data : {
				email : $('#email').val(),
				authCode : authCode
			},
			
			success : function(res) {
				if (res.status === 'ok') {
					callback(true);
				} else {
					alert(res.msg);
					callback(false);
				}
			},
			error : function(xhr) {
				alert('인증번호 유효성 검사에 실패했습니다.');
				callback(false);
			}
		});

	}

	// 임시 비밀번호 요청 처리
	function submitFindPwForm() {
		showLoading();
		
		validateAuthCode(function(isValid) {
			if (!isValid) {
				hideLoading();
				return;
			}

			$.ajax({
				type : 'POST',
				url : '/sendTempPasswordEmail',
				data : { email : $('#email').val() },
				success : function(res) {
					if (res.status === 'ok') {
						alert(res.msg);
						location.href = '/shop/login';
					} else {
						alert(res.msg);
					}
				},
				error : function(xhr) {
					alert('알 수 없는 오류가 발생했습니다.');
				},
				complete : function() {
					hideLoading();
				}
			});
		});
	}
</script>