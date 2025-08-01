<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!-- loading animation -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="${ctx}/resources/common/img/logo/logo03.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Header -->
<header>
	<div class="header-area">
		<div class="main-header">
			<div class="header-top top-bg d-none d-lg-block">
              	<div class="container-fluid">
                  	<div class="col-xl-12">
						<div class="row d-flex justify-content-between align-items-center">
							<div class="header-info-left d-flex">
                              	<c:if test="${not empty sessionScope.loginMember}">
                              		<span>${sessionScope.loginMember.name}님, 환영합니다!</span>
								</c:if>							
							</div>
                           	<div class="header-info-right">
	                           	<ul>
	                              	<c:if test="${not empty sessionScope.loginMember}">
										<li><a href="${ctx}/shop/member/logout">로그아웃</a></li>
										<li><a href="${ctx}/shop/mypage">마이페이지</a></li>
									</c:if>
									<c:if test="${empty sessionScope.loginMember}">
										<li><a href="${ctx}/shop/login">로그인</a></li>
										<li><a href="${ctx}/shop/join">회원가입</a></li>
									</c:if>
	                           	</ul>
                           	</div>
                       	</div>
                  	</div>
              	</div>
           	</div>
			<div class="header-bottom  header-sticky">
				<div class="container-fluid">
                   	<div class="row align-items-center">
                       	<!-- 로고 -->
                       	<div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
                           	<div class="logo">
                             	<a href="${ctx}/shop/main"><img src="${ctx}/resources/common/img/logo/logo04.png" alt=""></a>
                           	</div>
                       	</div>
                       	<div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
							<!-- 메인 메뉴 -->
                           	<div class="main-menu f-right d-none d-lg-block">
								<nav>                                                
                                   	<ul id="navigation">                                                                                                                                     
                                       	<li><a href="${ctx}/shop/main">Home</a></li>
                                   		<li class="hot"><a href="#">베스트</a>
                                       	<li><a href="#">세일</a></li>
                                       	<li><a href="#">쿠폰</a>
                                       	<li><a href="#">고객센터</a></li>
                                   	</ul>
                               	</nav>
                           	</div>
                       	</div> 
                       	<div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
                           	<ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
                           		<!-- 검색 -->
                               	<li class="d-none d-xl-block">
                                   	<div class="form-box f-right">
                                       	<input type="text" name="Search" placeholder="Search products">
                                       	<div class="search-icon">
                                           	<i class="fas fa-search special-tag"></i>
                                       	</div>
                                   	</div>
                                </li>
                                <!-- 마이 페이지 -->
								<li>
									<div class="favorit-items">
                                       		<a href="${ctx}/shop/mypage"><i class="far fa-user"></i></a>
									</div>
								</li>
                               	<!-- 장바구니 -->
                               	<li>
                                   	<div class="shopping-card">
                                       		<a href="${ctx}/shop/cart"><i class="fas fa-shopping-cart"></i><span class="cart-count">3</span></a>
                                   	</div>
                               	</li>
                           	</ul>
                       	</div>
                       	<!-- Mobile Menu -->
                       	<div class="col-12">
                           	<div class="mobile_menu d-block d-lg-none"></div>
                       	</div>
                   	</div>
               	</div>
          	</div>
       	</div>
  	</div>
</header>