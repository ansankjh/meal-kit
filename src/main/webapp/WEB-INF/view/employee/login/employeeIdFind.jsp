<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeIdFind</title>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function() {
				// 빈칸 유효성 검사
				$('#btn').click(function() {
					// 아이디 빈칸 유효성 검사
					if($('#employeeName').val() == '') {
						$('#findMsg').text('이름을 입력해주세요.');
					// 비밀번호 유효성 검사
					} else if($('#employeeName').val() != '' && $('#employeeEmail').val() == '') {
						$('#findMsg').text('이메일을 입력해주세요.');
					// 다 입력됐으면 제출
					} else if($('#employeeName').val() != '' && $('#employeeEmail').val() != '') {
						$('#findForm').submit();	
					}
				});
				
				$('#resetBtn').click(function() {
					// 빈칸 유효성 검사
					if($('#newPw').val() == '') {
						$('#resetMsg').text('재설정할 비밀번호를 입력해주세요.');
					} else if($('#newPw').val() != '' && $('#newPwCk').val() == '') {
						$('#resetMsg').text('재설정할 비밀번호를 한번 더 입력해주세요.');
					} else if($('#newPw').val() != $('#newPwCk').val()) {
						$('#resetMsg').text('비밀번호가 일치하지 않습니다.');
					} else {
						$('#resetForm').submit();
					}
				});
			});
		</script>
	</head>
	<body>
		<h1>직원 계정찾기</h1>
		<c:choose>
			<c:when test="${employeeId == null}">
				<div>
					<form action="${pageContext.request.contextPath}/employeeIdFind" method="post" id="findForm">
						<!-- 직원 이름, 이메일 입력 -->
						<table border="1">
							<tr>
								<td>이름</td>
								<td>
									<input type="text" name="employeeName" id="employeeName" value="사장">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="employeeEmail" id="employeeEmail" value="shop@naver.com">
								</td>
							</tr>
						</table>
						<!-- 찾기 버튼 -->
						<div>
							<span id="findMsg"></span>${errorMsg}
						</div>
						<div>
							<button type="button" id="btn">계정찾기</button>
						</div>
					</form>
				</div>
			</c:when>
			<c:when test="${employeeId != null}">
					<form action="${pageContext.request.contextPath}/employeePwReset" method="post" id="resetForm">
						<table border="1">
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" name="employeeId" value="${employeeId}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>새 비밀번호</td>
								<td>
									<input type="password" name="newPw" id="newPw">
								</td>
							</tr>
							<tr>
								<td>새 비밀번호확인</td>
								<td>
									<input type="password" id="newPwCk">
								</td>
							</tr>
						</table>
						<!-- 유효성 검사 메시지 출력 -->
						<div>
							<span id="resetMsg"></span>
						</div>
						<!-- 변경 버튼 -->
						<div>
							<button type="button" id="resetBtn">재설정</button>
							<a href="${pageContext.request.contextPath}/employeeLogin">로그인하러가기</a>
						</div>
					</form>
				
			</c:when>
		</c:choose>
	</body>
</html>