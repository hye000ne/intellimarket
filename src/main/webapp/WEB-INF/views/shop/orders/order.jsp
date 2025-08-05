<%@page import="com.intellimarket.store.domain.ProductImage"%>
<%@page import="java.awt.Image"%>
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

	Member member = (Member)request.getAttribute("loginMember");
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
body {
  margin: 0;
  padding: 0;
  background-color: #f9f9f9;
  font-family: 'Segoe UI', sans-serif;
}

.product-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.product-card {
  border: 1px solid #ddd;
  border-radius: 12px;
  padding: 8px 12px;
  width: 100%;
  box-sizing: border-box;
  transition: box-shadow 0.2s ease;
  background-color: #fff;
}

.product-card:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.product-wrapper {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}

.product-thumbnail {
  width: 80px;
  height: 100px;
  min-width: 80px;
  flex-shrink: 0;
  display: flex;
  align-items: center;
}
.product-thumbnail img {
  width: 100%;
  height: auto;
  display: block;
  border-radius: 8px;
}

.product-details {
  flex: 1;
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  min-width: 0;
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
}

.product-title {
  flex: 2 1 0;
  min-width: 120px;
  max-width: 60%;
  font-size: 16px;
  font-weight: bold;
  color: #333;
}

.product-quantity {
  flex: 1 1 0;
  min-width: 60px;
  font-size: 15px;
  color: #444;
  font-weight: bold;
}

.product-price {
  flex: 1 1 0;
  min-width: 60px;
  font-size: 15px;
  color: #0072c6;
  font-weight: bold;
}

.scrollable-list {
  max-height: 400px;
  overflow-y: auto;
  padding-right: 10px;
  margin-bottom: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  background-color: #fff;
}

.scrollable-list::-webkit-scrollbar {
  width: 8px;
}
.scrollable-list::-webkit-scrollbar-thumb {
  background-color: #ccc;
  border-radius: 4px;
}
.scrollable-list::-webkit-scrollbar-track {
  background-color: #f1f1f1;
}

.buyer-info input,
.form-control {
  width: 100%;
  padding: 10px;
  margin-bottom: 12px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}

.btn-check {
  background-color: #0072c6;
  color: white;
  padding: 8px;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
}
.btn-check:hover {
  background-color: #005fa3;
}

.summary-box {
  margin-bottom: 20px;
  padding: 16px;
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  background-color: #fefefe;
  font-size: 15px;
  color: #333;
}

.summary-box p {
  margin-bottom: 8px;
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
  font-size: 32px;
  font-weight: bold;
  color: #333;
  text-align: center;
  margin-top: 12px;
}

.btn_3 {
  background-color: #0072c6;
  color: white;
  padding: 12px;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  cursor: pointer;
  width: 100%;
  transition: background-color 0.2s ease;
}
.btn_3:hover {
  background-color: #005fa3;
}

/* 반응형 대응 */
@media (max-width: 768px) {
  .product-wrapper {
    flex-direction: column;
    align-items: flex-start;
  }

  .product-details {
    flex-direction: column;
    align-items: flex-start;
    gap: 6px;
  }

  .product-title,
  .product-quantity,
  .product-price {
    justify-content: flex-start;
  }

  .btn-check {
    margin-top: 8px;
  }
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

    
    const shipping = 2500;
    const discount = productPrice >= 100000 ? 2500 : 0;
    const total = productPrice - discount + shipping;

    $("#selectedAmount").text("₩ " + productPrice.toLocaleString());
    $("#discountAmount").text("₩ -" + discount.toLocaleString());
    $("#shippingFee").text("₩ " + shipping.toLocaleString());
    $("#finalAmount").text("₩ " + total.toLocaleString());
  }

  /* 결제 요청 */
