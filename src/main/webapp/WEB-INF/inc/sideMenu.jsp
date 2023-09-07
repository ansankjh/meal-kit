<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--start sidebar -->
        <aside class="sidebar-wrapper" data-simplebar="true">
          <div class="sidebar-header">
	            <div>
	              <img src="/shop/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
	            </div>
	            <a href="${pageContext.request.contextPath}/employee/emp/main">
	              <h4 class="logo-text">Snacked</h4>
	            </a>
	            <div class="toggle-icon ms-auto"> <i class="bi bi-list"></i>
	            </div>
          </div>
          <!--navigation-->
          <ul class="metismenu" id="menu">
            <li class="menu-label">Pages</li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-person-fill"></i>
                </div>
                <div class="menu-title">직원</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/emp/employeeList"><i class="bi bi-circle"></i>직원목록</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/emp/addEmployee"><i class="bi bi-circle"></i>직원등록</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi fadeIn animated bx bx-buildings"></i>
                </div>
                <div class="menu-title">고객</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/customer/customerList"><i class="bi bi-circle"></i>고객목록</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow employee" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-file-person-fill"></i>
                </div>
                <div class="menu-title">상품</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/goods/addGoods"><i class="bi bi-circle"></i>상품등록</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/goods/goodsList"><i class="bi bi-circle"></i>상품목록</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-truck"></i>
                </div>
                <div class="menu-title">주문</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/order/orderList"><i class="bi bi-circle"></i>주문목록</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow report" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-question-circle-fill"></i>
                </div>
                <div class="menu-title">문의</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/question/chat"><i class="bi bi-circle"></i>1:1 채팅(고객)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/question/questionList"><i class="bi bi-circle"></i>문의목록</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/question/faqList"><i class="bi bi-circle"></i>FAQ</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow report" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-exclamation-triangle-fill"></i>
                </div>
                <div class="menu-title">리뷰</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/review/reviewList"><i class="bi bi-circle"></i>리뷰목록</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow notice" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-megaphone-fill"></i>
                </div>
                <div class="menu-title">공지사항</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=쇼핑"><i class="bi bi-circle"></i>공지사항(쇼핑)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=예약"><i class="bi bi-circle"></i>공지사항(예약)</a></li>
              </ul>
            </li>
          </ul>
          <!--end navigation-->
       </aside>
       <!--end sidebar -->