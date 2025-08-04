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
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-lg-12">
					<div class="text-center mb-5">
					  	<h2 class="section-title">신규 입점 스토어</h2>
					</div>
	            </div>
	        </div>
	        
	        <div class="row">
			  	<c:forEach var="store" items="${recentStoreList}">
			    	<div class="col-md-4 mb-4">
						<div class="card h-100 text-center py-4">
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
	
	<section class="latest-product-area padding-bottom">
	    <div class="container">
	        <div class="row product-btn d-flex justify-content-end align-items-end">
	            <!-- Section Tittle -->
	            <div class="col-xl-4 col-lg-5 col-md-5">
	                <div class="section-tittle mb-30">
	                    <h2>신상품</h2>
	                </div>
	            </div>
	            <div class="col-xl-8 col-lg-7 col-md-7">
	                <div class="properties__button f-right">
	                    <!--Nav Button  -->
	                    <nav>                                                                                                
	                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
	                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">All</a>
	                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">New</a>
	                            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Featured</a>
	                            <a class="nav-item nav-link" id="nav-last-tab" data-toggle="tab" href="#nav-last" role="tab" aria-controls="nav-contact" aria-selected="false">Offer</a>
	                        </div>
	                    </nav>
	                    <!--End Nav Button  -->
	                </div>
	            </div>
	        </div>
	        <!-- Nav Card -->
	        <div class="tab-content" id="nav-tabContent">
	            <!-- card one -->
	            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
	                <div class="row">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product1.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product2.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product3.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product4.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product5.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product6.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- Card two -->
	            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	                <div class="row">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product4.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product5.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product6.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product2.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product3.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product1.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- Card three -->
	            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
	                <div class="row">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product2.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product3.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product1.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product4.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product6.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product5.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <!-- card foure -->
	            <div class="tab-pane fade" id="nav-last" role="tabpanel" aria-labelledby="nav-last-tab">
	                <div class="row">
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product1.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product2.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div> 
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product3.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product4.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product5.png" alt="">
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-4 col-lg-4 col-md-6">
	                        <div class="single-product mb-60">
	                            <div class="product-img">
	                                <img src="${ctx}/resources/shop/assets/img/categori/product6.png" alt="">
	                                <div class="new-product">
	                                    <span>New</span>
	                                </div>
	                            </div>
	                            <div class="product-caption">
	                                <div class="product-ratting">
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                    <i class="far fa-star low-star"></i>
	                                </div>
	                                <h4><a href="#">Green Dress with details</a></h4>
	                                <div class="price">
	                                    <ul>
	                                        <li>$40.00</li>
	                                        <li class="discount">$60.00</li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
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