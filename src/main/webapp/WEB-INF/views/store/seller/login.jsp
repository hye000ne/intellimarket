<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>

        	<!-- 신규 판매자 안내 -->
            <div class="col-lg-6 col-md-6">
                <div class="login_part_text text-center">
                    <div class="login_part_text_iner">
                        <h2>아직 인텔리마켓 판매자가 아니신가요?</h2>
                        <p>지금 판매자 등록하고 인텔리 마켓의 똑똑한 쇼핑을 시작하세요.</p>
                        <a href="${ctx}/store/seller/join" class="btn_3">판매자 등록</a>
                    </div>
                </div>
            </div>
            <!-- 로그인 폼 -->
            <div class="col-lg-6 col-md-6">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <h3>
                            반갑습니다!
                            <br />
                            로그인 해주세요
                        </h3>
                        <form class="row contact_form" id="loginForm">
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="email" name="email" value="${email}" placeholder="이메일" />
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" id="password" name="password" value="" placeholder="비밀번호" />
                            </div>
                            <div class="col-md-12 form-group">
                                <div class="creat_account d-flex align-items-center">
                                   	<input type="checkbox" id="rememberEmail" name="rememberEmail" 
                                   		<c:if test="${ not empty email }">checked</c:if>
                                   	 />
                                    <label for="rememberEmail">이메일 저장</label>
                                </div>
                                <button type="button" class="btn_3" onclick="submitLoginForm()">로그인</button>
                                <a class="lost_pass" href="${ctx}/shop/findPw">비밀번호 찾기</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

<script>
	function submitLoginForm() {
		if (!validateLoginForm()) return;

		$.ajax({
			type: 'POST',
			url: '/store/seller/login',
			data: $('#loginForm').serialize(),
			success: function(res){
				if(res.status === 'ok') {
					alert(res.msg);
					location.href = res.url;
				} else {
					alert(res.msg);
				}
			}
		});
	}
	
	function validateLoginForm() {
		if(!$('#email').val()) {
			alert('이메일을 입력하세요.');
			return false;
		}
		
		if(!$('#password').val()) {
			alert('비밀번호를 입력하세요.');
			return false;
		}
		
		return true;
	}
</script>