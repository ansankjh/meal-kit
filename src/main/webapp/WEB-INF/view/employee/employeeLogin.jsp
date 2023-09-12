<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeLogin</title>
		<!-- jquery CDN -->
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function() {
				// 비밀번호 보이기/숨기기
				$('.pwUnlock').click(function() {
					if(this.checked) {
						$('#employeePw').attr('type', "text");
					} else {
						$('#employeePw').attr('type', "password");
					}
				});
				
				// 엔터키로 이벤트 발생
				$(document).keydown(function(key) {
	                //키의 코드가 13번일 경우 (13번은 엔터키)
	                if (key.keyCode == 13) {
	                	// 비밀번호 재설정 확인 버튼 클릭 조건 새로주는것보단 이게 더 나을듯
	                    $('#btn').click();
	                }
	            });
				
				// 빈칸 유효성 검사
				$('#btn').click(function() {
					// 아이디 빈칸 유효성 검사
					if($('#employeeId').val() == '') {
						$('#loginMsg').text('아이디를 입력해주세요.');
					// 비밀번호 유효성 검사
					} else if($('#employeeId').val() != '' && $('#employeePw').val() == '') {
						$('#loginMsg').text('비밀번호를 입력해주세요.');
					// 다 입력됐으면 제출
					} else if($('#employeeId').val() != '' && $('#employeePw').val() != '') {
						$('#loginForm').submit();	
					}
				});
			});
			
			// 새로고침시 get 파라미터 제거
			$(document).keydown(function(e){
				key = (e)?e.keyCode:event.keyCode;
				//alert(key);
				if(key == 116 || (event.ctrlKey && event.keyCode == 82)) {
					history.replaceState({}, null, location.pathname);
				}
			})
		</script>
	</head>
	<body>
		<h1>직원 로그인</h1>
		<div>
			<form action="${pageContext.request.contextPath}/employeeLogin" method="post" id="loginForm">
				<!-- 로그인정보 입력 -->
				<table border="1">
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="employeeId" id="employeeId" value="admin">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="employeePw" id="employeePw">
							<div>
								<input type="checkbox" class="pwUnlock">비밀번호 표시
							</div>
						</td>
					</tr>
				</table>
				<!-- 로그인 버튼 -->
				<div>
					<span id="loginMsg"></span>${errorMsg}
				</div>
				<div>
					<button type="button" id="btn">로그인</button>
				</div>
			</form>
		</div>
		<!-- 계정찾기 -->
		<div>
			<a href="${pageContext.request.contextPath}/employeeIdFind">계정찾기</a>
			<a href="${pageContext.request.contextPath}/startPage">처음으로</a>
		</div>
	</body>
</html>