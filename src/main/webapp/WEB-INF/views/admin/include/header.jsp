<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
	<img class="animation__shake" src="${ctx}/resources/admin/assets/img/AdminLTELogo.png" height="60" width="60">
</div>

<!-- Header -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a></li>
	</ul>

	<ul class="navbar-nav ml-auto">
		<!-- 로그아웃 버튼 -->
		<li class="nav-item">
			<a href="${ctx}/shop/member/logout" class="nav-link">
				<i class="fas fa-sign-out-alt"></i> 로그아웃
			</a>
		</li>
	</ul>
</nav>