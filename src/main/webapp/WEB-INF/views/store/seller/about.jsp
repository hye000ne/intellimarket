<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<link rel="stylesheet" href="${ctx}/resources/store/assets/css/about.css">
<div class="slider-area">
    <div class="single-slider slider-height2 d-flex align-items-center" data-background="${ctx}/resources/shop/assets/img/hero/contact_hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center">
                           <h2 class="login-h2" style="color:white !important;">Intelli Market</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="hero">
    <div class="hero-text">
        <h1>판매를 시작하는 가장 똑똑한 방법</h1>
        <p>Intelli Market은 간단하지만 강력한 스토어 관리, 편리한 상품 등록/판매가 가능합니다.<br> 또한, 빠른 정산 시스템과 낮은 수수료를 통해 안정적인 비즈니스 운영을 지원합니다!</p>
        <a href="${ctx}/store/seller/join"><h2 class="h2-hero">판매자 등록</h2></a>
        </div>
</section>

<!-- ---------- 3-Step Guide ---------- -->
<section class="steps">
    <div class="card">
        <i class="fa-solid fa-user-plus"></i>
        <h3>STEP 1<br>판매자 가입</h3>
        <p>사업자 정보와 기본 프로필만 입력하면<br>관리자 승인 후 계정과, 스토어가 생성됩니다.</p>
    </div>
    <div class="card">
        <i class="fa-solid fa-user-plus"></i>
        <h3>STEP 2<br>상품 등록</h3>
        <p>맞춤형 카테고리, 레이아웃 설정 후 상품을 등록하고<br>인텔리하게 판매를 시작하세요.</p>
    </div>
    <div class="card">
        <i class="fa-solid fa-user-plus"></i>
        <h3>STEP 3<br>매출 관리</h3>
        <p>주문·정산을 실시간으로 확인하며<br>매출 성장을 체감해 보세요.</p>
    </div>
</section>

<!-- ---------- FAQ ---------- -->
<section class="faq">
    <h2>자주 묻는 질문</h2>

    <details>
        <summary>판매자 가입 조건이 있나요?</summary>
        <p>개인·법인 사업자 모두 가입 가능하며, 사업자등록증과 통장사본을 준비해주세요.</p>
    </details>

    <details>
        <summary>수수료는 어떻게 책정되나요?</summary>
        <p>카테고리별 3% 수준의 합리적인 판매 수수료가 적용됩니다. 상세 정책은 설정 &gt; 수수료 안내에서 확인 가능합니다.</p>
    </details>

    <details>
        <summary>정산 주기는 어떻게 되나요?</summary>
        <p>결제 완료일 기준 주 1회(매주 수요일) 자동 정산됩니다.</p>
    </details>
</section>