function requestPay() {
	let selectedItems = [];
	
	$(".product-card").each(function () {
	  const productId = $(this).data("product-id");
	  const quantity = parseInt($(this).find(".product-quantity").text());
	  const price = parseInt($(this).find(".product-price").text().replace("₩", "").replace(/,/g, ""));
	
	  selectedItems.push({
	    quantity,
	    totalPrice: price * quantity,
	    product: { productId }
	  });
	});
	
	if (selectedItems.length === 0) {
	  alert("주문할 상품이 없습니다.");
	  return;
	}
	
	const totalAmount = parseInt($("#finalAmount").text().replace("₩", "").replace(/,/g, ""));
	const buyerEmail = $("#buyer_email").val();
	const buyerName = $("#buyer_name").val();
	const buyerTel = $("#buyer_tel").val();
	const buyerPostcode = $("#buyer_postcode").val();
	const buyerAddr = $("#buyer_address").val();
	const buyerAddrAnd = $("#buyer_address_detail").val().trim();
	
	if (!buyerName || !buyerEmail || !buyerTel || !buyerAddr || !buyerAddrAnd) {
	  alert("모든 구매자 정보를 입력해주세요.");
	  return;
	}
	
	const IMP = window.IMP;
	IMP.init("imp61000270");
	
	IMP.request_pay({
	  channelKey: "channel-key-8ddc4b6b-44a7-4f92-9205-3b9a452a0cd3",
	  pay_method: "card",
	  merchant_uid: "payment-" + new Date().getTime(),
	  name: "상품 결제",
	  amount: totalAmount,
	  buyer_email: buyerEmail,
	  buyer_name: buyerName,
	  buyer_tel: buyerTel,
	  buyer_addr: buyerAddr + " " + buyerAddrAnd,
	  buyer_postcode: buyerPostcode,
	  display: {
	    card_quota: [0, 2, 3, 4, 5, 6],
	  }
	}, function (rsp) {
	  if (rsp.success) {
	    const merchantUid = rsp.merchant_uid;
	
	    const orders = selectedItems.map(item => ({
	      merchantUid,
	      quantity: item.quantity,
	      zipCode: buyerPostcode,
	      address: buyerAddr,
	      detailAddress: buyerAddrAnd,
	      totalPrice: item.totalPrice,
	      orderStatus: "ORDER_CONFIRMED",
	      product: item.product
	    }));
	
	    $.ajax({
	      url: "/shop/order/complete",
	      type: "POST",
	      contentType: "application/json",
	      data: JSON.stringify(orders),
	      success: function (res) {
	        // ✅ 주문 저장 성공 후 장바구니 삭제
	        const productIdsToDelete = selectedItems.map(item => item.product.productId);
	
	        $.ajax({
	          url: "/shop/cart/delete",
	          type: "POST",
	          contentType: "application/json",
	          data: JSON.stringify(productIdsToDelete),
	          success: function () {
	            // ✅ 장바구니 삭제 후 주문 성공 페이지로 이동
	            const form = document.createElement("form");
	            form.method = "POST";
	            form.action = "/shop/order/success";
	
	            const inputUid = document.createElement("input");
	            inputUid.type = "hidden";
	            inputUid.name = "merchantUid";
	            inputUid.value = merchantUid;
	            form.appendChild(inputUid);
	
	            const inputAmount = document.createElement("input");
	            inputAmount.type = "hidden";
	            inputAmount.name = "totalAmount";
	            inputAmount.value = totalAmount;
	            form.appendChild(inputAmount);
	
	            document.body.appendChild(form);
	            form.submit();
	          },
	          error: function (err) {
	            console.error("장바구니 삭제 실패:", err);
	            alert("장바구니 삭제 중 오류가 발생했습니다.");
	          }
	        });
	      },
	      error: function (err) {
	        console.error("주문 저장 실패:", err);
	        alert("주문 처리 중 오류가 발생했습니다.");
	      }
	    });
	  } else {
	    alert("❌ 결제 실패\n에러내용 : " + rsp.error_msg);
	  }
	});
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
					<div class="product-list scrollable-list">
					<% if (list != null && !list.isEmpty()) {
						    Object first = list.get(0);
						
						    if (first instanceof Cart) {
						        for (Cart cart : (List<Cart>) list) {
						            List<ProductImage> imgList = cart.getProduct().getImgList();
						            String imageSrc = (imgList != null && !imgList.isEmpty()) ? imgList.get(0).getFilename() : "${ctx}/resources/shop/assets/img/default.jpg";
						%>
						            <div class="product-card" data-product-id="<%= cart.getProduct().getProductId() %>">
						                <div class="product-wrapper">
						                    <div class="product-thumbnail">
						                        <img src="<%= imageSrc %>" alt="<%= cart.getProduct().getProductName() %>" />
						                    </div>
						                    <div class="product-details">
						                        <div class="product-title"><%= cart.getProduct().getProductName() %></div>
						                        <div class="product-quantity"><%= cart.getQuantity() %> 개</div>
						                        <div class="product-price">₩<%= String.format("%,d", cart.getProduct().getPrice() * cart.getQuantity()) %></div>
						                    </div>
						                </div>
						            </div>
						<%
						        }
						    } else if (first instanceof Product) {
						        Product product = (Product) first;
						        List<ProductImage> imgList = product.getImgList();
						        String imageSrc = (imgList != null && !imgList.isEmpty()) ? imgList.get(0).getFilename() : "${ctx}/resources/shop/assets/img/default.jpg";
						        int qty = (request.getAttribute("quantity") != null) ? (Integer) request.getAttribute("quantity") : 1;
						%>
						        <div class="product-card">
						            <div class="product-wrapper">
						                <div class="product-thumbnail">
						                    <img src="<%= imageSrc %>"/>
						                </div>
						                <div class="product-details">
						                    <div class="product-title"><%= product.getProductName() %></div>
						                    <div class="product-quantity"><%= qty %> 개</div>
						                    <div class="product-price">₩<%= String.format("%,d", product.getPrice() * qty) %></div>
						                </div>
						            </div>
						        </div>
						<%
						    }
						} %>
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