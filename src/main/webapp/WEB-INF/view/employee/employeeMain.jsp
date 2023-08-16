<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeMain</title>
	</head>
	<body>
		<h1>직원 메인페이지</h1>
		<!-- 직원관리emp? employee?, 고객관리 customer, 상품관리 goods, 주문관리 order, 문의관리 question, 공지관리 notice, 리뷰관리 reivew -->
		
		<!-- 직원관리 -->
		<a href="${pageContext.request.contextPath}/employee/employeeList">직원목록</a>
		<a href="${pageContext.request.contextPath}/employee/addEmployee">직원등록</a>
		
		<!-- 고객관리 -->
		<a href="${pageContext.request.contextPath}/employee/customerList">고객목록</a>
		
		<!-- 상품관리 -->
		<a href="${pageContext.request.contextPath}/employee/addGoods">상품등록</a>
		<a href="${pageContext.request.contextPath}/employee/goodsList">상품목록</a>
		
		<!-- 주문관리 -->
		<a href="${pageContext.request.contextPath}/employee/orderList">주문목록</a>
		
		<!-- 문의관리 -->
		<a href="${pageContext.request.contextPath}/employee/questionList">문의목록</a>
		<!-- 실시간문의(1:1) -->
		<a href="${pageContext.request.contextPath}/employee/faqList">FAQ</a>
		
		<!-- 리뷰관리 -->
		<a href="${pageContext.request.contextPath}/employee/reviewList">리뷰목록</a>
		
		<!--  -->
		${loginEmployee.employeeId}<span><a href="${pageContext.request.contextPath}/employee/employeeLogout">로그아웃</a></span>
	</body>
</html>