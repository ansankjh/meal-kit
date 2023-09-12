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
					
					// employeeId에 찾는 문자열(idCk)이 들어있는지 아닌지 체크 또는 숫자로만 이루어져있다면
					if(employeeId == '') {
						$('#idMsg').text('아이디: 필수정보입니다.');
					} else if(idCk.test(employeeId) == false || Number(employeeId)) {
						// console.log(idCk.test(employeeId));
						$('#idMsg').text('아이디: 5~20글자 영문 소문자, 숫자만 사용가능합니다.');
					// 아이디를 숫자만 입력했을 경우
					} else {
						$('#idMsg').text('');
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
									// console.log(model);
									$('#idMsg').text('')
								} else if(model=='NO') {
									// NO를 반환받았으면 사용불가능한 비밀번호이므로 사용불가능한 비밀번호 메시지 출력
									// console.log(model);
									$('#idMsg').text('아이디: 사용할 수 없는 아이디입니다. 다른 아이디를 입력해주세요.')
								}
							}
						});
					}
				});
				
				// 비밀번호 조합 검사 영어 소문자+숫자 조합
				$('#employeePw').blur(function() {
					// 비밀번호
					var pw = $('#employeePw').val();
					// 비밀번호는 4~10자의 영문 소문자+숫자 조합
					var pwCk = /^(?=.*?[a-z0-9]).{4,10}$/;
					
					// 비밀번호 미입력시
					if(pw == '') {
						$('#pwMsg').text('비밀번호: 필수정보입니다.');
					// 비밀번호가 4~10자리가 아니고, 영문(소문자)을 포함하지 않으면
					} else if(pwCk.test(pw) == false || Number(pw)) {
						$('#pwMsg').text('비밀번호: 4~10자의 영문(소문자) 또는 영문+숫자 사용해주세요.');
					// 위 조건에 부합하면 pwMsg는 공백으로 만들고 id칸이 공백이면 ckMsg출력
					} else {
						$('#pwMsg').text('');
						if($('#employeeId').val() == '') {
							$('#idMsg').text('아이디: 필수정보입니다.');
						}
					}
				});
				
				// 이름 유효성검사
				$('#employeeName').blur(function() {
					// 이름
					var name = $('#employeeName').val();
					// 한글, 영문(대/소문자)사용 공백불가
					var nameCk = /^[가-힣|a-z|A-Z|\*]+$/;
					// 이름공백 검사
					if(name == '') {
						$('#nameMsg').text('이름: 필수정보입니다.');
					} else if(nameCk.test(name) == false) {
						// console.log(nameCk.test(name));
						$('#nameMsg').text('이름: 한글, 영문 대/소문자를 사용해 주세요.');
					} else {
						$('#nameMsg').text('');
					}
				});
				
				// 휴대전화 유효성검사
				$('#employeePhone').blur(function() {
					// 연락처
					var phone = $('#employeePhone').val();
					// 숫자
					var phoneCk = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{4}))(\d{4})$/;
					// 휴대전화 공백검사
					if(phone == '') {
						$('#phoneMsg').text('휴대전화: 필수정보입니다.');
					} else if(phoneCk.test(phone) == false) {
						$('#phoneMsg').text('휴대전화: 연락처가 정확한지 확인해주세요.');
					} else if(phoneCk.test(phone) == true) {
						// console.log(phone.substring(0,1));
						// console.log(phone.substring(3,7));
						// console.log(phone.substring(0,3));
						$('#employeePhone').val(phone.substring(0,3) + "-" 
													+ phone.substring(3,7) + "-"
													+ phone.substring(7,11));
						$('#phoneMsg').text('');
					}
				});
				
				// 이메일 유효성 검사
				$('#employeeEmail').blur(function() {
					// 이메일
					var email = $('#employeeEmail').val();
					// 이메일 조건
					var emailCk = /^[A-Za-z0-9_\.\-]+@gmail.com+/;
					
					if($('#employeeEmail').val() == '') {
						$('#emailMsg').text('이메일: 필수정보입니다.')
					} else if(emailCk.test(email) == false) {
						$('#emailMsg').text('이메일: 이메일 주소가 정확한지 확인해 주세요.')
					} else if(emailCk.test(email) == true) {
						$('#emailMsg').text('');
					}
				});
				
				// 이메일 인증번호 보내기
				$('#sendBtn').click(function() {
					$("#mail_number").css("display","block");
					$.ajax({
					    url:"${pageContext.request.contextPath}/mail",
					    type:"post",
					    dataType:"json",
					    data:{"mail" : $("#employeeEmail").val()},
					    success: function(data){
					        alert("인증번호 발송");
					        // confirm의 값을 ajax 통신이 성공 했을 경우 받아온 data로 지정
					        $("#confirm").attr("value",data);
					        console.log($('#confirm').val());
					    }
					});
				});
				
				// 인증번호 체크
				$('#confirmBtn').click(function() {
					var number1 = $("#number").val();
					var number2 = $("#confirm").val();
					
					if(number1 == number2) {
						alert('인증완료');
						$('#emailCk').attr("value", "인증완료");
						// console.log($('#emailCk').val());
					} else {
						alert('인증번호를 확인해주세요.');
						$('#emailCk').attr("value", "인증실패");
						// console.log($('#emailCk').val());
					}
				});
				
				// 직원등록버튼
				$('#addBtn').click(function() {
					// 아이디
					var id = $('#employeeId').val();
					// 비밀번호
					var pw = $('#employeePw').val();
					// 이름
					var name = $('#employeeName').val();
					// 전화번호
					var phone = $('#employeePhone').val();
					// 이메일
					var email = $('#employeeEmail').val();
					
					if(id == '' || pw == '' || name == '' || phone == '' || email == '') {
						alert('정보를 모두 입력해주세요');
					} else {
						if($('#emailCk').val() == "인증완료") {
							alert('등록완료');
						} else {
							alert('등록실패');
						}
					}
					
				});
			});
		</script>
	</head>
	<body>
		<!-- 직원등록 폼 -->
		<h1>직원등록</h1>
		<div>
			<form action="${pageContext.request.contextPath}/employee/emp/addEmployee" method="post" id="addForm">
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
						<td>휴대전화번호</td>
						<td>
							<input type="text" name="employeePhone" id="employeePhone">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<!-- 인증번호 받을 이메일 입력 -->
							<div id="mail_input" name="mail_input">
								<input type="text" name="employeeEmail" id="employeeEmail" placeholder="abc@gmail.com">
								<button type="button" id="sendBtn" name="sendBtn">인증번호</button>
							</div>
							<br>
							<!-- 인증번호 발송하면 생기는 인증번호 입력칸 -->
							<div id="mail_number" name="mail_number" style="display: none">
								<input type="text" name="number" id="number" placeholder="인증번호 입력">
								<button type="button" name="confirmBtn" id="confirmBtn">확인</button>
							</div>
							<br>
							<!-- 확인버튼누르면 -->
							<input type="text" id="confirm" name="confirm" style="display: none" value="">
							<input type="text" id="emailCk" name="emailCk" style="display: none" value="">
						</td>
					</tr>
				</table>
				<div>
					<button type="button" id="addBtn">직원등록</button>
				</div>
				<div><span id="idMsg" class="errorText"></span></div>
				<div><span id="pwMsg" class="errorText"></span></div>
				<div><span id="nameMsg" class="errorText"></span></div>
				<div><span id="phoneMsg" class="errorText"></span></div>
				<div><span id="emailMsg" class="errorText"></span></div>
			</form>
		</div>
	</body>
</html>