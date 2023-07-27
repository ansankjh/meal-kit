<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empIdFind</title>
	</head>
	<body>
		<h1>계정찾기</h1>
		${msg}
		<form action="${pageContext.request.contextPath}/empIdFind" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="employeeName">
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="employeeEmail">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">확인</button>
			</div>
		</form>
	</body>
</html>