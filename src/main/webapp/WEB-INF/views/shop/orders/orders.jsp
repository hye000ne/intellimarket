<%@page import="com.intellimarket.shop.domain.Member"%>
<%@page import="com.intellimarket.store.domain.Product"%>
<%@page import="com.intellimarket.shop.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	List<?> list = (List<?>)request.getAttribute("list");

	Member member = (Member)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제하기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<style>
.product-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.product-card {
  border: 1px solid #ddd;
  border-radius: 12px;
  padding: 12px;
  width: 100%;
  box-sizing: border-box;
  transition: box-shadow 0.2s ease;
}

.product-card:hover {
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
}

.product-wrapper {
  display: flex;
  align-items: center;
  gap: 16px;
  flex-wrap: wrap; /* 너비 줄어들면 줄바꿈 허용 */
}

.product-thumbnail {
  width: 80px;
  min-width: 80px;
  flex-shrink: 0;
  display: flex;
  align-items: center;
}

.product-thumbnail img {
  width: 100%;
  height: auto;
  display: block;
}

.product-details {
  flex: 1;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  min-width: 0;
  height: 60px;
  overflow: hidden;
}

.product-title,
.product-quantity,
.product-price {
  display: flex;
  align-items: center;
  justify-content: center;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  height: 100%;
}

.product-title {
  flex: 2 1 0;
  min-width: 120px;
  max-width: 60%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  direction: ltr;
}

.product-quantity,
.product-price {
  flex: 1 1 0;
  min-width: 60px;
}

.product-quantity {
  font-size: 15px;
  color: black;
  font-weight: bold;
}

.product-price {
  font-size: 15px;
  color: #0072c6;
  font-weight: bold;
}

.buyer-info input {
	width: 100%;
	padding: 8px;
	margin-bottom: 12px;
}

.summary-box {
	margin-bottom: 20px;
	padding: 14px;
	border: 1px solid #e0e0e0;
	border-radius: 8px;
	background-color: #fefefe;
	font-size: 15px;
	color: #333;
}

.summary-box strong {
	display: inline-block;
	width: 140px;
}

.red-text {
	color: #d10000;
	font-weight: bold;
}

.blue-text {
	color: #0072c6;
}

