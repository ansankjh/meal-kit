<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empLogin</title>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#btn').click(function() {
					if($('#empId').val() == '') {
						$('#loginMsg').text('아이디를 입력해주세요.');
					} else if($('#empId').val() != '' && $('#empPw').val() == '') {
						$('#loginMsg').text('비밀번호를 입력해주세요.');
					} else if($('#empId').val() != '' && $('#empPw').val() != '') {
						$('#loginForm').submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<h1>직원 로그인</h1>
		<span class="text-danger">${msg}</span>
		<span id="loginMsg"></span>
		<form action="${pageContext.request.contextPath}/empLogin" method="post" id="loginForm">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="employeeId" id="empId">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="employeePw" id="empPw">
					</td>
				</tr>
			</table>
			
			<div>
				<button type="button" id="btn">로그인</button>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/empIdFind">계정찾기</a>
			</div>
			<a href="${pageContext.request.contextPath}/start">첫화면</a>
		</form>
	</body>
</html>