<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>첫페이지</title>
	</head>
	<body>
		<h1>개인 프로젝트</h1>
		<div>
			<a href="${pageContext.request.contextPath}/empLogin">관리자용 페이지</a>
		</div>
		<div>
			<a href="${pageContexr.request.contextPath}/main">쇼핑몰 페이지</a>
		</div>		
	</body>
</html>