.final-text {
	font-size: 40px;
	font-weight: bold;
	color: #333;
}
</style>
<script>
  /* 집 주소 API */
  function findHouseCode() {
    new daum.Postcode({
      oncomplete: function (data) {
        const addr =
          data.userSelectedType === "R"
            ? data.roadAddress
            : data.jibunAddress;
        $("#buyer_postcode").val(data.zonecode);
        $("#buyer_address").val(addr);
        $("#buyer_address_detail").focus(); // 💡 여긴 .focus → .focus() 로 꼭 수정해줘!
      },
    }).open();
  }

  /* 결제 금액 계산 */
  function calculatePrice() {
    let productPrice = 0;

    $(".product-card").each(function () {
      const price	   = parseInt( $(this).find(".product-price").text().replace("₩", "").replace(/,/g, ""));
      const quantity = parseInt( $(this).find(".product-quantity").text());
      productPrice += price * quantity;
    });

    
    const shipping = productPrice >= 100000 ? 0 : 2500;
    const discount = shipping == 0? 2500 : 0;
    const total = productPrice - discount + shipping;

    $("#selectedAmount").text("₩ " + productPrice.toLocaleString());
    $("#discountAmount").text("₩ -" + discount.toLocaleString());
    $("#shippingFee").text("₩ " + shipping.toLocaleString());
    $("#finalAmount").text("₩ " + total.toLocaleString());
  }

  /* 결제 요청 */
  function requestPay() {
    let selectedItems = [];
    let totalAmount = parseInt(
      $("#finalAmount").text().replace("₩", "").replace(/,/g, "")
    );

    $(".product-card").each(function () {
      const name = $(this).find(".product-title").text().trim();
      selectedItems.push(name);
    });

    if (selectedItems.length === 0) {
      alert("결제할 상품을 선택해주세요.");
      return;
    }

    const itemSummary = selectedItems.join(", ");
    const buyerEmail = $("#buyer_email").val();
    const buyerName = $("#buyer_name").val();
    const buyerTel = $("#buyer_tel").val();
    const buyerPostcode = $("#buyer_postcode").val();
    const buyerAddr = $("#buyer_address").val();
    const buyerAddrAnd = $("#buyer_address_detail").val().trim();

    // 값 체크
    if (!buyerName) {
      alert("이름을 입력하세요.");
      return;
    }
    if (!buyerEmail) {
      alert("이메일을 입력하세요.");
      return;
    }
    if (!buyerTel) {
      alert("전화번호를 입력하세요.");
      return;
    }
    if (!buyerAddr) {
      alert("주소를 입력하세요.");
      return;
    }
    if (!buyerAddrAnd) {
      alert("상세 주소를 입력하세요.");
      return;
    }

    // showLoading(); ← 원래 함수가 있다면 주석 해제해도 좋아

    const IMP = window.IMP;
    IMP.init("imp61000270");

    IMP.request_pay(
      {
        channelKey: "channel-key-8ddc4b6b-44a7-4f92-9205-3b9a452a0cd3",
        pay_method: "card",
        merchant_uid: "payment-" + new Date().getTime(),
        name: itemSummary,
        amount: totalAmount,
        buyer_email: buyerEmail,
        buyer_name: buyerName,
        buyer_tel: buyerTel,
        buyer_addr: buyerAddr + " " + buyerAddrAnd,
        buyer_postcode: buyerPostcode,
        display: {
          card_quota: [0, 2, 3, 4, 5, 6],
        },
        // hideLoading(); ← 필요 시 사용
      },
      function (rsp) {
        if (rsp.success) {
          const result = {
            merchant_uid: rsp.merchant_uid,
            name: rsp.name,
          };

          $.ajax({
            url: "/shop/orders/complete",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(result),
            success: function (res) {
              location.href = res;
            },
            error: function (err) {
              console.log(err);
            },
          });
        } else {
          alert("❌ 결제 실패\n에러내용 : " + rsp.error_msg);
        }
      }
    );
  }

  /* 체크박스 확인 */
  function confirmCheckBox() {
	    if ($("#agree").is(":checked")) {
	      	$("#buyer_name").val("<%=member.getName()%>");
	      	$("#buyer_email").val("<%=member.getEmail()%>");
	      	$("#buyer_tel").val("<%=member.getPhone()%>");
	      	$("#buyer_postcode").val("<%=member.getZipCode()%>");
	      	$("#buyer_address").val("<%=member.getAddress()%>");
	      	$("#buyer_address_detail").val("<%=member.getDetailAddress()%>");
	    }else{
	    	$("#buyer_name").val("");
	        $("#buyer_email").val("");
	        $("#buyer_tel").val("");
	        $("#buyer_postcode").val("");
	        $("#buyer_address").val("");
	        $("#buyer_address_detail").val("");
	    }
  }
  
  /* 상품명 길이 검사 */
  function checkProductNameLength(){
	  $(".product-card").each(function () {
		    const $productTitle = $(this).find(".product-title");
		    const title = $productTitle.text();   

		    if (title.length > 20) {
		      const productName = title.substring(0, 20) + "...";
		      $productTitle.text(productName);                      
		    }
		  });
  } 

  /* 🚀 초기 실행 */
  $(() => {
	checkProductNameLength();
    confirmCheckBox();
    calculatePrice();
    
  });
</script>


</head>

