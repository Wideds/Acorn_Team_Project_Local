<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
        <jsp:param value="login" name="current"/>
    </jsp:include>
    <section>
    	<div style="padding-bottom:30%">
			<script>
				Swal.fire({
		      		title: "${id }님의 비밀번호가 수정되었습니다",
		      		text: "",
		      		icon: 'success',
		      		confirmButtonColor: 'rgb(13, 110, 253)',
		      		cancelButtonColor: 'rgb(248, 162, 146)',
		      		confirmButtonText: '다시 로그인 하기',
		      		cancelButtonText: '취소',
		   		}).then((result) => {
			      	if (result.isConfirmed) {
			      		location.href="${pageContext.request.contextPath}/users/loginform";
			      	}
			    })
			</script>
		</div>
    </section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>
