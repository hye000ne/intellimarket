<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<link rel="stylesheet" href="${ctx}/resources/store/assets/css/detail.css" />
<div>
	<div class="row">
		<!-- 상품 사진 영역 -->
  <div class="col-md-6">
			<div id="productImagesCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<c:choose>
						<c:when test="${not empty product.imgList and fn:length(product.imgList) > 0}">
							<c:forEach var="image" items="${product.imgList}" varStatus="status">
								<div class="carousel-item ${status.first ? 'active' : ''}">
									<img src="${image.filename}" alt="상품 이미지" class="d-block w-100 product-image" />
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="carousel-item active">
								<img src="/resources/common/img/default_product.png" alt="기본 상품 이미지" class="d-block w-100 product-image" />
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 좌우 버튼 -->
				<button class="carousel-control-prev" type="button" data-bs-target="#productImagesCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden"></span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#productImagesCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden"></span>
				</button>

				<!-- 썸네일 리스트 -->
				<div class="thumbnail-list d-flex justify-content-center mt-3">
					<c:forEach var="image" items="${product.imgList}">
						<img src="${image.filename}" alt="썸네일 이미지" class="thumbnail-image mx-1" />
					</c:forEach>
				</div>
			</div>

		</div>

		<!-- 상품 정보 영역 -->
  <div class="col-md-6 product-info-container">
			<h2 class="product-name">${product.productName}</h2>
			<p class="product-price-area"><span class="price-original">${product.price}원</span> <span class="discounted-price">${product.price - product.discount}원</span></p>
			

					<!-- 배송기간 안내 박스 -->
					<div class="delivery-info-box mb-4 p-4 border rounded">
						<div class="delivery-title mb-2">
							<img src="/resources/icons/truck.png" alt="배송아이콘" style="height: 18px; margin-right: 6px;" />
							이 상품의 배송기간
						</div>
						<div class="delivery-desc mb-3">
							<b class="text-danger">평균 배송기간 1일 이내 상품입니다.</b> <br /> <small class="text-muted">배송기간은 주말/공휴일을 제외한 영업일 기준</small>
						</div>
						<div class="delivery-bar d-flex align-items-center gap-3">
							<div style="width: 80px;">1일 이내</div>
							<div class="progress flex-grow-1" style="height: 12px;">
								<div class="progress-bar bg-danger" role="progressbar" style="width: 100%;"></div>
							</div>
							<div>100%</div>
						</div>
						<div class="delivery-bar d-flex align-items-center gap-3 mt-2">
							<div style="width: 80px;">2일 이내</div>
							<div class="progress flex-grow-1" style="height: 12px;">
								<div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;"></div>
							</div>
							<div>0%</div>
						</div>
						<!-- 3일 이내, 4일 이상 등 필요시 추가 -->
					</div>
			<!-- 바닥 고정 컨테이너 -->
			<div class="bottom-fixed-area">
				<!-- 상품명, 수량선택 -->
				<div class="d-flex align-items-center product-qty-row mb-2">
					<div class="product-name flex-grow-1 fw-bold">${product.productName}</div>

					<div class="input-group qty-selector me-3">
						<button type="button" class="btn btn-outline-secondary btn-qty" id="btn-minus">-</button>
						<input type="text" id="quantity" name="quantity" value="1" min="1" class="form-control text-center" style="width: 45px;" />
						<button type="button" class="btn btn-outline-secondary btn-qty" id="btn-plus">+</button>
					</div>
				</div>

				<!-- 총 상품 금액 영역 -->
				<div class="d-flex align-items-center mb-3 total-amount-row">
					<div class="fw-bold me-2" style="font-size: 15px;">총 상품 금액</div>
					<span class="me-2" title="총 선택 수량" style="color: #666; font-size: 14px;">총 수량 <span id="displayQty">1</span>개
					</span>
					<div id="totalAmount" class="fw-bold" style="color: #D32F2F; font-size: 20px;">${product.price - product.discount}원</div>
				</div>

				<div class="product-action-bar border-top pt-3">
					<!-- 구매/장바구니 버튼 -->
					<form action="buy" method="post" class="d-inline">
						<input type="hidden" name="productId" value="${product.productId}" /> <input type="hidden" name="quantity" id="buyQuantity" value="1" />
						<button type="submit" class="btn btn-success btn-action px-4 fw-bold">구매하기</button>
					</form>
					<form action="cart" class="d-inline">
						<input type="hidden" name="productId" value="${product.productId}" /> <input type="hidden" name="quantity" id="cartQuantity" value="1" />
						<button type="submit" class="btn btn-outline-secondary btn-action px-4 fw-bold">장바구니</button>
					</form>
				</div>

			</div>
		</div>

	</div>

	<!-- 탭 영역 -->
	<div class="row">
		<div class="col-12">
			<ul class="nav nav-tabs" id="detailTabs" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="true">상세정보</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">리뷰</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">Q&A</button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="return-tab" data-bs-toggle="tab" data-bs-target="#return" type="button" role="tab" aria-controls="return" aria-selected="false">반품/교환정보</button>
				</li>
			</ul>
			<div class="tab-content p-3 border border-top-0" id="detailTabsContent">

				<!-- 상세정보 탭 패널 -->
				<div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
					<!-- 상품정보 박스 -->
					<div class="product-info-box p-4 border rounded mb-4">
						<table class="product-info-table table table-bordered mb-3">
							<tbody>
							
							
								<tr>
									<th>모델번호</th>
									<td colspan="5">${product.modelCode}</td>
								</tr>
								<tr>
									<th>브랜드</th>
									<td colspan="5">${product.brandName}</td>
								</tr>
								<tr>
									<th>원산지</th>
									<td colspan="5">${product.origin}</td>
								</tr>
								<tr>
									<th>A/S 안내</th>
									<td><a>${storeInfo.storeTel}</a></td>
									<th>반품/교환</th>
									<td>상품 수령 후 7일 이내</td>
								</tr>
								<tr>
									<th>배송업체</th>
									<td>SSG로지스</td>
									<th>배송요금</th>
									<td>무료 (오픈 이벤트)</td>
								</td>
								</tr>
							</tbody>
						</table>
					</div>
					<hr/>
					<!-- 써머노트 제품 상세 설명 -->
