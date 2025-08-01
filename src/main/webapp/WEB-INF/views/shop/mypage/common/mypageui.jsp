<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        /* 마이페이지 전용 레이아웃 */
        .mypage-wrapper {
            display: flex;
            min-height: 100vh;
            background-color: #f9f9f9;
        }

        .sidebar {
            width: 250px;
            background-color: #fff;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            padding-top: 30px;
            flex-shrink: 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .menu-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .menu-list li {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .menu-list li:hover {
            background-color: #f0f0f0;
        }

        .content-area {
            flex: 1;
            padding: 50px;
        }
    </style>
</head>
<body>
    <!-- 마이페이지 전용 wrapper 시작 -->
    <div class="mypage-wrapper">
        <div class="sidebar">
            <h2>마이페이지</h2>
            <ul class="menu-list">
                <li onclick="location.href='/shop/mypage/myorders'" 		style="<c:if test='${selectedMenu eq "orders"}'>background-color: #E0F5F5; color: navy;</c:if>">🧾 주문 확인</li>
                <li onclick="location.href='/shop/mypage/shipping'" 		style="<c:if test='${selectedMenu eq "shipping"}'>background-color: #E0F5F5; color: navy;</c:if>">🚚 배송 확인</li>
                <li onclick="location.href='/shop/mypage/inquiries'" 		style="<c:if test='${selectedMenu eq "inquiries"}'>background-color: #E0F5F5; color: navy;</c:if>">❓ 상품 문의 확인</li>
                <li onclick="location.href='/shop/mypage/editprofile'" 		style="<c:if test='${selectedMenu eq "editProfile"}'>background-color: #E0F5F5; color: navy;</c:if>">👤 회원정보 수정</li>
                <li onclick="location.href='/shop/mypage/reviews'" 			style="<c:if test='${selectedMenu eq "reviews"}'>background-color: #E0F5F5; color: navy;</c:if>">⭐ 리뷰 조회</li>
                <li onclick="location.href='/shop/mypage/coupon'" 			style="<c:if test='${selectedMenu eq "coupon"}'>background-color: #E0F5F5; color: navy;</c:if>">🎁 쿠폰 및 적립금 확인</li>
                <li onclick="location.href='/shop/mypage/notifications'" 	style="<c:if test='${selectedMenu eq "notifications"}'>background-color: #E0F5F5; color: navy;</c:if>">🔔 알림함</li>
            </ul>
        </div>
		
        <div class="content-area">

