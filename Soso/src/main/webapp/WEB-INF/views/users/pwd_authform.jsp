<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
        <jsp:param value="pwd_update" name="current"/>
    </jsp:include>
    <div class="container">
    	<p class="title">비밀번호 확인</p>
        <form action="${pageContext.request.contextPath}/users/pwd_auth" method="post">
            <c:choose>
                <%-- 홈 화면에서 로그인 할 경우 파라미터 값으로 url이 주어지지 않음 --%>
                <c:when test="${ empty param.url }">
                    <input type="hidden" name="url" value="${pageContext.request.contextPath}/" />
                </c:when>
                <%-- 그외는 Interceptor를 거치기 때문에 url이 주어짐 --%>
                <c:otherwise>
                    <input type="hidden" name="url" value="${param.url }" />
                </c:otherwise>
            </c:choose>
            
            <div>
                <label class="form-label" for="pwd">비밀 번호 입력</label>
                <input class="form-control" type="password" name="pwd" id="pwd"/>
            </div>
            <button class="btn btn-primary" type="submit">확인</button>
            <button class="btn btn-secondary" type="reset">리셋</button>
        </form>
    </div>
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    
</body>
</html>


