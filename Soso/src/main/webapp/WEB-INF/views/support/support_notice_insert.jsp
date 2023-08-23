<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support/support_notice_insert.jsp</title>
</head>
<body>
	<script>
		alert("공지사항이 등록 되었습니다.");
		location.href="${pageContext.request.contextPath}/support/support_notice";
	</script>
</body>
</html>