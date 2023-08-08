<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 만든 소모임</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing_admin_header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing_admin_main_card.css">
</head>
<body>
	<div class="container">
		<div id="header">
			<div class="title">내 소모임 관리하기</div>
			<div class="linkBox">
				<a class="link" href="${pageContext.request.contextPath}/group_managing/group_insertForm">개설하기</a>
			</div>
		</div>
		<div id="menus">
			<div><a href="#">진행 중</a></div>
			<div><a href="#">종료</a></div>
		</div>
		<div class="wrapper">
			<div id="card">
				<div>
					<div id="likedNumber">
						<div>❤ 123</div>
					</div>
					<div class="card-box">
						<div class="card-left">
							<div><img class="card-image" src="https://plus.unsplash.com/premium_photo-1667251758255-514ef43844fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=400&q=60"/></div>
							<div><a href="${pageContext.request.contextPath}/group_managing/memberList">10 / 40</a></div>
						</div>
						<div class="card-right">
							<div id="card-title">소모임 명</div>
							<div id="card-date">DATE: 2023-07-28</div>
							<div id="card-rate">⭐⭐⭐⭐</div>
							<div id="card-link"><a href="${pageContext.request.contextPath}/cafe/list">게시판 가기</a></div>
							<div id="card-buttons">
								<div><a href="${pageContext.request.contextPath}/group_managing/group_updateForm">정보 수정</a></div>
								<div><a href="${pageContext.request.contextPath}/group_managing/applicantList">가입 관리</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>