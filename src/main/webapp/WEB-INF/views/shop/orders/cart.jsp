<%@page import="com.intellimarket.shop.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>
<%  List<Cart> cartList = (List<Cart>)request.getAttribute("cartList");  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<meta charset="UTF-8">
<title>장바구니</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: white;
}

.cart-container {
    max-width: 1200px;
    margin: 60px auto;
    background: #fff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
    display: flex;
    gap: 40px;
}

.cart-items {
    flex: 2;
    max-height: 600px; /* 원하는 높이로 조절 가능 */
    overflow-y: auto; 
    padding-right: 10px; /* 스크롤바 공간 확보 */
}

.cart-items::-webkit-scrollbar-thumb {
    background-color: #ccc;
    border-radius: 3px;
}

.summary-section {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

h2 {
    text-align: center;
    font-size: 28px;
    margin-bottom: 40px;
    color: #333;
}

.product-card {
    position: relative;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #eee;
    padding: 20px 0;
}
.product-checkbox {
    margin-right: 12px;
}

.product-thumbnail img {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 10px;
}

.product-details {
    margin-left: 20px;
    flex: 1;
}

.product-title {
    font-size: 18px;
    font-weight: bold;
    color: #222;
    margin-bottom: 6px;
}

.product-quantity {
    font-size: 14px;
    color: #666;
    margin-bottom: 4px;
    display: flex;
    align-items: center;
}

.qty-btn {
    background-color: #ddd;
    border: none;
    padding: 4px 10px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 4px;
    margin: 0 6px;
}

.qty-btn:hover {
    background-color: #ccc;
}

.qty-value {
    font-size: 16px;
    font-weight: bold;
    min-width: 24px;
    display: inline-block;
    text-align: center;
}

.product-price {
    font-size: 16px;
    color: #4CAF50;
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

.btn_3 {
    background-color: #4CAF50;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
}

.btn_3:hover {
    background-color: #45a049;
}

.delete-btn {
    position: absolute;
    bottom: 10px;
    right: 10px;
    background: transparent;
    border: none;
    font-size: 20px;
    color: #888;
    cursor: pointer;
    z-index: 10;
    transition: color 0.2s ease;
}

.delete-btn:hover {
    color: #e74c3c;
}

</style>

<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
const SHIPPING_FEE = 2500;

function changeQuantity(button, delta) {
    const qtySpan = button.parentElement.querySelector('.qty-value');
    let currentQty = parseInt(qtySpan.textContent);
    let newQty = currentQty + delta;
    if (newQty < 1) newQty = 1;
    qtySpan.textContent = newQty;
    updateSummary();
}

function updateSummary() {
    const productCards = document.querySelectorAll('.product-card');
    let total = 0;

    productCards.forEach(card => {
        const checkbox = card.querySelector('.product-checkbox');
        if (checkbox.checked) {
            const price = parseInt(card.querySelector('.product-price').dataset.price);
            const qty = parseInt(card.querySelector('.qty-value').textContent);
            total += price * qty;
        }
    });

    document.getElementById('selectedAmount').textContent = '₩' + total.toLocaleString();
    document.getElementById('finalAmount').textContent = '₩' + (total + SHIPPING_FEE).toLocaleString();
}

function showToast(message) {
    const toast = $('<div class="toast-message"></div>').text(message);
    $('body').append(toast);

    toast.css({
        position: 'fixed',
        bottom: '30px',
        left: '50%',
        transform: 'translateX(-50%)',
        background: '#333',
        color: '#fff',
        padding: '10px 20px',
        borderRadius: '5px',
        zIndex: 9999,
        opacity: 0
    });

    toast.animate({ opacity: 1 }, 300);

    setTimeout(() => {
        toast.animate({ opacity: 0 }, 300, () => toast.remove());
    }, 2000);
}

function removeItem(button) {
    const card = $(button).closest('.product-card');
    const productId = card.attr('data-id'); // attr로 직접 읽기

    if (!confirm("정말 이 상품을 장바구니에서 삭제하시겠습니까?")) {
        return;
    }

    $.ajax({
        url: "/shop/cart/delete",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({productId: productId}),
        success: function (response) {
            card.fadeOut(300, function () {
                $(this).remove();
                showToast(response);
                updateSummary();
            });
        },
        error: function (xhr) {
            const errorResponse = xhr.responseJSON;
            const errorMsg = errorResponse?.msg || "상품 삭제 중 오류가 발생했습니다.";
            alert(errorMsg);
        }
    });
}

function requestPay() {
    const cartItems = [];

    $('.product-card').each(function () {
        const checked = $(this).find('.product-checkbox').is(':checked');

        const cartId = $(this).attr('data-id');
        const quantity = $(this).find('.qty-value').text();

        cartItems.push({
            cartId: parseInt(cartId),
            quantity: parseInt(quantity),
            status: checked ? 1 : 0
        });
    });

    if (cartItems.length === 0) {
        alert("선택된 상품이 없습니다.");
        return;
    }

    // 서버에 Cart 업데이트 요청
    $.ajax({
        url: "/shop/cart/update",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(cartItems),
        success: function () {
            location.href = "/shop/order?product_id=0";
        },
        error: function (xhr) {
            const errorResponse = xhr.responseJSON;
            const errorMsg = errorResponse?.msg || "장바구니 업데이트 중 오류가 발생했습니다.";
            alert(errorMsg);
        }
    });
}


$(document).ready(function() {
    updateSummary();
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
                            <h2>장바구니</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 장바구니 영역 -->
    <div class="cart-container">
        <div class="cart-items">
            <% for (Cart cart : cartList) { %>
            <div class="product-card" data-id="<%= cart.getCartId() %>">
                <input type="checkbox" class="product-checkbox" checked onchange="updateSummary()" />

                <div class="product-thumbnail">
                    <img src="${ctx}/resources/shop/assets/img/product/product_list_1.png" alt="상품 이미지" />
                </div>

                <div class="product-details">
                    <div class="product-title"><%= cart.getProduct().getProductName() %></div>

                    <div class="product-quantity">
                        <button class="qty-btn" onclick="changeQuantity(this, -1)">−</button>
                        <span class="qty-value"><%= cart.getQuantity() %></span>
                        <button class="qty-btn" onclick="changeQuantity(this, 1)">+</button>
                    </div>

                    <div class="product-price" data-price="<%= cart.getProduct().getPrice() %>">
                        ₩<%= String.format("%,d", cart.getProduct().getPrice()) %>
                    </div>

                    <button class="delete-btn" onclick="removeItem(this)" title="삭제">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </div>
            </div>
            <% } %>
        </div>

        <!-- 요약 영역 -->
        <div class="summary-section">
            <div class="summary-box">
                <p><strong>총 상품 가격:</strong> <span id="selectedAmount">₩0</span></p>
                <p><strong>배송비:</strong> <span id="shippingFee" class="blue-text">₩2,500</span></p>
                <p><strong>총 결제 예상 금액:</strong> <span id="finalAmount" class="final-text">₩0</span></p>
            </div>
            <button type="button" class="btn_3" onclick="requestPay()">결제하기</button>
        </div>
    </div>
</body>

</html>
