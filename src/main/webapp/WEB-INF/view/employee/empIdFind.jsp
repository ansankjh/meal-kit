<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empIdFind</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#btn').click(function() {
					// 빈칸 유효성검사
					if($('#empName').val() == '' || $('#empEmail').val() == '') {
						alert('정보를 모두 입력해주세요.');
					} else {
						$('#empForm').submit();
						
					}
				});
			});
		</script>
	</head>
	<body>
		<h1>계정찾기</h1>
		<c:choose>
			<c:when test="${employeeId == null}">
				${msg}
				<span id="msg"></span>
				<div>
					<!-- 계정찾기 -->
					<form action="${pageContext.request.contextPath}/empIdFind" method="post" id="empForm">
						<table border="1">
							<tr>
								<td>이름</td>
								<td>
									<input type="text" name="employeeName" id="empName">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="employeeEmail" id="empEmail">
								</td>
							</tr>
						</table>
						<div>
							<button type="button" id="btn">확인</button>
						</div>
					</form>
				</div>	
			</c:when>
			<c:when test="${employeeId != null}">
				<div>
					<!-- 계정찾으면 비밀번호 재설정까지 -->
					<form>
						<table border="1">
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" name="employeeId" value="${employeeId}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td>
									<input type="password" name="newPw">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</c:when>
		</c:choose>
	</body>
</html>