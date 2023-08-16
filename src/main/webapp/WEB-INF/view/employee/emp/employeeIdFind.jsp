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
				
				$('#newPw').blur(function() {
					// 새로운 비밀번호 조합 검사
					// 사용할 변수 지정
					// 변수 resetPw는 재설정할 비밀번호
					var resetPw = $('#newPw').val();
					// 숫자
					var num = resetPw.search(/[0-9]/g)
					// 영문
					var eng = resetPw.search(/[a-z]/ig);
					// 특수문자
					var special = resetPw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
					
					if(resetPw.length < 4 || resetPw.length > 10) {
						$('#resetMsg').text('비밀번호는 4~10자리로 입력해주세요.');
						return false;
					// 비밀번호 공백 검사
					} else if(resetPw.search(/\s/) != -1) {
						$('#resetMsg').text('비밀번호에 공백을 입력하지마세요.')
						return false;
					// 비밀번호 특수문자 입력x
					} else if(special > 0) {
						$('#resetMsg').text('비밀번호에 특수문자 입력불가입니다.');
						return false;
					// 비밀번호 숫자+문자조합
					} else if(num < 0 || eng < 0) {
						$('#resetMsg').text('영문, 숫자를 혼합하여 입력해주세요.');
						return false;
					} else {
						$('#resetMsg').text('');
						return true;
					}
				});
				
				// 엔터키로 이벤트 발생
				$(document).keydown(function(key) {
	                //키의 코드가 13번일 경우 (13번은 엔터키)
	                if(key.keyCode == 13) {
	                	// 비밀번호 재설정 확인 버튼 클릭 조건 새로주는것보단 이게 더 나을듯
	                    $('#resetBtn').click();
	                }
	            });
				
				$("#newPwCk").keydown(function(key) {
	                //키의 코드가 13번일 경우 (13번은 엔터키)
	                if(key.keyCode == 13) {
	                	// 비밀번호 재설정 확인 버튼 클릭 조건 새로주는것보단 이게 더 나을듯
	                    $('#resetBtn').click();
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
						$.ajax({
							url:'${pageContext.request.contextPath}/pwHistoryCk'
							, type:'get'
							, data : {id:$('#employeeId').val(), password:$('#newPw').val()} 
							, success:function(model){ // model : 'YES' / 'NO'
								if(model=='YES') {
									// YES를 반환받았으면 사용가능한 비밀번호이므로 resetForm 제출
									$('#resetForm').submit();
								} else if(model=='NO') {
									// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
									alert('사용불가능한 비밀번호입니다.');
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
								<input type="password" name="newPw" id="newPw">
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