<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			// 보낼 msg
		    var msg = "<c:out value='${msg}'/>";
		    // alert창 띄우고 이동할 페이지
		    var url = "<c:out value='${url}'/>";
		    alert(msg);
		    location.href = url;
		</script>
	</head>
	<body>
		
	</body>
</html>