<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_main</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
    <main id="main-banner" class="main-banner-06">
        <div class="inner-wrap">
            <div class="title">
                <h2>고객센터</h2>
                <p>
			                    서비스 이용 중 불편 했던 점이나 궁금한 점을 <br />
			                    빠르고 친절하게 안내해 드리겠습니다.
                </p>
            </div>
            <div class="indicator">
                <div class="home circle">
                    <a href="#" title="메인페이지가기"><img src="${path }/resources/images/sub/icon_home.svg" alt="홈버튼이미지"></a>
                </div>
                <div class="main-menu circle">BOOKMATE</div>

            </div>
        </div>
    </main>

	<!-- 메인 메뉴바 시작 -->
	<ul class="menu_bar">
		<li class="menu_home">
			<a class="nav-link active" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="menu_faq">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_faq">자주하는 질문</a>
		</li>
		<li class="menu_notice">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="menu_inquire">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
	
	<section>
		<div class="inner-wrap">
		<div class="area_faq">
		  <h2 class="title">자주하는 질문 10</h2>
			<a class="faq_more" href="${pageContext.request.contextPath }/support/support_faq">주제별 FAQ 더보기</a>
			<ul>
				<c:forEach var="tmp" items="${list }">
					<li class="dropbox">
						<div class="title_area">
							<span class="category">${tmp.category}</span>
							<a href="${pageContext.request.contextPath }/support/support_faq">
								<p class="detail">${tmp.question }</p>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
    <div class="inner-wrap">
		<div class="notice">
				<h2 class="title">공지사항</h2>
				<a class="view_more" href="${pageContext.request.contextPath }/support/support_notice">더보기</a>
				<ul>
					<c:forEach var="tmp" items="${notice_list }">
					<li>
						<p>${tmp.title}</p>
					</li>
					</c:forEach>
				</ul>
		</div>
		
		<div class="area_contact">
				<h2 class="title">소모임 운영시간 및 연락처</h2>
				<dl>
					<dt>상담시간</dt>
					<dd>
						월~금요일
						<span>9:00 ~ 17:30</span>
						<span>(Break Time 12:00~13:00)</span>
					</dd>
					<dd>
						<span>메일문의</span>
						<span>tttmmm100@naver.com</span>
					</dd>
					<dd>
						<span>전화문의</span>
						"02-3500-3050"
					</dd>
				</dl>
			</div>
	</div>
	</section>	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





