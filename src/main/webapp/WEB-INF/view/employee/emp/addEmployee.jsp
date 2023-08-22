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
				// 아이디 중복검사
				$('#employeeId').blur(function() {
					// 사용할 아이디
					var employeeId = $('#employeeId').val();
					// 영어 소문자
					var eng = employeeId.search(/[a-z]/ig);
					// 영어 대문자
					var engBig = employeeId.search(/[A-Z]/g);
					// 한글
					var han = employeeId.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/g);
					// 숫자
					var num = employeeId.search(/[0-9]/g);
					// 특수문자
					var special = employeeId.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
					
					// 아이디가 입력이 안되어 있을때
					if($('#employeeId').val() == '') {
						$('#ckMsg').text('아이디는 필수정보입니다.');
						$('#ckMsg').addClass('errorText');
					// 아이디에 특수문자가 포함되어있거나 숫자만 포함이고 영문을 포함하지 않는다면 사용불가 공백, 영어 대문자, 한글 입력 또한 불가 
					} else if(special >= 0 || (num >= 0 && eng < 0) || employeeId.search(/\s/) != -1 || engBig >= 0 || han >= 0) {
						$('#ckMsg').text('아이디는 공백을 제외한 영문 소문자 또는 영문+숫자 조합으로 사용가능합니다');
						$('#ckMsg').addClass('errorText');
						$('#employeeId').addClass('errorText');
					// 아이디에 특수문자가 포함되어있지 않고 문자만 or 문자+숫자
					} else if(special < 0 && eng >= 0) {
						$('#ckMsg').text('');
						$('#ckMsg').removeClass('errorText');
						$('#employeeId').removeClass('errorText');
					}
				});
				
				// employeeId가 빈칸이 아니고 유효성검사가 통과 됐다면 ajax통신으로 중복검사 실행
				$('#employeeId').blur(function() {
					if($('#employeeId').val() != '' && $('#ckMsg').text() == '') {
						$.ajax({
							url:'${pageContext.request.contextPath}/totalIdCkByEmployee'
							, type:'get'
							, data : {id:$('#employeeId').val()} 
							, success:function(model){ // model : 'YES' / 'NO'
								if(model=='YES') {
									// YES를 반환받았으면 사용가능한 비밀번호이므로 resetForm 제출
									console.log(model);
									$('#ckMsg').text('')
								} else if(model=='NO') {
									// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
									console.log(model);
									$('#ckMsg').text('사용할 수 없는 아이디입니다. 다른 아이디를 입력해주세요.')
									$('#ckMsg').addClass('errorText');
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
					
					if($('#employeePw').val() == '') {
						$('#pwMsg').text('비밀번호는 필수정보입니다.');
					// 비밀번호가 8~16자리, 영어소문자
					} else if(pwCk.test(pw) == false || /^[0-9]+$/.test(pw)) {
						$('#pwMsg').text('비밀번호는 8~16자의 영문 소문자');
						$('#pwMsg').addClass('errorText')
					} else {
						$('#pwMsg').text('사용가능');
						$('#pwMsg').text('');
						if($('#employeeId').val() == '') {
							$('#ckMsg').text('아이디는 필수정보입니다.');
						}
					}
					
				});
			});
		</script>
	</head>
	<body>
		<h1>직원등록</h1>
		<!-- 직원등록 폼 -->
		<div><span id="ckMsg"></span></div>
		<div><span id="pwMsg"></span></div>
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
			</form>
		</div>
	</body>
</html>