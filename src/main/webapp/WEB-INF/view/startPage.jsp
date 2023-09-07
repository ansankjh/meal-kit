<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>startPage</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="assets/images/K.png" type="image/png" />
		<!--plugins-->
		<link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
		<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
		<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
		<link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-extended.css" rel="stylesheet" />
		<link href="assets/css/style.css" rel="stylesheet" />
		<link href="assets/css/icons.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		
		
		<!-- loader-->
		<link href="assets/css/pace.min.css" rel="stylesheet" />
		
		<!--Theme Styles-->
		<link href="assets/css/dark-theme.css" rel="stylesheet" />
		<link href="assets/css/light-theme.css" rel="stylesheet" />
		<link href="assets/css/semi-dark.css" rel="stylesheet" />
		<link href="assets/css/header-colors.css" rel="stylesheet" />
		<style>
			.po {
				position : relative;
				top : 150px;
			}
		</style>
	</head>
	<body>
		<div class="wrapper">
			<main class="">
				<div class="card bg-black text-center" style="color:white;font-size:40px">개인 프로젝트</div>
				<div class="row row-cols-10 row-cols-lg-10 g-4 po">
					<div class="col">
						<div class="card rounded-4">
							<div class="card-body">
								<div class="text-center">
								   <i class="bi bi-laptop-fill" style="font-size:130px"></i>
								</div>
								<div class="text-center">
									<a class="btn btn-primary radius-30" href="${pageContext.request.contextPath}/employeeLogin">관리자용 페이지</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card rounded-4">
							<div class="card-body">
								<div class="text-center">
								   <i class="bi bi-bag-check-fill" style="font-size:130px"></i>
								</div>
								<div class="text-center">
								    <a class="btn btn-primary radius-30" href="${pageContexr.request.contextPath}">쇼핑몰 페이지</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</body>
</html>