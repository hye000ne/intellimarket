<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%
  String memberId = (String) request.getAttribute("memberId");
  String address = (String) request.getAttribute("address");
  int totalPrice = request.getAttribute("totalPrice") != null
      ? (Integer) request.getAttribute("totalPrice")
      : 0;

  // 천 단위 쉼표 포맷
  java.text.NumberFormat formatter = java.text.NumberFormat.getInstance();
  String formattedPrice = formatter.format(totalPrice);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>

<style>
  .success-container {
    max-width: 600px;
    margin: 50px auto;
    padding: 30px;
    background-color: #fffaf0;
    border-radius: 15px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    font-family: 'Noto Sans KR', sans-serif;
    text-align: center;
  }

  .success-title {
    font-size: 28px;
    font-weight: bold;
    color: #ff6f61;
    margin-bottom: 20px;
  }

  .success-icon {
    font-size: 50px;
    color: #ff6f61;
    margin-bottom: 10px;
  }

  .success-info {
    font-size: 16px;
    color: #333;
    margin: 10px 0;
  }

  .success-buttons {
    margin-top: 30px;
    display: flex;
    justify-content: center;
    gap: 20px;
  }

  .success-buttons a {
    padding: 12px 24px;
    background-color: #ff6f61;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    transition: background-color 0.3s ease;
  }

  .success-buttons a:hover {
    background-color: #e65c50;
  }
</style>
</head>
<body>
    <!-- 상단 배너 -->
    <div class="slider-area">
        <div class="single-slider slider-height2 d-flex align-items-center"
            data-background="<%= request.getContextPath() %>/resources/shop/assets/img/hero/category.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>결제 완료</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="success-container">
      <div class="success-icon">🎉</div>
      <div class="success-title">결제가 완료되었습니다!</div>
    
      <div class="success-info"><strong>구매자 ID:</strong> <%= memberId %></div>
      <div class="success-info"><strong>배송 주소:</strong> <%= address %></div>
      <div class="success-info">
        <strong>결제 금액:</strong> 
        <span style="color:#ff6f61;">₩ <%= formattedPrice %></span>
      </div>
    
      <div class="success-buttons">
        <a href="<%= request.getContextPath() %>/shop/mypage/myorders">🧾 주문내역으로 이동</a>
        <a href="<%= request.getContextPath() %>/shop/main">🛍️ 쇼핑 계속하기</a>
      </div>
    </div>
</body>
</html>
