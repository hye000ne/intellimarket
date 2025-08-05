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
		<li class="nav-item d-none d-sm-inline-block"><a href="${ctx}/store/seller/manage/settlement/summery" class="nav-link">Home</a></li>
		<li class="nav-item d-none d-sm-inline-block"><a href="${ctx}/shop/customerservice" class="nav-link">Contact</a></li>
	</ul>

	<ul class="navbar-nav ml-auto">
		<li class="nav-item">
			<a class="nav-link" data-widget="navbar-search" href="#" role="button"><i class="fas fa-search"></i></a>
			<div class="navbar-search-block">
				<form class="form-inline">
					<!-- 검색 -->
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit"><i class="fas fa-search"></i></button>
							<button class="btn btn-navbar" type="button" data-widget="navbar-search"><i class="fas fa-times"></i></button>
						</div>
					</div>
				</form>
			</div>
		</li>
	</ul>
</nav>