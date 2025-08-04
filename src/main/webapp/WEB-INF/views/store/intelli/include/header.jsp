<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 최상단 헤더 : intelli 로고, 마이페이지/장바구니/회원이름(로그인), 로그인(비로그인)만 -->
<div class="w-100" style="background:#e6f7f5; border-bottom:1px solid #c1e6df; font-size:15px; height:46px;">
    <div class="container-fluid d-flex justify-content-between align-items-center px-2" style="height:100%; max-width:1196px;">
        <!-- 왼쪽: intelli 로고 -->
        <div class="d-flex align-items-center">
            <a href="${ctx}/shop/main" style="display:block;padding-left:10px;">
                <img src="${ctx}/resources/common/img/logo/logo05.png" alt="intelli" style="height:27px; vertical-align:middle;">
            </a>
        </div>
        <!-- 오른쪽: 상태별 텍스트 메뉴 -->
        <div class="d-flex align-items-center">
            <c:choose>
                <c:when test="${not empty loginMember}">
                    <!-- 마이페이지 -->
                    <a href="${ctx}/shop/mypage"
                       class="text-decoration-none text-dark fw-bold"
                       style="margin-left:20px; margin-right:28px; font-size:1.07em;">
                        마이페이지
                    </a>
                    <!-- 장바구니 -->
                    <a href="${ctx}/shop/cart"
                       class="text-decoration-none text-dark fw-bold"
                       style="margin-right:28px; font-size:1.07em;">
                        장바구니
                        <c:if test="${cartCount != null && cartCount > 0}">
                            <span class="badge rounded-pill bg-danger ms-1" style="font-size:0.8rem;">
                                ${cartCount}
                            </span>
                        </c:if>
                    </a>
                    <!-- 회원이름 -->
                    <span class="text-dark" style="font-weight:500;font-size:1.07em;">
                        ${loginMember.name}님
                    </span>
                </c:when>
                <c:otherwise>
                    <a href="${ctx}/shop/login"
                       class="text-decoration-none text-dark fw-bold"
                       style="margin-left:20px; font-size:1.07em;">
                        로그인
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!-- 스토어 로고/소개 -->
<div class="container" style="max-width: 1196px; background: #fff;">
  <div class="row align-items-center py-4">
    <div class="col-auto">
      <img src="${ctx}${storeInfo.logoPath != null ? storeInfo.logoPath : '/resources/common/img/logo/default.png'}"
           alt="스토어 로고"
           style="width: 108px; height: 108px; border-radius: 18px; border: 2.5px solid #16cab2; background: #fafcfd; object-fit: contain;">
    </div>
    <div class="col">
      <h1 class="fw-bold mb-2" style="color: #21bcaa;">${storeInfo.storeName}</h1>
      <div class="text-secondary mb-1" style="font-size: 1.14rem;">
        ${storeInfo.storeIntroduce != null ? storeInfo.storeIntroduce : '스토어 소개가 없습니다.'}
      </div>
    </div>
  </div>
</div>
 <hr class="category-divider">
<!-- 카테고리 메뉴 -->
<div>
  <div class="container container-categories">
    <ul class="nav nav-pills mb-0 py-2 px-1" style="gap: 9px;">
      <li class="nav-item" style="position: relative;">
        <a href="#" class="nav-link" id="allProducts" data-all="true">전체상품</a>
      </li>
      <c:forEach var="entry" items="${groupedCategories}">
        <li class="nav-item dropdown" style="position: relative;">
          <a href="#" class="nav-link dropdown-toggle" data-topid="${entry.key.topCategoryId}">${entry.key.categoryName}</a>
          <ul class="dropdown-menu">
            <c:forEach var="subCat" items="${entry.value}">
              <li>
                <a class="dropdown-item" href="#" data-subid="${subCat.subCategoryId}">${subCat.categoryName}</a>
              </li>
            </c:forEach>
          </ul>
        </li>
      </c:forEach>
    </ul>
  </div>
  <hr class="category-divider">
</div>


