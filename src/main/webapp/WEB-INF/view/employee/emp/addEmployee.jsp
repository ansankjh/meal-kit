<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmployee</title>
		<script src="https://code.jquery.com/jquery-latest.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#ckBtn').click(function() {
					$.ajax({
						url:'${pageContext.request.contextPath}/totalIdCkByEmployee'
						, type:'get'
						, data : {id:$('#employeeId').val()} 
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// YES를 반환받았으면 사용가능한 비밀번호이므로 resetForm 제출
								alert('사용 가능한 아이디입니다.');
							} else if(model=='NO') {
								// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
								alert('사용 불가능한 아이디입니다.');
								$('#employeeId').val('');
							}
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<h1>직원등록</h1>
		<!-- 직원등록 폼 -->
		<div>
			<form action="${pageContext.request.contextPath}/employee/addEmployee" method="post" id="addForm">
				<table border="1">
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="employeeId" id="employeeId">
							<span><button type="button" id="ckBtn">중복확인</button></span>
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
							<input type="text" name="employeeNmae" id="employeeName">
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