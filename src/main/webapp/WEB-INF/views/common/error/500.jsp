<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/init.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>페이지를 찾을 수 없습니다</title>
    <link rel="stylesheet" href="/resources/bootstrap4/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f9;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .error-container {
            text-align: center;
        }
        .logo {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="logo">
            <img src="${ctx}/resources/common/img/logo/logo03.png" alt="Logo" height="50">
        </div>
        <h1 class="display-4 text-danger">500</h1>
		<p class="lead">서버에 오류가 발생했습니다.</p>

        <a href="javascript:history.back();" class="btn btn-secondary">이전 페이지</a>
    </div>
</body>
</html>
