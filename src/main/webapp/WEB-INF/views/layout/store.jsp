<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쇼핑몰 관리자</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
		<link rel="stylesheet" href="${ctx}/resources/admin/assets/plugins/fontawesome-free/css/all.min.css">
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="${ctx}/resources/admin/assets/css/adminlte.min.css">

		<link rel="stylesheet" href="${ctx}/resources/common/css/override.css">
		
		<script src="${ctx}/resources/admin/assets/plugins/jquery/jquery.min.js"></script>
	</head>
	<body class="hold-transition sidebar-mini">
		<div class="wrapper">
			<jsp:include page="/WEB-INF/views/store/seller/include/header.jsp"/>
		    <jsp:include page="/WEB-INF/views/store/seller/include/sidebar.jsp"/>
		    <jsp:include page="/WEB-INF/views/${contentPage}" />
		    <jsp:include page="/WEB-INF/views/store/seller/include/footer.jsp"/>
	  	</div>
	  		<!-- jQuery / jQuery UI -->
			<script src="${ctx}/resources/admin/assets/plugins/jquery-ui/jquery-ui.min.js"></script>
			<script>
				$.widget.bridge('uibutton', $.ui.button)
			</script>
			<!-- Bootstrap / 기본 플러그인 -->
			<script src="${ctx}/resources/admin/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="${ctx}/resources/admin/assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
			<!-- AdminLTE Core -->
			<script src="${ctx}/resources/admin/assets/js/adminlte.js"></script>
			<!-- 공통 기능 데모용 -->
			<script src="${ctx}/resources/admin/assets/js/demo.js"></script>
			<!-- Summernote -->
			<script src="${ctx}/resources/admin/assets/plugins/summernote/summernote-bs4.min.js"></script>
	</body>
</html>