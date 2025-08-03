<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<body>

<!-- 스토어 로고/소개 -->
<div class="container" style="max-width: 1196px; background: #fff;">
  <div class="row align-items-center py-4">
    <div class="col-auto">
      <img src="${ctx}${storeInfo.logoPath != null ? storeInfo.logoPath : '/resources/common/img/logo/default.png'}"
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
</div>
 <hr class="category-divider">
<!-- 카테고리 메뉴 -->
<div>
  <div class="container container-categories">
    <ul class="nav nav-pills mb-0 py-2 px-1" style="gap: 9px;">
      <li class="nav-item" style="position: relative;">
        <a href="#" class="nav-link">전체상품</a>
      </li>
      <c:forEach var="entry" items="${groupedCategories}">
        <li class="nav-item dropdown" style="position: relative;">
          <a href="#" class="nav-link dropdown-toggle">${entry.key.categoryName}</a>
          <ul class="dropdown-menu">
            <c:forEach var="subCat" items="${entry.value}">
              <li>
                <a class="dropdown-item" href="${ctx}/store/list?subCategoryId=${subCat.subCategoryId}">
                  ${subCat.categoryName}
                </a>
              </li>
            </c:forEach>
          </ul>
        </li>
      </c:forEach>
    </ul>
  </div>
  <hr class="category-divider">
</div>

<!-- 상품 리스트 -->
<div class="container py-4" style="max-width: 1196px; background: #fff;">
  <div class="row row-cols-2 row-cols-md-5 g-4 mb-2">
    <c:choose>
      <c:when test="${not empty products}">
        <c:forEach var="product" items="${products}">
          <div class="col">
            <div class="card border-0">
              <div style="padding: 14px 14px 0 14px;">
                <c:choose>
                  <c:when test="${not empty product.imgList and fn:length(product.imgList) > 0 and product.imgList[0].filename ne null}">
                    <img src="${ctx}/store/img/p_${product.productId}/${product.imgList[0].filename}"
                         alt="${product.productName}"
                         class="product-image" />
                  </c:when>
                  <c:otherwise>
                    <img src="${ctx}/resources/common/img/default_product.png"
                         alt="기본 상품 이미지"
                         class="product-image" />
                  </c:otherwise>
                </c:choose>
              </div>
              <div class="card-body pt-3 pb-2 px-2">
                <div class="mb-1 product-name">${product.productName}</div>
                <div class="mb-2 product-intro">${product.introduce}</div>
                <div class="product-price">
				  <c:choose>
				    <c:when test="${product.discount != 0}">
				      <span class="discounted-price">
				        <fmt:formatNumber value="${product.price - product.discount}" type="number" />원
				      </span>
				      <span class="original-price">
				        <fmt:formatNumber value="${product.price}" type="number" />원
				      </span>
				    </c:when>
				    <c:otherwise>
				      <fmt:formatNumber value="${product.price}" type="number" />원
				    </c:otherwise>
				  </c:choose>
				</div>
              </div>
            </div>
          </div>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <div class="col-12 text-center text-muted py-5 no-products">
          등록된 상품이 없습니다.
        </div>
      </c:otherwise>
    </c:choose>
  </div>
</div>
</body>
