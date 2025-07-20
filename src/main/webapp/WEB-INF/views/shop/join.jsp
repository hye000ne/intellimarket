<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<section class="login_part">
    <div class="container">
        <div class="row justify-content-center">
        	<!-- 회원가입 폼 -->
			<div class="col-lg-8 col-md-10">
				<div class="login_part_form">
                    <div class="login_part_form_iner">
						<form class="row contact_form" action="${ctx}/member/join" method="post" novalidate="novalidate">
							<!-- 이메일 (아이디) -->
							<div class="col-md-12 form-group">
							  	<label for="email">이메일 (아이디)</label>
							  	<div class="email-check-group">
							    	<input type="email" id="email" name="email" class="form-control" required />
							    	<button type="button" class="btn-check">중복확인</button>
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
			
			              	<!-- 성별 -->
						    <div class="col-md-12 form-group">
						      	<label>성별</label><br />
						      	<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="gender" id="genderM" value="M" />
						        	<label class="form-check-label" for="genderM">남자</label>
						      	</div>
						      	<div class="form-check form-check-inline">
						        	<input class="form-check-input" type="radio" name="gender" id="genderF" value="F" />
						        	<label class="form-check-label" for="genderF">여자</label>
					     		</div>
						    </div>
			
			              	<!-- 휴대폰 -->
						    <div class="col-md-12 form-group">
						      	<label for="phone">휴대폰 번호 (숫자만 입력)</label>
						      	<input type="text" id="phone" name="phone" class="form-control" required />
						    </div>
						
						    <!-- 주소 -->
						    <div class="col-md-12 form-group">
						      	<label for="address">주소</label>
						      	<input type="text" id="address" name="address" class="form-control" required />
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
						      	<button type="submit" class="btn_3 w-100">회원가입</button>
						    </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
