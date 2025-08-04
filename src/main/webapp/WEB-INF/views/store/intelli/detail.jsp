<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<link rel="stylesheet" href="${ctx}/resources/store/assets/css/detail.css" />
<div class="container mt-4">
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
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#productImagesCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
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
					<form action="cart" method="post" class="d-inline">
						<input type="hidden" name="productId" value="${product.productId}" /> <input type="hidden" name="quantity" id="cartQuantity" value="1" />
						<button type="submit" class="btn btn-outline-secondary btn-action px-4 fw-bold">장바구니</button>
					</form>
				</div>

			</div>
		</div>

	</div>

	<!-- 탭 영역 -->
	<div class="row mt-5">
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
					<!-- 상품정보 박스 -->
					<div class="product-info-box p-4 border rounded mb-4">
						<table class="product-info-table table table-bordered mb-3">
							<tbody>
								<tr>
									<th>모델번호</th>
									<td>${product.modelCode}</td>
								</tr>
								<tr>
									<th>브랜드</th>
									<td>${product.brandName}</td>
								</tr>
								<tr>
									<th>원산지</th>
									<td>${product.origin}</td>
								</tr>
								<tr>
									<th>A/S 안내</th>
									<td colspan="3">
										<a href="#">상세정보 확인</a>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="product-info-qna text-muted">
							상품정보 관련 문의사항은
							<a href="#qa-tab" class="text-primary">Q&amp;A</a>
							에 남겨주세요.
						</div>
					</div>
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

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			toolbar : false,
			airMode : true,
			disableDragAndDrop : true
		});
	});

	// 가격 -> (원가 - 할인가)
	let unitPrice = $
	{
		product.price - product.discount
	};

	// 수량 입력 요소
	let $quantityInput = $('#quantity');

	// 총 상품 금액 보여주는 영역
	let $totalAmount = $('#totalAmount');

	// 구매, 장바구니 hidden 수량 필드
	let $buyQuantity = $('#buyQuantity');
	let $cartQuantity = $('#cartQuantity');

	// 수량 변경시 이벤트
	$quantityInput.on('input change', function() {
		let qty = parseInt($(this).val());
		if (isNaN(qty) || qty < 1) {
			qty = 1;
			$(this).val(qty);
		}

		// 총 금액 계산
		let total = unitPrice * qty;
		$totalAmount.text(`총 상품 금액 : ${total.toLocaleString()}원`);

		// hidden 필드에 수량 반영
		$buyQuantity.val(qty);
		$cartQuantity.val(qty);
	});

	// 장바구니 추가
	$(document).ready(function() {

		// 기존 장바구니 Ajax 코드 유지하면서 quantity 제대로 전달되도록 수정
		$('form').on('submit', function(e) {
			if ($(this).find('button.btn-secondary').length > 0) {
				e.preventDefault();
				let form = $(this);
				let productId = form.find('input[name="productId"]').val();
				let quantity = form.find('input[name="quantity"]').val();

				$.ajax({
					url : '/shop/cart/insert',
					method : 'POST',
					dataType : 'json',
					data : {
						productId : productId,
						quantity : quantity
					},
					success : function(response) {
						alert('장바구니에 상품이 추가되었습니다.');
					},
					error : function(xhr, status, error) {
						alert('장바구니 추가 중 오류가 발생했습니다.');
						console.error(error);
					}
				});
			}
		});
	});
	
	$quantityInput.on('input change', function() {
		  let qty = parseInt($(this).val());
		  if (isNaN(qty) || qty < 1) {
		    qty = 1;
		    $(this).val(qty);
		  }

		  // 총 금액 계산
		  let total = unitPrice * qty;
		  $totalAmount.text(`총 상품 금액 : ${total.toLocaleString()}원`);

		  // 총 수량 표시 업데이트
		  $('#displayQty').text(qty);

		  // hidden 필드에 수량 반영
		  $buyQuantity.val(qty);
		  $cartQuantity.val(qty);
		});
	
	$('#btn-plus').click(function() {
		  let currentQty = parseInt($quantityInput.val());
		  $quantityInput.val(currentQty + 1).trigger('change');
		});

		$('#btn-minus').click(function() {
		  let currentQty = parseInt($quantityInput.val());
		  if (currentQty > 1) {
		    $quantityInput.val(currentQty - 1).trigger('change');
		  }
		});


</script>
