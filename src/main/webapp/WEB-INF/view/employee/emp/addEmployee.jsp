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
				// 중복확인 버튼을 누르면 ajax요청
				$('#ckBtn').click(function() {
					$.ajax({
						url:'${pageContext.request.contextPath}/totalIdCk'
						, type:'get'
						, data : {id:$('#employeeId').val()} 
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// YES를 반환받았으면 사용가능한 비밀번호이므로 resetForm 제출
								alert('사용가능한 아이디입니다.');
							} else if(model=='NO') {
								// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
								alert('사용불가능한 아이디입니다.');
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
		<form action="${pageContext.request.contextPath}/employee/addEmployee" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="employeeId" id="employeeId">
						<button type="button" id="ckBtn">중복확인</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>