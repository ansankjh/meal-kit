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
				
				// 비밀번호 보이기/안보이기
				$('.newPwUnlock').click(function() {
					if(this.checked) {
						$('#newPw').attr('type', "text");
					} else {
						$('#newPw').attr('type', "password");
					}
				});
				
				// 새로운 비밀번호 조합 검사
				$('#newPw').keyup(function() {
					// 사용할 변수 지정
					// 변수 resetPw는 재설정할 비밀번호
					var resetPw = $('#newPw').val();
					// 숫자
					var num = resetPw.search(/[0-9]/g)
					// 영문
					var eng = resetPw.search(/[a-z]/ig);
					
					// 새 비밀번호 4자리 밑이면
					if(resetPw.length < 4) {
						$('#pwMsg').text('비밀번호는 4자리 이상이어야합니다.');
					// 새 비밀번호가 4자리 이상인데 영문+숫자 조합이 아닐때
					} else if(resetPw.length >= 4 && (num < 0 || eng < 0 || resetPw.search(/\s/) != -1)) {
						$('#pwMsg').text('비밀번호는 공백이 아닌 영문, 숫자만을 조합하여 입력해주세요.');
					} else {
						$('#pwMsg').text('사용가능한 비밀번호입니다.');
					}
				});
				
				// 비밀번호 유효성 검사
				$('#resetBtn').click(function() {
					// 새 비밀번호 빈칸
					if($('#newPw').val() == '') {
						$('#resetMsg').text('새 비밀번호를 입력해주세요.');
					// 비밀번호 확인 빈칸
					} else if($('#newPw').val() != '' && $('#newPwCk').val() == '') {
						$('#resetMsg').text('새 비밀번호를 한번 더 입력해주세요.');
					// 새 비밀번호와 비밀번호확인이 불일치
					} else if($('#newPw').val() != $('#newPwCk').val()) {
						$('#resetMsg').text('새비밀번호와 비밀번호확인이 일치하지 않습니다.');
						$('#newPwCk').val('');
					// 비밀번호 길이 지정
					} else {
						$.ajax({
							url:'${pageContext.request.contextPath}/pwHistoryCkByEmployee'
							, type:'get'
							, data : {id:$('#employeeId').val(), password:$('#newPw').val()} 
							, success:function(model){ // model : 'YES' / 'NO'
								if(model=='YES') {
									// YES를 반환받았으면 사용가능한 비밀번호이므로 resetForm 제출
									$('#resetForm').submit();
								} else if(model=='NO') {
									// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
									alert('사용불가능한 비밀번호입니다.');
									$('#newPw').val('');
									$('#newPwCk').val('');
									$('#pwMsg').text('');
								}
							}
						});
					}
				});
			});
		</script>
	</head>
	<body>
		<c:choose>
			<c:when test="${employeeId == null}">
				<h1>직원 계정찾기</h1>
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
				<h1>직원 비밀번호 재설정</h1>
				<form action="${pageContext.request.contextPath}/employeePwReset" method="post" id="resetForm">
					<table border="1">
						<tr>
							<td>아이디</td>
							<td>
								<input type="text" name="employeeId" value="${employeeId}" readonly="readonly" id="employeeId">
							</td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td>
								<input type="password" name="newPw" id="newPw"><span id="pwMsg"></span>
								<input type="checkbox" class="newPwUnlock">비밀번호 표시
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