<div id="summernote" style="min-height: 300px; margin-bottom: 30px;">
  <c:out value="${product.productDetail}" escapeXml="false" />
</div>


				</div>

				<!-- 리뷰 탭 -->
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<c:forEach var="review" items="${reviews}">
						<div class="border-bottom mb-3 pb-2">
							<strong>${review.author}</strong> <small class="text-muted">${review.date}</small>
							<p>${review.content}</p>
						</div>
					</c:forEach>
				</div>

				<!-- Q&A 탭 -->
				<div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
					<c:forEach var="qaItem" items="${qaList}">
						<div class="border-bottom mb-3 pb-2">
							<strong>질문: ${qaItem.question}</strong> <small class="text-muted">${qaItem.askDate}</small>
							<p><c:out value="${qaItem.answer}" default="답변 대기 중" escapeXml="false" /></p>
						</div>
					</c:forEach>
				</div>

				<!-- 반품/교환정보 탭 -->
				<div class="tab-pane fade" id="return" role="tabpanel" aria-labelledby="return-tab">
					<p>${returnPolicy}</p>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- 장바구니 추가 성공 모달 -->
<div class="modal fade" id="cartSuccessModal" tabindex="-1" aria-labelledby="cartSuccessModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartSuccessModalLabel">
          <i class="bi bi-check-circle-fill text-success me-2"></i>장바구니 추가 완료
        </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <p class="mb-3">상품이 장바구니에 추가되었습니다.</p>
        <p class="text-muted">장바구니를 확인하시겠습니까?</p>
      </div>
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">계속 쇼핑</button>
        <button type="button" class="btn btn-primary" id="goToCartBtn">장바구니 보기</button>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function() {
	  
	  // Summernote 초기화 - 읽기 전용
	  $('#summernote').summernote({
	    toolbar: false,
	    airMode: false,
	    disableDragAndDrop: true,
	    minHeight: 300
	  });
	  $('#summernote').summernote('disable');

	  // 수량 및 금액 관련 변수
	  var $quantityInput = $('#quantity');
	  var $totalAmount = $('#totalAmount');
	  var $buyQuantity = $('#buyQuantity');
	  var $cartQuantity = $('#cartQuantity');
	  
	  var unitPrice = ${product.price - product.discount}; // JSP에서 숫자값 직접 출력

	  function updateQuantity(qty) {
	    if (isNaN(qty) || qty < 1) {
	      qty = 1;
	    }
	    $quantityInput.val(qty);

	    var total = unitPrice * qty;
	    $totalAmount.text(total.toLocaleString() + '원');
	    $('#displayQty').text(qty);
	    $buyQuantity.val(qty);
	    $cartQuantity.val(qty);
	  }

	  // 수량 입력 이벤트
	  $quantityInput.on('input change', function() {
	    var qty = parseInt($(this).val(), 10);
	    updateQuantity(qty);
	  });

	  // +- 버튼 클릭 이벤트
	  $('#btn-minus').click(function() {
	    var currentQty = parseInt($quantityInput.val(), 10);
	    if (currentQty > 1) {
	      updateQuantity(currentQty - 1);
	    }
	  });
	  
	  $('#btn-plus').click(function() {
	    var currentQty = parseInt($quantityInput.val(), 10);
	    updateQuantity(currentQty + 1);
	  });

	  updateQuantity(parseInt($quantityInput.val(), 10) || 1);

	// 장바구니 추가 Ajax
	  $('form[action="cart"]').on('submit', function(e) {
	    console.log("장바구니 폼 제출 감지");
	    e.preventDefault();
	    
	    var form = $(this);
	    var productId = form.find('input[name="productId"]').val();
	    var quantity = $('#quantity').val();
	    
	    $.ajax({
	        url: '/shop/cart/insert',
	        method: 'POST',
	        contentType: 'application/json',
	        dataType: 'json',
	        data: JSON.stringify({
	          quantity: quantity,        
	          product: {
	            productId: productId     
	          }
	        }),
	      success: function(response) {
	        // Bootstrap 모달 표시
	        $('#cartSuccessModal').modal('show');
	        
	        // 장바구니 보기 버튼 이벤트 (중복 방지를 위해 off 후 on)
	        $('#goToCartBtn').off('click').on('click', function() {
	          window.location.href = '/shop/cart';
	        });
	      },
	      error: function(xhr, status, error) {
	        console.error('AJAX 에러:', xhr.responseText);
	        alert('장바구니 추가 중 오류가 발생했습니다.');
	      }
	    });
	  });
	// 주문 Ajax (GET)
	  $('form[action="buy"]').on('submit', function(e) {
	    e.preventDefault();

	    var form = $(this);
	    var productId = form.find('input[name="productId"]').val();
	    var quantity = $('#quantity').val();

	    // GET 요청으로 주문 처리
	    var requestUrl = '/shop/order?product_id=' + encodeURIComponent(productId) +
	                     '&quantity=' + encodeURIComponent(quantity);

	    $.ajax({
	      url: requestUrl,
	      method: 'GET',
	      dataType: 'json',
	      success: function(response) {
	        alert('주문이 완료되었습니다.');
	        // 주문 완료 후 확인 페이지로 이동
	        window.location.href = '/shop/order/confirm/' + response.orderId;
	      },
	      error: function(xhr, status, error) {
	        console.error('주문 실패:', xhr.responseText);
	        alert('주문 처리 중 오류가 발생했습니다.');
	      }
	    });
	  });

	});

</script>
