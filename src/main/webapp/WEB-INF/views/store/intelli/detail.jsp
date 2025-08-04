<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container mt-4">
    <div class="row">
        <!-- 상품 사진 영역 -->
        <div class="col-md-6">
            <div id="productImagesCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach var="image" items="${productImages}" varStatus="status">
                        <div class="carousel-item ${status.first ? 'active' : ''}">
                            <img src="${image.url}" alt="상품 이미지" class="d-block w-100 product-image"/>
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#productImagesCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#productImagesCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-- 상품 정보 영역 -->
        <div class="col-md-6">
            <h2>${product.title}</h2>
            <p>
                <span class="price-original">${product.price}원</span>
                <span class="price-discount ms-3">${product.discountPrice}원</span>
                <span class="ms-3">할인금액: ${product.price - product.discountPrice}원</span>
            </p>

            <div class="d-flex gap-3 mt-4">
                <form action="buy" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="${product.id}"/>
                    <button type="submit" class="btn btn-primary">구매하기</button>
                </form>
                <form action="cart" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="${product.id}"/>
                    <button type="submit" class="btn btn-secondary">장바구니</button>
                </form>
            </div>
        </div>
    </div>

    <!-- 탭 영역 -->
    <div class="row mt-5">
        <ul class="nav nav-tabs" id="detailTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="true">
                    상세정보
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="review-tab" data-bs-toggle="tab" data-bs-target="#review" type="button" role="tab" aria-controls="review" aria-selected="false">
                    리뷰
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="qa-tab" data-bs-toggle="tab" data-bs-target="#qa" type="button" role="tab" aria-controls="qa" aria-selected="false">
                    Q&A
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="return-tab" data-bs-toggle="tab" data-bs-target="#return" type="button" role="tab" aria-controls="return" aria-selected="false">
                    반품/교환정보
                </button>
            </li>
        </ul>
        <div class="tab-content p-3 border border-top-0" id="detailTabsContent">
            <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
                <div id="summernote" style="min-height: 300px;">
                    <c:out value="${product.detailHtml}" escapeXml="false"/>
                </div>
            </div>

            <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                <c:forEach var="review" items="${reviews}">
                    <div class="border-bottom mb-3 pb-2">
                        <strong>${review.author}</strong> <small class="text-muted">${review.date}</small>
                        <p>${review.content}</p>
                    </div>
                </c:forEach>
            </div>

            <div class="tab-pane fade" id="qa" role="tabpanel" aria-labelledby="qa-tab">
                <c:forEach var="qaItem" items="${qaList}">
                    <div class="border-bottom mb-3 pb-2">
                        <strong>질문: ${qaItem.question}</strong> <small class="text-muted">${qaItem.askDate}</small>
                        <p><c:out value="${qaItem.answer}" default="답변 대기 중" escapeXml="false"/></p>
                    </div>
                </c:forEach>
            </div>

            <div class="tab-pane fade" id="return" role="tabpanel" aria-labelledby="return-tab">
                <p>${returnPolicy}</p>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            toolbar: false,
            airMode: true,
            disableDragAndDrop: true
        });
    });
</script>
