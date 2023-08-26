<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmployee</title>
		<style>
			.error {
				border: 2px solid red; /* 빨간색 테두리 설정 */
				color : red;
    			outline: none;
			}
			
			.errorText {
				color : red;
			}
		</style>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function() {
				// 아이디 중복검사 5~20글자 영문 소문자, 숫자만 사용가능합니다.
				$('#employeeId').blur(function() {
					// 사용할 아이디
					var employeeId = $('#employeeId').val();
					// 5~20글자 영문 소문자, 숫자 (?!^[0-9]*$) <-- 숫자로만 이루어져 있을시엔 허용x 
					var idCk = /^[A-Za-z0-9_\-]{5,20}$/;
					// 숫자
					var num = /[^0-9]$/;
					
					// .test() <- 찾는 문자열이 들어있는지 아닌지 체크 
					if(idCk.test(employeeId) == false) {
						console.log(idCk.test(employeeId));
						$('#idMsg').text('아이디는 5~20글자 영문 소문자, 숫자만 사용가능합니다.');
					}
				});
				
				// employeeId가 빈칸이 아니고 유효성검사가 통과 됐다면 ajax통신으로 중복검사 실행
				$('#employeeId').blur(function() {
					if($('#employeeId').val() != '' && $('#idMsg').text() == '') {
						$.ajax({
							url:'${pageContext.request.contextPath}/totalIdCkByEmployee'
							, type:'get'
							, data : {id:$('#employeeId').val()} 
							, success:function(model){ // model : 'YES' / 'NO'
								if(model=='YES') {
									// YES를 반환받았으면 사용가능한 비밀번호이므로 resetForm 제출
									console.log(model);
									$('#idMsg').text('')
								} else if(model=='NO') {
									// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
									console.log(model);
									$('#idMsg').text('사용할 수 없는 아이디입니다. 다른 아이디를 입력해주세요.')
								}
							}
						});
					}
				});
				
				// 비밀번호 조합 검사 영어 소문자+숫자 조합
				$('#employeePw').blur(function() {
					// 비밀번호
					var pw = $('#employeePw').val();
					// 비밀번호는 8~16자의 영문 소문자+숫자 조합
					var pwCk = /^(?=.*?[a-z]).{8,16}$/;
					
					// 비밀번호 미입력시
					if(pw == '') {
						$('#pwMsg').text('비밀번호는 필수정보입니다.');
					// 비밀번호가 8~16자리가 아니고, 영문(소문자)을 포함하지 않으면
					} else if(pwCk.test(pw) == false) {
						$('#pwMsg').text('비밀번호는 8~16자의 영문(소문자) 또는 영문+숫자 사용해주세요.');
					// 위 조건에 부합하면 pwMsg는 공백으로 만들고 id칸이 공백이면 ckMsg출력
					} else {
						$('#pwMsg').text('');
						if($('#employeeId').val() == '') {
							$('#idMsg').text('아이디는 필수정보입니다.');
						}
					}
				});
				
				// 이름 유효성검사
				$('#employeeName').blur(function() {
					// 이름
					var name = $('#employeeName').val();
					// 한글, 영문(대/소문자)사용 공백불가
						
					// 이름공백 검사
					if(name == '') {
						$('#nameMsg').text('이름은 필수정보입니다.');
					}
				});
			});
		</script>
	</head>
	<body>
		<h1>직원등록</h1>
		<!-- 직원등록 폼 -->
		<div>
			<form action="${pageContext.request.contextPath}/employee/addEmployee" method="post" id="addForm">
				<input type="hidden" name="employeeLevel" value="직원">
				<input type="hidden" name="employeeState" value="활성화">
				<input type="hidden" name="totalIdKind" value="관리자">
				<table border="1">
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="employeeId" id="employeeId">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="employeePw" id="employeePw">
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="employeeName" id="employeeName">
						</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>
							<input type="text" name="employeePhone" id="employeePhone">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="email" name="employeeEmail" id="employeeEmail">
						</td>
					</tr>
				</table>
				<div>
					<button type="button" id="addBtn">직원등록</button>
				</div>
				<div><span id="idMsg" class="errorText"></span></div>
				<div><span id="pwMsg" class="errorText"></span></div>
				<div><span id="nameMsg" class="errorText"></span></div>
			</form>
		</div>
	</body>
</html>