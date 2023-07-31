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
				// 계정찾기 버튼 클릭시 이벤트
				$('#btn').click(function() {
					// 빈칸 유효성검사
					if($('#empName').val() == '' || $('#empEmail').val() == '') {
						alert('정보를 모두 입력해주세요.');
					} else {
						$('#empForm').submit();
						
					}
				});
				// 비밀번호 재설정 버튼 클릭시 이벤트
				$('#pwBtn').click(function() {
					// pw_history를 찾은 id와 새로변경할 비밀번호로 조회하여 찾아지면 변경이력에 있는 비밀번호 이므로 no를 반환하여 비밀번호 변경불가
					// 찾아지지 않으면 yes를 반환하여 pwForm을 submit하여 비밀번호 재설정(비밀번호 이력은 3개까지만 남김)
					// 
					$.ajax({
						url:'${pageContext.request.contextPath}/pwHistoryCk'
						, type:'get'
						, data : {id:$('#id').val(), password:$('#newPw').val()} 
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 비밀번호
								$('#pwForm').submit();
							// pw_history에 있는 비밀번호이거나 입력한 두개의 비번이 일치하지 않으면
							} else if(model=='NO' || $('#newPw').val() != $('#newPw2').val()) {
								// pw_history에 있는 비밀번호
								alert('사용불가능한 비밀번호입니다.');
							}
						}
					});
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
									<input type="text" name="employeeName" id="empName" value="강지훈">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td>
									<input type="text" name="employeeEmail" id="empEmail" value="shop@naver.com">
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
					<span id="pwMsg"></span>
					<form action="${pageContext.request.contextPath}/modifyEmployeePwByFind" method="post" id="pwForm">
						<table border="1">
							<tr>
								<td>아이디</td>
								<td>
									<input type="text" name="id" value="${employeeId}" readonly="readonly" id="id">
								</td>
							</tr>
							<tr>
								<td>비밀번호 재설정</td>
								<td>
									<input type="password" name="newPw" id="newPw">
								</td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td>
									<input type="password" id="newPw2">
								</td>
							</tr>
						</table>
						<div>
							<button type="button" id="pwBtn">수정</button>
						</div>
					</form>
				</div>
			</c:when>
		</c:choose>
	</body>
</html>