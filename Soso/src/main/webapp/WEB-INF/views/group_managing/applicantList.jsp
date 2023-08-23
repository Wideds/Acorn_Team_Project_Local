<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북메이트 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing/group_managing_admin_header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing/group_managing_admin_applicant_card.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
        <jsp:param value="login" name="current"/>
    </jsp:include>
  <section>
  			<div class="admin_container">
		<div id="admin_header">
			<div class="title">Applicant</div>
		</div>
		<div id="menus">
			<div><a href="${pageContext.request.contextPath}/group_managing/applicantList?group_num=${group_num}">신청 중</a></div>
			<div><a href="${pageContext.request.contextPath}/group_managing/rejectedApplicantList?group_num=${group_num}">거절</a></div>
		</div>
		<div class="wrapper">
			<c:forEach var="tmp" items="${list}">
				<div id="card">
					<div class="card-box">
						<div class="card-left">
							<div><img class="card-image" src="${pageContext.request.contextPath}${tmp.profile}"/></div>
						</div>
						<div class="card-right">
							<div id="card-title">${tmp.user_id}</div>
							<div id="card-date">가입 신청일 : ${tmp.request_dt}</div>
							<div id="card-link"><a href="${pageContext.request.contextPath}/cafe/list">회원 정보 보기</a></div>
							<div id="card-buttons">
								<div><a href="${pageContext.request.contextPath}/group_managing/joinApprove?num=${tmp.num}&group_num=${group_num}">가입 승인</a></div>
								<div class="card-alert-button${tmp.num}"><a href="#">가입 거절</a></div>
							</div>
						</div>
						<script>
							$(".card-alert-button${tmp.num}").css("cursor", "auto").click(()=>{
								Swal.fire({
						      		title: `${tmp.user_id}님의 가입을 거절하시겠습니까?`,
						      		text: "가입을 거절하더라도 나중에 다시 승인할 수 있습니다",
						      		icon: 'info',
						      		showCancelButton: true,
						      		confirmButtonColor: 'rgb(13, 110, 253)',
						      		cancelButtonColor: 'rgb(108, 117, 125)',
						      		confirmButtonText: '확인',
						      		cancelButtonText: '취소',
					    		}).then((result) => {
							      	if (result.isConfirmed) {
								        location.href="${pageContext.request.contextPath}/group_managing/reject?num=${tmp.num}&group_num=${group_num}"
							      	}
							    })
							})
						</script>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
  </section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>