<body>
	<!-- 상단 배너 -->
	<div class="slider-area">
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="${ctx}/resources/shop/assets/img/hero/category.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>결제</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="login_part section_padding">
		<div class="container">
			<!-- 상품 목록 -->
			<div class="row justify-content-center ">
				<div class="col-lg-8 col-md-10">
					<div class="product-list">
					<%if(list != null && !list.isEmpty()){ 
						Object first = list.get(0);
						
						if(first instanceof Cart){
							for(Cart cart : (List<Cart>) list){ %>
								<div class="product-card">
									<div class="product-wrapper">
										<div class="product-thumbnail">
											<img src="${ctx}/resources/shop/assets/img/product/product_list_1.png" alt="<%= cart.getProduct().getProductName() %>" />
										</div>
										<div class="product-details">
											<div class="product-title"><%= cart.getProduct().getProductName() %></div>
											<div class="product-quantity"><%=cart.getQuantity() %> 개</div>
											<div class="product-price">₩<%= String.format("%,d", cart.getProduct().getPrice()) %></div>
										</div>
									</div>
								</div>
							<%} %>
						<%}  else if(first instanceof Product){
									for(Product product : (List<Product>) list){ %>
										<div class="product-card">
											<div class="product-wrapper">
												<div class="product-thumbnail">
													<img src="${ctx}/resources/shop/assets/img/product/product_list_1.png" alt="<%= product.getProductName() %>" />
												</div>
												<div class="product-details">
													<div class="product-title"><%= product.getProductName() %></div>
													<div class="product-quantity">3 개</div>
													<div class="product-price">₩<%= String.format("%,d", product.getPrice()) %></div>
												</div>
											</div>
										</div>
									<%} %>
						<%} %>
					<%} %>
					</div>
				</div>
			</div>

			<!-- 결제 입력 폼 -->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-10">
					<div class="login_part_form">
						<div class="login_part_form_iner">
							<form class="row contact_form" id="joinForm">
							
								<!-- 약관 동의 -->
							    <div class="col-md-12 form-group">
							      	<div class="form-check">
							        	<input class="form-check-input" type="checkbox" id="agree" onclick="confirmCheckBox()" required checked/>
							        	<label class="form-check-label" for="agree">사용자 주소 사용하기</label>
							      	</div>
							    </div>
							
								<!-- 구매자 정보 -->
								<div class="col-md-12 form-group">
									<label>이름</label> 
									<input type="text" id="buyer_name" name="name" class="form-control" required />
								</div>

								<div class="col-md-12 form-group">
									<label>이메일</label> 
									<input type="email" id="buyer_email" name="email" class="form-control" required />
								</div>

								<div class="col-md-12 form-group">
									<label>전화번호</label> 
									<input type="text" id="buyer_tel" name="phone" class="form-control" required />
								</div>

								<!-- 주소 -->
								<div class="col-md-12 form-group">
									<label>주소</label>
									<div class="row g-2">
										<div class="col-5 col-sm-4">
											<input type="text" id="buyer_postcode" name="zipCode" class="form-control" placeholder="우편번호" readonly required>
										</div>
										<div class="col-7 col-sm-4">
											<button type="button" class="btn-check w-100" onclick="findHouseCode()">우편번호 찾기</button>
										</div>
										<div class="col-12 mt-2">
											<input type="text" id="buyer_address" name="address" class="form-control" placeholder="기본 주소" readonly required>
										</div>
										<div class="col-12 mt-2">
											<input type="text" id="buyer_address_detail" name="detailAddress" class="form-control" placeholder="상세 주소" required>
										</div>
									</div>
								</div>

								<!-- 결제 요약 -->
								<div class="col-md-12 form-group">
									<div class="summary-box">
										<p>
											<strong>상품 금액:</strong> 
											<span id="selectedAmount" class="blue-text">₩0</span>
										</p>
										<p>
											<strong>할인:</strong> 
											<span id="discountAmount" class="red-text">₩0</span>
										</p>
										<p>
											<strong>배송비:</strong> 
											<span id="shippingFee" class="blue-text">₩0</span>
										</p>
										<p>
											<strong>최종 결제 금액:</strong> 
											<span id="finalAmount" class="final-text">₩0</span>
										</p>
									</div>
									<button type="button" class="btn_3 w-100" onclick="requestPay()">결제하기</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>


</html>