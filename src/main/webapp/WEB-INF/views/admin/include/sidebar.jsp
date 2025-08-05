<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<!-- Sidebar -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Logo -->
    <a href="${ctx}/admin/main" class="brand-link">
      	<img src="${ctx}/resources/common/img/logo/logo08.png" class="brand-image img-circle elevation-3" style="height: 35px;">
      	<span class="brand-text font-weight-light">Intelli Market</span>
    </a>

	<!-- sidebar -->	
    <div class="sidebar">
		<!-- 프로필 -->
      	<div class="user-panel mt-3 pb-3 mb-3 d-flex">
        	<div class="image"><img src="${ctx}/resources/admin/assets/img/user2-160x160.jpg" class="img-circle elevation-2"></div>
        	<div class="info"><a href="#" class="d-block">운영자</a></div>
      	</div>

      	<!-- 사이드바 메뉴 -->
      	<nav class="mt-2">
        	<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          		<!-- 회원 관리 -->
			  	<li class="nav-item has-treeview ${menuGroup eq 'member' ? 'menu-open' : ''}">
					<a href="#" class="nav-link ${menuGroup eq 'member' ? 'active' : ''}">
						<i class="nav-icon fas fa-user"></i>
						<p>회원 관리<i class="right fas fa-angle-left"></i></p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="${ctx}/admin/member/list" class="nav-link ${subMenu eq 'memberList' ? 'active' : ''}">
								<p>회원 목록</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="${ctx}/admin/member/join" class="nav-link ${subMenu eq 'join' ? 'active' : ''}">
								<p>회원 등록</p>
							</a>
						</li>
					</ul>
				</li>

				
				<!-- 판매자 관리 -->
                <li class="nav-item has-treeview ${menuGroup eq 'seller' ? 'menu-open' : ''}">
                    <a href="#" class="nav-link ${menuGroup eq 'seller' ? 'active' : ''}">
                        <i class="nav-icon fas fa-users-cog"></i>
                        <p>판매자 관리<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                        	<a href="${ctx}/admin/seller/approval" class="nav-link ${subMenu eq 'approval' ? 'active' : ''}">
                        		<p>가입 승인</p>
                       		</a>
                       	</li>
                        <li class="nav-item">
                        	<a href="${ctx}/admin/seller/list" class="nav-link ${subMenu eq 'sellerList' ? 'active' : ''}">
                        		<p>판매자 목록</p>
                        	</a>
                        	
                       	</li>
                    </ul>
                </li>
				
				<!-- 스토어 관리 -->
                <li class="nav-item has-treeview ${menuGroup eq 'store' ? 'menu-open' : ''}">
                    <a href="#" class="nav-link ${menuGroup eq 'store' ? 'menu-open' : ''}">
                        <i class="nav-icon fas fa-store"></i>
                        <p>스토어 관리<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                        	<a href="${ctx}/admin/store/list" class="nav-link ${subMenu eq 'storeList' ? 'active' : ''}">
                        		<p>스토어 목록</p>
                        	</a>
                       	</li>
	                    <li class="nav-item">
	                    	<a href="${ctx}/admin/store/settlement" class="nav-link ${subMenu eq 'storeSettlement' ? 'active' : ''}">
	                    		<p>정산 관리</p>
                    		</a>
                   		</li>
                    </ul>
                </li>
				
				<!-- 마켓 관리 -->
                <li class="nav-item has-treeview ${menuGroup eq 'market' ? 'menu-open' : ''}">
                    <a href="#" class="nav-link ${menuGroup eq 'market' ? 'menu-open' : ''}">
                        <i class="nav-icon fas fa-chart-line"></i>
                        <p>마켓 관리<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                        	<a href="${ctx}/admin/market/banner/list" class="nav-link ${subMenu eq 'banner' ? 'active' : ''}">
                        		<p>배너 관리</p>
                        	</a>
                       	</li>
                        <li class="nav-item">
                        	<a href="${ctx}/admin/market/logo/list" class="nav-link ${subMenu eq 'logo' ? 'active' : ''}">
                        		<p>로고 관리</p>
                       		</a>
                   		</li>
                    </ul>
                </li>
                
				<!-- 공지사항 -->
                <li class="nav-item has-treeview ${menuGroup eq 'notice' ? 'menu-open' : ''}">
                    <a href="${ctx}/admin/notice" class="nav-link ${menuGroup eq 'notice' ? 'menu-open' : ''}">
                        <i class="nav-icon fas fa-bullhorn"></i>
                        <p>시스템 공지<i class="right fas fa-angle-left"></i></p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                        	<a href="${ctx}/admin/notice/list" class="nav-link ${subMenu eq 'noticeList' ? 'active' : ''}">
                        		<p>공지 관리</p>
                       		</a>
                   		</li>
                    </ul>
                </li>
			</ul>
		</nav>
	</div>
</aside>