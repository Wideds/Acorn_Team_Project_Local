<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-12 text-center mt-3">
	    <button class="btn btn-block waves-effect waves-light btn-rounded btn-outline-info mb-3">로그인하기</button>
	    <img alt="카카오로그인" src="${pageContext.request.contextPath}/resources/static/images/kakao_login_medium_narrow.png" onclick="loginWithKakao()">
	</div>

<!-- 카카오 로그인 -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('103109f8f91a61b0d9f8bd1c0e52b009');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:9000/kakao_login' 
        }); // 등록한 리다이렉트uri 입력
    }
</script>
</body>
</html>