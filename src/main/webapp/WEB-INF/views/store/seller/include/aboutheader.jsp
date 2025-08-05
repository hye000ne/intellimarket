<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

<!-- Header -->
<header>
	<div class="header-area">
		<div class="main-header">
			<div class="header-top top-bg d-none d-lg-block">
				<div class="container-fluid">
					<div class="col-xl-12">
						<div class="d-flex align-items-center">
							<a href="${ctx}/store/seller" style="display: block; padding-left: 10px;">
								<img src="${ctx}/resources/common/img/logo/logo05.png" alt="intelli" style="height: 27px; vertical-align: middle;">
							</a>
						</div>
						<div class="row d-flex justify-content-between align-items-center">
							<div class="header-info-left d-flex">
								<c:if test="${not empty sessionScope.loginSeller}">
									<span>${sessionScope.loginSeller.name} 판매자님, 환영합니다!</span>
								</c:if>
							</div>
							<div class="header-info-right">
								<ul>
									<c:if test="${not empty sessionScope.loginSeller}">
										<li>
											<a href="${ctx}/store/seller/logout">로그아웃</a>
										</li>
										<li>
											<a href="${ctx}/store/seller/manage/">스토어 관리</a>
										</li>
									</c:if>
									<c:if test="${empty sessionScope.loginSeller}">
										<li>
											<a href="${ctx}/store/seller/login">로그인</a>
										</li>
										<li>
											<a href="${ctx}/store/seller/join">판매자 등록</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>