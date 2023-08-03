<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeMain</title>
	</head>
	<body>
		<h1>직원 메인페이지</h1>
		<a href="${pageContext.request.contextPath}/employeeLogout">로그아웃</a>
		${loginEmployee.employeeId}
	</body>
</html>