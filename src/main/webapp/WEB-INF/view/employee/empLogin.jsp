<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>직원로그인</title>
	</head>
	<body>
		<h1>직원 로그인</h1>
		<span class="text-danger">${msg}</span>
		<form action="${pageContext.request.contextPath}/empLogin" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="employeeId">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="employeePw">
					</td>
				</tr>
			</table>
			
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
	</body>
</html>