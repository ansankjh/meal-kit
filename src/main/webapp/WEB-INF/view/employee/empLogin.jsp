<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>�����α���</title>
	</head>
	<body>
		<h1>���� �α���</h1>
		<span class="text-danger">${msg}</span>
		<form action="${pageContext.request.contextPath}/empLogin" method="post">
			<table border="1">
				<tr>
					<td>���̵�</td>
					<td>
						<input type="text" name="employeeId">
					</td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td>
						<input type="password" name="employeePw">
					</td>
				</tr>
			</table>
			
			<div>
				<button type="submit">�α���</button>
			</div>
		</form>
	</body>
</html>