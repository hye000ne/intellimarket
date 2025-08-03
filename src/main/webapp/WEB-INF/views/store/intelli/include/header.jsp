<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 최상단 헤더 : intelli 로고, 마이페이지/장바구니/회원이름(로그인), 로그인(비로그인)만 -->
<div class="w-100" style="background:#e6f7f5; border-bottom:1px solid #c1e6df; font-size:15px; height:46px;">
    <div class="container-fluid d-flex justify-content-between align-items-center px-2" style="height:100%; max-width:1196px;">
        <!-- 왼쪽: intelli 로고 -->
        <div class="d-flex align-items-center">
            <a href="${ctx}/shop/main" style="display:block;padding-left:10px;">
                <img src="${ctx}/resources/common/img/logo/intelli_logo.png" alt="intelli" style="height:27px; vertical-align:middle;">
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

