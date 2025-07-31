<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

<!-- Sidebar -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Logo -->
  <a href="${ctx}/admin/main" class="brand-link">
    <img src="${ctx}/resources/common/img/logo/logo08.png" class="brand-image img-circle elevation-3" style="height: 35px;">
    <span class="brand-text font-weight-light">Intelli Seller</span>
  </a>

  <!-- sidebar -->
  <div class="sidebar">
    <!-- 프로필 -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        <img src="${ctx}/resources/admin/assets/img/user2-160x160.jpg" class="img-circle elevation-2">
      </div>
      <div class="info">
        <a href="#" class="d-block">
          <c:if test="${not empty sessionScope.loginSeller}">
            <span>${sessionScope.loginSeller.name} 판매자</span>
          </c:if>
        </a>
      </div>
    </div>

    <!-- 사이드바 메뉴 -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

        <!-- 상품 관리 -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-box"></i>
            <p>
              상품 관리
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="${ctx}/store/seller/manage/product/list" class="nav-link">
                <p>상품 목록</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="${ctx}/store/seller/manage/product/registForm" class="nav-link">
                <p>상품 등록</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- 주문 관리 -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-shopping-cart"></i>
            <p>
              주문 관리
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>주문 목록</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>취소/교환/환불</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- 리뷰 및 문의 관리 -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-comments"></i>
            <p>
              리뷰&문의 관리
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>리뷰 관리</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>문의 관리</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- 스토어 관리 -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-store"></i>
            <p>
              스토어 관리
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="/store/seller/manage/editstore" class="nav-link">
                <p>스토어 정보 관리</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>카테고리 관리</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- 이벤트 관리 -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-gift"></i>
            <p>
              이벤트 관리
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>할인&배송비 관리</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>이벤트배너 관리</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- 정산 관리 -->
        <li class="nav-item has-treeview">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-coins"></i>
            <p>
              정산 관리
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="#" class="nav-link">
                <p>정산정보 관리</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- 공지사항 -->
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-bullhorn"></i>
            <p>시스템 공지</p>
          </a>
        </li>

      </ul>
    </nav>
  </div>
</aside>
