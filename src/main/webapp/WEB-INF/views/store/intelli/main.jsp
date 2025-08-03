<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
  var ctx = "${pageContext.request.contextPath}";
</script>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<
<!-- 상품 리스트 -->
<div class="container py-4" style="max-width: 1196px; background: #fff;">
  <div class="row row-cols-2 row-cols-md-5 g-4 mb-2">
    <c:choose>
      <c:when test="${not empty products}">
        <c:forEach var="product" items="${products}">
          <div class="col product-item" data-product-id="${product.productId}">
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
<script>

const engName = '${storeInfo.engName}';
$(document).ready(function() {
	  // 탑 카테고리 클릭 이벤트 위임
	  $(document).on('click', '.nav-link.dropdown-toggle', function(e) {
	    e.preventDefault();
	    const topId = $(this).data('topid');
	    if (!topId) {
	      console.warn('topId가 없습니다.');
	      return;
	    }
	    // AJAX 호출
	    $.ajax({
	      url: '/store/' + engName + '/top/' + topId,
	      method: 'GET',
	      success: function(data) {
	        renderProducts(data);
	      },
	      error: function() {
	        console.error('탑 카테고리 AJAX 에러');
	      }
	    });
	  });
	  
	  // 서브 카테고리 이벤트도 위임으로 처리하셨죠?
	  $(document).on('click', '.dropdown-item', function(e) {
	    e.preventDefault();
	    const subId = $(this).data('subid');
	    if (!subId) {
	      console.warn('subId가 없습니다.');
	      return;
	    }
	    $.ajax({
		      url: '/store/' + engName + '/sub/' + subId,
	      method: 'GET',
	      success: function(data) {
	        renderProducts(data);
	      },
	      error: function() {
	        console.error('서브 카테고리 AJAX 에러');
	      }
	    });
	  });
	  
	  // 전체상품도 직접 바인딩하세요
	  $('#allProducts').click(function(e) {
	    e.preventDefault();
	    $.ajax({
	      url: `/store/${engName}/all`,
	      method: 'GET',
	      success: function(data) {
	        renderProducts(data);
	      },
	      error: function() {
	        console.error('전체상품 AJAX 에러');
	      }
	    });
	  });
	});

function renderProducts(products) {
	  var container = $('.row.row-cols-2.row-cols-md-5.g-4.mb-2');
	  container.empty();

	  if (products.length === 0) {
	    container.append('<div class="col-12 text-center text-muted py-5">등록된 상품이 없습니다.</div>');
	    return;
	  }

	  products.forEach(function(product) {
	    var priceHtml = '';
	    if (product.discount !== 0) {
	      priceHtml = '<span class="discounted-price">' + (product.price - product.discount) + '원</span>' +
	                  '<span class="original-price">' + product.price + '원</span>';
	    } else {
	      priceHtml = product.price + '원';
	    }

	    var imageSrc = product.imagePath || (ctx + "/store/img/p_" + product.productId + "/" + (product.imgList && product.imgList.length > 0 ? product.imgList[0].filename : ""));
	    if (!imageSrc || imageSrc.endsWith("/")) {
	      imageSrc = '/resources/common/img/default_product.png';
	    }

	    // 상품 아이디를 data-product-id 속성으로 추가
	    var productHtml = 
	      '<div class="col product-item" data-product-id="' + product.productId + '">' +
	        '<div class="card border-0" style="border-radius: 16px; background: #fff; box-shadow: 0 2px 10px #14cab316;">' +
	          '<div style="padding: 14px 14px 0 14px;">' +
	            '<img src="' + imageSrc + '" alt="' + product.productName + '" class="product-image" />' +
	          '</div>' +
	          '<div class="card-body pt-3 pb-2 px-2">' +
	            '<div class="mb-1 product-name">' + product.productName + '</div>' +
	            '<div class="mb-2 product-intro">' + product.introduce + '</div>' +
	            '<div class="product-price">' + priceHtml + '</div>' +
	          '</div>' +
	        '</div>' +
	      '</div>';

	    container.append(productHtml);
	  });
	}

//container 영역에 이벤트 위임해서 클릭 이벤트 처리 (ES5 스타일)
$(document).on('click', '.product-item', function() {
    var productId = $(this).data('product-id');
    if (!productId) {
        console.warn('productId is missing');
        return;
    }
    var url = '/store/' + engName + '/products/' + productId + '/frag';

    $.get(url, function(html) {
        // 응답받은 HTML로 특정 영역(html fragment) 교체
        $('#contentPage').html(html);

        // 필요하면 스크립트 초기화 등 추가 실행
    }).fail(function() {
        alert('상품 정보 로드 실패');
    });
});

</script>


