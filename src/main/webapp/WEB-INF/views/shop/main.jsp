<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<main>
	<div id="mainBannerCarousel" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<c:forEach var="banner" items="${bannerList}" varStatus="status">
				<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
					<div class="banner-wrapper">
						<img src="${ctx}${banner.imagePath}">
						<c:if test="${not empty banner.linkUrl}">
							<div class="carousel-caption d-none d-md-block">
								<a href="${banner.linkUrl}" class="btn btn-primary btn-sm">바로가기</a>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	
		<a class="carousel-control-prev" href="#mainBannerCarousel" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#mainBannerCarousel" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
		
	<!-- 신규 입점 스토어 -->
	<section class="category-area section-padding30">
	    <div class="container">
	        <div class="row justify-content-center mb-4">
	            <div class="col-md-6 text-center">
	                <h2 class="font-weight-bold">신규 입점 스토어</h2>
	            </div>
	        </div>
	        
	        <div class="row">
			  	<c:forEach var="store" items="${recentStoreList}">
			    	<div class="col-md-4 mb-4 " onclick="moveToStorePage('${store.engName}')">
						<div class="card h-100 text-center py-4 recent-store-card">
				        	<img src="${ctx}${store.logoPath != null ? store.logoPath : '/resources/common/img/logo/default.png'}" alt="스토어 로고" class="recent-store-logo">
				        	<div class="card-body">
					          	<h5 class="card-title">${store.storeName}</h5>
					          	<p class="card-text">${store.storeIntroduce}</p>
				        	</div>
				      	</div>
			    	</div>
			  	</c:forEach>
			</div>
		</div>
	</section>
	<!-- 신상품 -->
	<section class="latest-product-area">
	    <div class="container">
	        <div class="row justify-content-center mb-4">
	            <div class="col-md-6 text-center">
	                <h2 class="font-weight-bold">실시간 인기 아이템</h2>
	            </div>
	        </div>
	
	        <c:forEach var="product" items="${recentProductList}" varStatus="status">
	            <c:if test="${status.index % 3 == 0}">
	                <div class="row justify-content-center">
	            </c:if>
	
	            <div class="col-xl-4 col-lg-4 col-md-6 mb-4">
	                <div class="card h-100 text-center border-0 recent-store-card" onclick="location.href='/store/products/${product.productId}'">
	                    <div class="position-relative">
	                        <c:choose>
	                            <c:when test="${not empty product.imgList and fn:length(product.imgList) > 0}">
	                                <img src="${ctx}${product.imgList[0].filename}" alt="${product.productName}" class="card-img-top img-fluid d-block mx-auto" style="height: 300px; object-fit: cover;" />
	                            </c:when>
	                            <c:otherwise>
	                                <img src="${ctx}/resources/common/img/default_product.png" alt="기본 상품 이미지" class="card-img-top img-fluid d-block mx-auto" style="height: 300px; object-fit: cover;" />
	                            </c:otherwise>
	                        </c:choose>
	                        <span class="badge badge-danger position-absolute" style="top: 10px; left: 10px;">New</span>
	                        <span class="badge badge-danger position-absolute" style="top: 10px; left: 50px;">Best</span>
	                    </div>
	                    <div class="card-body">
	                        <h5 class="card-title">${product.productName}</h5>
	                        <div class="mt-2">
	                            <c:choose>
	                                <c:when test="${product.discount != 0}">
	                                    <strong><fmt:formatNumber value="${product.price - product.discount}" type="number" />원</strong><br />
	                                    <small class="text-muted"><del><fmt:formatNumber value="${product.price}" type="number" />원</del></small>
	                                </c:when>
	                                <c:otherwise>
	                                    <strong><fmt:formatNumber value="${product.price}" type="number" />원</strong>
	                                </c:otherwise>
	                            </c:choose>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <c:if test="${status.index % 3 == 2 || status.last}">
	                </div>
	            </c:if>
	        </c:forEach>
	    </div>
	</section>

	    <!-- 쇼핑몰 장점 소개 -->
	    <div class="shop-method-area section-padding30">
	        <div class="container">
	            <div class="row d-flex justify-content-between">
	                <div class="col-xl-3 col-lg-3 col-md-6">
	                    <div class="single-method mb-40">
	                        <i class="ti-package"></i>
	                        <h6>무료 배송</h6>
                   			<p>전국 어디든 빠르고 안전하게 무료로 배송해드립니다.</p>
	                    </div>
	                </div>
	                <div class="col-xl-3 col-lg-3 col-md-6">
	                    <div class="single-method mb-40">
	                        <i class="ti-unlock"></i>
	                        <h6>안전한 결제 시스템</h6>
                    		<p>다양한 결제수단과 철저한 보안으로 안전하게 결제하세요.</p>
	                    </div>
	                </div>
	                <div class="col-xl-3 col-lg-3 col-md-6">
	                    <div class="single-method mb-40">
	                        <i class="ti-reload"></i>
	                        <h6>간편한 교환/환불</h6>
                    		<p>단순 변심도 OK! 쉽고 빠르게 교환 및 환불 가능합니다.</p>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

</main>
<script>
	function moveToStorePage(engName) {
		location.href="/store/"+engName;
	}
</script>