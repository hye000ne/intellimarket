<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp"%>

<!DOCTYPE html>
<html 
lang="ko">
<head>
		<meta charset="UTF-8">
		<title>${storeInfo.storeName}</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/flaticon.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/slicknav.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/animate.min.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/magnific-popup.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/fontawesome-all.min.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/themify-icons.css" />
<link rel="stylesheet" href="${ctx}/resources/shop/assets/css/slick.css" />
<link rel="stylesheet"
	href="${ctx}/resources/shop/assets/css/nice-select.css" />
<link rel="stylesheet" href="${ctx}/resources/shop/assets/css/style.css" />
<link rel="stylesheet" href="${ctx}/resources/store/assets/css/main.css" />
<link rel="stylesheet" href="${ctx}/resources/common/css/override.css" />
<script src="${ctx}/resources/admin/assets/plugins/jquery/jquery.min.js"></script>
<!-- jQuery -->

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
</head>
<body>
<div class="wrapper">
	<!-- 헤더 include -->
	<jsp:include page="/WEB-INF/views/store/intelli/include/header.jsp" />
	<!-- 메인 컨텐츠 영역 동적 include -->
	<jsp:include page="/WEB-INF/views/${contentPage}" />
	<!-- 푸터 include -->
	<jsp:include page="/WEB-INF/views/shop/include/footer.jsp" />
</div>

	<!-- Core JS -->
	<script
		src="${ctx}/resources/shop/assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/popper.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/bootstrap.min.js"></script>

	<!-- UI Plugins -->
	<script src="${ctx}/resources/shop/assets/js/jquery.slicknav.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/owl.carousel.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/slick.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/wow.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/animated.headline.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.magnific-popup.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.scrollUp.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.nice-select.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.sticky.js"></script>

	<!-- Form & Contact -->
	<script src="${ctx}/resources/shop/assets/js/contact.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.form.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.validate.min.js"></script>
	<script src="${ctx}/resources/shop/assets/js/mail-script.js"></script>
	<script src="${ctx}/resources/shop/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Etc -->
	<script src="${ctx}/resources/shop/assets/js/plugins.js"></script>
	<script src="${ctx}/resources/shop/assets/js/main.js"></script>

	<!-- intellimarket 공용 js -->
	<script src="${ctx}/resources/common/js/common.js"></script>
	

	<!-- body 닫기 전에 JS 추가 (기존 jQuery, Bootstrap 스크립트 뒤에 위치) -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</body>
</html>
