<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
	String id = (String)session.getAttribute("id");
%>
    <link rel="stylesheet" href="${path }/resources/css/reset.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/common.css" type="text/css">
    <script src="${path }/resources/js/jquery-1.12.0.min.js"></script>
    <script src="${path }/resources/js/jquery.easing.1.3.js"></script>
    <script src="${path }/resources/js/nav.js"></script>
<!-- mobile -->
    <div class="panel"> 
        <nav class="pGnb">
            <ul>
                <li>
                    <a href="#" class="mainNav">북메이트 찾기</a>
                    <ul class="subNav">
                        <li><a href="#">list1</a></li>
                        <li><a href="#">list2</a></li>
                        <li><a href="#">list3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="mainNav">ABOUT2</a>
                    <ul class="subNav">
                        <li><a href="#">list1</a></li>
                        <li><a href="#">list2</a></li>
                        <li><a href="#">list3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="mainNav">ABOUT3</a>
                    <ul class="subNav">
                        <li><a href="#">list1</a></li>
                        <li><a href="#">list2</a></li>
                        <li><a href="#">list3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="mainNav">ABOUT4</a>
                    <ul class="subNav">
                        <li><a href="#">list1</a></li>
                        <li><a href="#">list2</a></li>
                        <li><a href="#">list3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="mainNav">ABOUT5</a>
                    <ul class="subNav">
                        <li><a href="#">list1</a></li>
                        <li><a href="#">list2</a></li>
                        <li><a href="#">list3</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
    <header>
    <!-- pc -->
        <div class="inner-wrap">
            <h1><a href="${pageContext.request.contextPath}/" class="logo"><img src="${path }/resources/images/common/bookmate_logo_w_main.svg" alt="로고화이트"></a></h1>
            <nav class="gnb">
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/group/list?genre=-1" class="mainNav">북메이트 찾기</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/group_managing/user_main" class="mainNav">나의 북메이트</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/group_managing/admin_main" class="mainNav">북메이트 관리</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/support/support_main" class="mainNav">고객센터</a>
                    </li>
                </ul>
            </nav>
            <div class="member">
            	<c:choose>
            		<c:when test="${empty sessionScope.id }">
            			 <div class="memberWrap">
		                    <a href="${pageContext.request.contextPath}/users/loginform" >로그인</a>
		                    <a href="${pageContext.request.contextPath}/users/signup_form" >회원가입</a>
		                </div>
            		</c:when>
            		<c:otherwise>
            			 <div class="memberWrap">
		                    <a href="${pageContext.request.contextPath}/users/info" >마이 페이지</a>
		                    <a href="${pageContext.request.contextPath}/group/jjim_list">북마크</a>
		                    <a href="${pageContext.request.contextPath}/users/logout" >로그아웃</a>
		                </div>
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
    </header>