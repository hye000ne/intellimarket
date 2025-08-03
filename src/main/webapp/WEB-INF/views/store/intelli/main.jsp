<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<body style="background: #f9fcfd;">

	<!-- 스토어 로고/소개 -->
	<div class="container" style="max-width: 1196px; background: #fff;">
		<div class="row align-items-center py-4">
			<div class="col-auto">
				<img
					src="${ctx}${storeInfo.logoPath != null ? storeInfo.logoPath : '/resources/common/img/logo/default.png'}"
					alt="스토어 로고"
					style="width: 108px; height: 108px; border-radius: 18px; border: 2.5px solid #16cab2; background: #fafcfd; object-fit: contain;">
			</div>
			<div class="col">
				<h1 class="fw-bold mb-2" style="color: #21bcaa;">${storeInfo.storeName}</h1>
				<div class="text-secondary mb-1" style="font-size: 1.14rem;">
					${storeInfo.storeIntroduce != null ? storeInfo.storeIntroduce : '스토어 소개가 없습니다.'}
				</div>
			</div>
		</div>
		<hr style="border-top: 2px solid #ecf1f2; margin: 0;">
	</div>

	<!-- 카테고리 pill-bar -->
	<div style="background: #fff;">
		<div class="container" style="max-width: 1196px; padding-top: 0;">
			<ul class="nav nav-pills mb-0 py-2 px-1" style="gap: 9px;">
				<c:forEach var="storeCat" items="${storeCategories}">
					<li class="nav-item"><a class="nav-link"
						href="${ctx}/store/list?subCategoryId=${storeCat.subCategory.subCategoryId}"
						style="font-weight: 650; border-radius: 17px; color: #13b4a8; background: #f3fefd; min-width: 90px; text-align: center; border: 1.2px solid #b1e6d8; font-size: 1.05rem; letter-spacing: -.4px;">
							${storeCat.subCategory.categoryName} </a></li>
				</c:forEach>
			</ul>
		</div>
		<hr style="border: 0; border-top: 2px solid #eef3f9; margin: 0;">
	</div>

	<!-- 상품 리스트 -->
	<div class="container py-4"
		style="max-width: 1196px; background: #fff;">
		<div class="row row-cols-2 row-cols-md-4 g-4 mb-2">
			<c:choose>
				<c:when test="${not empty products}">
					<c:forEach var="product" items="${products}">
						<div class="col">
							<div class="card border-0"
								style="border-radius: 16px; background: #fff; box-shadow: 0 2px 10px #14cab316;">
								<div style="padding: 14px 14px 0 14px;">
									<c:choose>
										<c:when
											test="${not empty product.imgList and fn:length(product.imgList) > 0 and product.imgList[0].filename ne null}">
											<img src="${ctx}${product.imgList[0].filename}"
												alt="${product.productName}"
												style="object-fit: cover; width: 100%; height: 154px; border-radius: 11px; background: #f6fbfa;" />
										</c:when>
										<c:otherwise>
											<img src="${ctx}/resources/common/img/default_product.png"
												alt="기본 상품 이미지"
												style="object-fit: cover; width: 100%; height: 154px; border-radius: 11px; background: #f6fbfa;" />
										</c:otherwise>
									</c:choose>

								</div>
								<div class="card-body pt-3 pb-2 px-2">
									<div class="mb-1"
										style="font-size: 1.05rem; font-weight: 700; color: #15b5a8;">
										${product.productName}</div>
									<div class="mb-2"
										style="color: #7a7e7e; font-size: 0.98rem; min-height: 18px; max-height: 32px; overflow: hidden;">
										${product.introduce}</div>
									<div
										style="font-size: 1.14rem; font-weight: 600; color: #219187;">
										₩
										<fmt:formatNumber value="${product.price}" type="number" />
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="col-12 text-center text-muted py-5"
						style="font-size: 1.15rem; color: #a6acad;">등록된 상품이 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<style>
body {
	background: #f9fcfd !important;
}

.nav-pills .nav-link {
	color: #13b4a8;
}

.nav-pills .nav-link:hover, .nav-pills .nav-link:focus {
	background-color: #d7f4f1 !important;
	color: #0d8a78 !important;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	background: #16cab2 !important;
	color: #fff !important;
	border: 0 !important;
}

.card {
	transition: box-shadow .18s;
}

.card:hover {
	box-shadow: 0 10px 24px rgba(22, 202, 178, 0.1) !important;
	border: 1.2px solid #16cab2;
}

.badge {
	border-radius: 11px !important;
	letter-spacing: -0.2px;
}

hr {
	border-top-width: 2px !important;
}
</style>

</body>
