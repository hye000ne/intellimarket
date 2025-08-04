<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>인텔리마켓 판매자 센터</title>
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- NotoSansKR · Font Awesome CDN (아이콘 사용) -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500;700&display=swap" rel="stylesheet">
    
       	<link rel="stylesheet" href="${ctx}/resources/shop/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/flaticon.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/slicknav.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/animate.min.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/themify-icons.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/slick.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/nice-select.css">
        <link rel="stylesheet" href="${ctx}/resources/shop/assets/css/style.css">
        <link rel="stylesheet" href="${ctx}/resources/common/css/override.css">
    	<link rel="stylesheet" href="${ctx}/resources/store/assets/css/about.css">
    
	<script src="${ctx}/resources/shop/assets/js/vendor/jquery-1.12.4.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/store/seller/include/aboutheader.jsp" />
	<jsp:include page="/WEB-INF/views/${contentPage}" />
	<jsp:include page="/WEB-INF/views/store/seller/include/aboutfooter.jsp" />
	<script src="${ctx}/resources/common/js/common.js"></script>
</body>
</html>
