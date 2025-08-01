<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %> <!-- 절대 침범 금지 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .cart-container {
            max-width: 960px;
            margin: 60px auto;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 40px;
            color: #333;
        }

        .product-card {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding: 20px 0;
        }

        .product-thumbnail img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
        }

        .product-details {
            margin-left: 20px;
            flex: 1;
        }

        .product-title {
            font-size: 18px;
            font-weight: bold;
            color: #222;
            margin-bottom: 6px;
        }

        .product-quantity {
            font-size: 14px;
            color: #666;
            margin-bottom: 4px;
        }

        .product-price {
            font-size: 16px;
            color: #4CAF50;
        }

        .cart-summary {
            text-align: right;
            margin-top: 30px;
        }

        .cart-summary h3 {
            font-size: 20px;
            color: #333;
        }

        .checkout-btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .checkout-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="cart-container">
    <h2>🛒 내 장바구니</h2>

    <div class="product-card">
        <div class="product-thumbnail">
            <img src="https://via.placeholder.com/80" alt="상품 이미지" />
        </div>
        <div class="product-details">
            <div class="product-title">예시 상품 A</div>
            <div class="product-quantity">2 개</div>
            <div class="product-price">₩25,000</div>
        </div>
    </div>

    <div class="product-card">
        <div class="product-thumbnail">
            <img src="https://via.placeholder.com/80" alt="상품 이미지" />
        </div>
        <div class="product-details">
            <div class="product-title">예시 상품 B</div>
            <div class="product-quantity">1 개</div>
            <div class="product-price">₩15,000</div>
        </div>
    </div>

    <div class="cart-summary">
        <h3>총 금액: ₩40,000</h3>
        <button class="checkout-btn" onclick="alert('결제 페이지로 이동합니다!')">결제하기</button>
    </div>
</div>
</body>
</html>
