<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!-- 상단 배너 -->
<div class="slider-area">
	<div class="single-slider slider-height2 d-flex align-items-center" data-background="${ctx}/resources/shop/assets/img/hero/category.jpg">
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
                                    <input type="email" id="email" name="email" class="form-control" placeholder="가입 시 등록한 이메일을 입력하세요." required />
                                    <button type="button" class="btn-check" id="btnSendCode" onClick="sendAuthCode()">인증 요청</button>
                                </div>
                            </div>

                            <!-- 인증코드 -->
                            <div class="col-md-12 form-group">
                                <label for="authCode">인증코드</label>
                                <input type="text" id="authCode" name="authCode" class="form-control" placeholder="이메일로 받은 인증코드 입력" required />
                            </div>

                            <!-- 버튼 -->
                            <div class="col-md-12 form-group">
                                <button type="button" class="btn_3 w-100" onclick="submitFindPwForm()">임시 비밀번호 발급</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
	// 인증코드 요청 처리 
	function sendAuthCode() {
		const email = $('#email').val(); 
		if(!email) {
			alert('이메일을 입력하세요.');
			return;
		}
		
		$.ajax({
			type: 'POST',
			url: '/sendAuthEmail',
			data : {"email" : email},
			success : function(res) {
				if(res.status === 'ok') alert(res.msg);
			},
			error : function(xhr) {
				alert(xhr.responseText);
			}
		});
	}
</script>