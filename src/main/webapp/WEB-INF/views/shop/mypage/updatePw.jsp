<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<c:set var="selectedMenu" value="updatePw" />
<%@ include file="/WEB-INF/views/shop/mypage/common/mypageui.jsp" %>
<section class="login_part">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="login_part_form">
                    <div class="login_part_form_iner">
                        <form id="pwForm">
                            <!-- 1단계: 현재 비밀번호 확인 -->
                            <div class="col-md-12 form-group">
                                <label for="currentPassword">현재 비밀번호</label>
                                <div class="email-check-group">
	                                <input type="password" id="currentPassword" class="form-control" required />
	                                <button type="button" class="btn-check mt-2" onclick="checkCurrentPassword()">확인</button>
							  	</div>
                            </div>
                            
                            <!-- 2단계: 새 비밀번호 입력 -->
                            <div id="newPasswordArea" style="display:none;" class="col-md-12 form-group mt-4">
                                <label for="newPassword">새 비밀번호 (영문, 숫자, 특수문자 8~16자)</label>
                                <input type="password" id="newPassword" class="form-control mb-3" placeholder="새 비밀번호 입력" />

                                <label for="newPasswordConfirm">새 비밀번호 확인</label>
                                <input type="password" id="newPasswordConfirm" class="form-control" placeholder="새 비밀번호 다시 입력" />

                                <button type="button" class="btn_3 w-100 mt-4" onclick="updatePassword()">비밀번호 변경</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
	// 1단계 : 현재 비밀번호 확인 Ajax
	function checkCurrentPassword() {
		const pw = $('#currentPassword').val();
		if(!pw) {
			alert('현재 비밀번호를 입력하세요.');
			return;
		}
	
		$.ajax({
			type: 'POST',
			url: '/shop/member/checkPassword',
			data: {password : pw},
			success: function(res) {
				if (res.status === 'ok') {
					$("#newPasswordArea").show();
				} else {
					alert(res.msg);
				}
			}
		});
	}
	
	// 2단계 : 비밀번호 변경 요청 Ajax
	function updatePassword() {
		const newPw = $('#newPassword').val();
		const newPwConfirm = $('#newPasswordConfirm').val();
		
		if (!newPw || !newPwConfirm) {
		  	alert('새 비밀번호를 입력하세요.');
		 	return;
		}		
		
		if (newPw !== newPwConfirm) {
		  	alert('비밀번호가 일치하지 않습니다.');
		  	return;
		}
		
		const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=\-{}\[\]:;"'<>,.?/~`|\\]).{8,16}$/;
		if (!pwReg.test(pw)) {
			alert('비밀번호는 영문, 숫자, 특수문자를 포함해 8~16자로 입력하세요.');
		  	return;
		}
		
		$.ajax({
			type: 'POST',
			url: '/shop/member/updateMemberPassword',
			data: {password : newPw},
			success: function(res) {
				if (res.status === 'ok') {
					alert(res.msg);
					location.href = '/shop/mypage';
				} else {
					alert(res.msg);
				}
			}
		});
	}
</script>
