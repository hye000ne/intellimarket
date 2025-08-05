<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<%@ include file="/WEB-INF/views/shop/mypage/common/mypageui.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.intellimarket.shop.domain.Order" %>
<%@ page import="com.intellimarket.store.domain.Product" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 목록</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }
        .order-title {
            font-size: 1.8em;
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .confirm-btn, .detail-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            margin: 2px;
        }
        .confirm-btn {
            background-color: #DB7093;
            color: white;
            cursor: pointer;
        }
        .confirm-btn[disabled] {
            background-color: #ccc;
            color: #666;
            cursor: not-allowed;
        }
        .detail-btn {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px 30px;
            border-radius: 12px;
            width: 480px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.3);
            animation: fadeIn 0.3s ease-in-out;
        }
        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover {
            color: #000;
        }
        .modal-content p {
            margin: 12px 0;
            font-size: 16px;
        }
        .modal-content strong {
            color: #333;
        }
        
        .page-btn {
            margin: 0 5px;
            padding: 5px 8px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            color: black;
            cursor: pointer;
            border-radius: 4px;
        }

        .page-btn:hover {
            background-color: #eee;
        }

        .page-btn.active {
            font-weight: bold;
            background-color: #007bff;
            color: white;
        }

        .confirm-btn {
            padding: 5px 10px;
            background-color: #28a745;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .confirm-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .detail-btn {
            padding: 5px 10px;
            background-color: #007bff;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0; top: 0;
            width: 100%; height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .close {
            float: right;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="order-title">나의 주문 내역</div>

<%
    List<Order> orderList = (List<Order>) request.getAttribute("orderList");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    if (orderList != null && !orderList.isEmpty()) {
%>
    <table id="orderTable">
        <thead>
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>수량</th>
                <th>가격</th>
                <th>주문일자</th>
                <th>주문상태</th>
                <th>구매 확정</th>
                <th>상세보기</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Order order : orderList) {
                Product product = order.getProduct();
                int productId = product.getProductId();
                String merchantUid = order.getMerchantUid();
                String productName = product != null ? product.getProductName().replace("'", "\\'") : "상품 정보 없음";
                int quantity = order.getQuantity();
                int price = order.getTotalPrice();
                String createdDate = order.getCreatedDate() != null ? order.getCreatedDate().format(formatter) : "-";
                String status = order.getOrderStatus() != null ? order.getOrderStatus().toString() : "-";

                String statusKor = "-";
                switch (status) {
                    case "ORDER_WATING": statusKor = "결제대기중"; break;
                    case "ORDER_CONFIRMED": statusKor = "주문완료"; break;
                    case "PREPARING_SHIPMENT": statusKor = "배송준비중"; break;
                    case "IN_TRANSIT": statusKor = "배송중"; break;
                    case "DELIVERED": statusKor = "배송완료"; break;
                    case "CANCEL": statusKor = "취소"; break;
                    case "CHANGE": statusKor = "교환"; break;
                    case "RETURN": statusKor = "환불"; break;
                    case "CANCEL_COMPLETE": statusKor = "취소완료"; break;
                    case "CHANGE_COMPLETE": statusKor = "교환완료"; break;
                    case "RETURN_COMPLETE": statusKor = "환불완료"; break;
                    case "PURCHASE_CONFIRMED": statusKor = "구매확정"; break;
                }

                String recipient = order.getMember() != null ? order.getMember().getName() : "-";
                String phone = order.getMember() != null ? order.getMember().getPhone() : "-";
                String address = order.getAddress();
                String detailAddress = order.getDetailAddress();
                int zipCode = order.getZipCode();
                
                String confirmStatus = "PURCHASE_CONFIRMED";
        %>
            <tr>
                <td><%= merchantUid %></td>
                <td><%= productName %></td>
                <td><%= quantity %></td>
                <td><%= String.format("%,d원", price) %></td>
                <td><%= createdDate %></td>
                <td><%= statusKor %></td>
                <td>
                    <%
                        if ("DELIVERED".equals(status)) {
                    %>
                        <button class="confirm-btn"
                                onclick="confirmPurchase('<%= merchantUid %>', '<%= productId %>', <%= quantity %>, <%= price %>, '<%= confirmStatus %>', <%= order.getOrderId() %>, this)">
                            구매 확정
                        </button>
                    <%
                        } else {
                    %>
                        <button class="confirm-btn" disabled>구매 확정</button>
                    <%
                        }
                    %>
                </td>
                <td>
                    <button class="detail-btn"
                        data-id="<%= merchantUid %>"
                        data-name="<%= productName %>"
                        data-qty="<%= quantity %>"
                        data-price="<%= String.format("%,d원", price) %>"
                        data-status="<%= statusKor %>"
                        data-date="<%= createdDate %>"
                        data-recipient="<%= recipient %>"
                        data-phone="<%= phone %>"
                        data-address="<%= address %>"
                        data-detail="<%= detailAddress %>"
                        data-zipcode="<%= zipCode %>"
                        onclick="openModalFromElement(this)">
                        상세보기
                    </button>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div id="pagination" style="text-align:center; margin-top:20px;"></div>

<%
    } else {
%>
    <p style="text-align:center; margin-top:30px;">📭 주문 내역이 없습니다.</p>
<%
    }
%>

<!-- 모달 창 -->
<div id="orderModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h3 style="margin-bottom:20px;">📦 주문 상세 정보</h3>
        <div id="modalBody"></div>
    </div>
</div>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
const rowsPerPage = 10;
let currentPage = 1;

function paginateTable() {
    const table = document.getElementById("orderTable");
    const tbody = table.querySelector("tbody");
    const rows = tbody.querySelectorAll("tr");
    const totalRows = rows.length;
    const totalPages = Math.ceil(totalRows / rowsPerPage);

    rows.forEach((row, index) => {
        row.style.display = (index >= (currentPage - 1) * rowsPerPage && index < currentPage * rowsPerPage)
            ? "" : "none";
    });

    const paginationContainer = document.getElementById("pagination");
    paginationContainer.innerHTML = "";

    if (totalPages <= 1) return;

    const createButton = (text, page) => {
        const btn = document.createElement("button");
        btn.textContent = text;
        btn.className = "page-btn";
        if (page === currentPage) {
            btn.classList.add("active");
        }
        btn.onclick = () => {
            currentPage = page;
            paginateTable();
        };
        return btn;
    };

    if (currentPage > 1) {
        paginationContainer.appendChild(createButton("처음", 1));
        paginationContainer.appendChild(createButton("이전", currentPage - 1));
    }

    for (let i = 1; i <= totalPages; i++) {
        paginationContainer.appendChild(createButton(i, i));
    }

    if (currentPage < totalPages) {
        paginationContainer.appendChild(createButton("다음", currentPage + 1));
        paginationContainer.appendChild(createButton("끝", totalPages));
    }
}

window.onload = paginateTable;

function openModalFromElement(el) {
    const orderId = el.getAttribute("data-id");
    const productName = el.getAttribute("data-name");
    const quantity = el.getAttribute("data-qty");
    const price = el.getAttribute("data-price");
    const statusKor = el.getAttribute("data-status");
    const createdDate = el.getAttribute("data-date");

    const recipient = el.getAttribute("data-recipient");
    const phone = el.getAttribute("data-phone");
    const address = el.getAttribute("data-address");
    const detail = el.getAttribute("data-detail");
    const zipcode = el.getAttribute("data-zipcode");

    openModal(orderId, productName, quantity, price, statusKor, createdDate,
              recipient, phone, address, detail, zipcode);
}

function openModal(orderId, productName, quantity, price, statusKor, createdDate,
    recipient, phone, address, detail, zipcode) {
    const modal = document.getElementById("orderModal");
    const modalBody = document.getElementById("modalBody");
    const formattedPhone = formatPhoneNumber(phone);

    modalBody.innerHTML =
        "<p><strong>🧾 주문번호:</strong> " + orderId + "</p>" +
        "<p><strong>📦 상품명:</strong> " + productName + "</p>" +
        "<p><strong>🔢 수량:</strong> " + quantity + "</p>" +
        "<p><strong>💰 가격:</strong> " + price + "</p>" +
        "<p><strong>📅 주문일자:</strong> " + createdDate + "</p>" +
        "<p><strong>🚚 주문상태:</strong> " + statusKor + "</p>" +
        "<hr>" +
        "<p><strong>👤 수령인:</strong> " + recipient + "</p>" +
        "<p><strong>📞 연락처:</strong> " + formattedPhone + "</p>" +
        "<p><strong>🏠 배송지:</strong> (" + zipcode + ") " + address + " " + detail + "</p>";

    modal.style.display = "block";
}

function formatPhoneNumber(phone) {
    if (!phone) return "-";
    const cleaned = phone.replace(/\D/g, "");
    if (cleaned.length === 11) {
        return cleaned.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
    } else if (cleaned.length === 10) {
        return cleaned.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
    } else {
        return phone;
    }
}

function closeModal() {
    document.getElementById("orderModal").style.display = "none";
}

window.onclick = function(event) {
    const modal = document.getElementById("orderModal");
    if (event.target === modal) {
        modal.style.display = "none";
    }
}

function confirmPurchase(merchantUid, productId, quantity, price, status, orderId, buttonElement){
    if (!confirm("구매를 확정하시겠습니까?")) return;

    const payload = {
        merchantUid: merchantUid,
        product: { productId: productId },
        quantity: quantity,
        price: price,
        status: status,
        order: { orderId: orderId }
    };

    $.ajax({
        url: "/shop/mypage/myorders/insert/settlement",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(payload),
        success: function() {
            $.ajax({
                url: "/shop/mypage/myorders/update/orderstatus",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(payload),
                success: function() {
                    alert("구매 확정이 완료되었습니다.");
                    window.location.reload();
                },
                error: function() {
                    alert("주문 상태 업데이트 중 문제가 발생했습니다.");
                }
            });
        },
        error: function() {
            alert("정산 정보 저장 중 문제가 발생했습니다.");
        }
    });
}
</script>

</body>
</html>

