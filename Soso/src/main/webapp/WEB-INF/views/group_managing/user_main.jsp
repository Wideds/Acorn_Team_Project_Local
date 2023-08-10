<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/group/user_main.jsp</title>
	<link rel="stylesheet" href="${path }/resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/group_list.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing_user_main.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>
	<main id="main-banner" class="main-banner-02">
        <div class="inner-wrap">
            <div class="title">
                <h2>나의 북메이트</h2>
                <p>
			                   참여중인 북메이트를<br>
			                   확인하는 게시판
                </p>
                <a href="${pageContext.request.contextPath}/cafe/list">게시판</a>
            </div>
            <div class="indicator">
                <div class="home circle">
                    <a href="../../index.html" title="메인페이지가기"><img src="${path }/resources/images/sub/icon_home.svg" alt="홈버튼이미지"></a>
                </div>
                <div class="main-menu circle">MY BOOKMATE</div>
            </div>
        </div>
    </main>
   <div class="container">     
   	  <div class="row">
	      <c:forEach var="tmp" items="${list}">
	      	<div class="d-flex justify-content-around">
	         	<div class="col-sm-6 col-md-4 col-lg-3 p-1">
	             	<div class="card mb-4">
	                <a href="${pageContext.request.contextPath}/group_managing/group_userdetail">
	                   	<div class="img-wrapper">
	                      <img class="card-img-top" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2F92%2F73%2F6b%2F92736bbfb3b458a5424d88d4e39dc55d.jpg&type=a340"/>
	                    </div>
	                </a>
	                <div class="card-body">
	                    <p class="card-title fs-3"><strong>책 나눔 모임</strong></p>
	                    <p class="card-text">감명 깊게 읽은 책 나눔!</p>
	                </div>
	                <ul class="list-group list-group-flush">
		                <li class="list-group-item"><strong>관리자  :</strong> <strong>정세영</strong></li>
		                <li class="list-group-item"><strong>가입 날짜  :</strong> <strong>2023.08.01</strong></li>
		                <li class="list-group-item"><strong>총 가입 인원  :</strong> <strong>8명</strong></li>
	              	</ul>
	             	</div>
	        	</div>
		        <div class="col-sm-6 col-md-4 col-lg-3 p-1">
		             <div class="card mb-4">
		                <a href="${pageContext.request.contextPath}">
		                   <div class="img-wrapper">
		                      <img class="card-img-top" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MThfNzQg%2FMDAxNjgxNzg3ODUwMzkw.DskgB95FpXilYP6AOHl1Y8GPc6_G4WeBrC1s6KrBLR8g.jjOd7M2ZGRHWf9nuH7Yjn84kejA52U0OvWSMlFPr5kkg.JPEG.windysky70%2FIMG_8535.JPG&type=a340"/>
		                   </div>
		                </a>
		                <div class="card-body">
		                    <p class="card-title fs-3"><strong>독서 토론 모임</strong></p>
		                    <p class="card-text">원하는 책을 읽고 토론 해보기!</p>
		                </div>
		                <ul class="list-group list-group-flush">
			                <li class="list-group-item"><strong>관리자  :</strong> <strong>이진영</strong></li>
			                <li class="list-group-item"><strong>가입 날짜  :</strong> <strong>2023.08.01</strong></li>
			                <li class="list-group-item"><strong>총 가입 인원  :</strong> <strong>8명</strong></li>
		               </ul>
		             </div>
		         </div>
		         <div class="col-sm-6 col-md-4 col-lg-3 p-1">
		             <div class="card mb-4">
		                <a href="${pageContext.request.contextPath}">
		                   <div class="img-wrapper">
		                      <img class="card-img-top" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODExMTNfMjE4%2FMDAxNTQyMDcyNDI1MTY1.yPh4xXY0sSHyYL9pecXQabo1c2W4Q0xUk9iQPPE9XpIg.EhXVwRvGW946zmAtQGtx1etN4gk1ba_IZ71IqE6him4g.JPEG.6m_z9%2Ftumblr_ph4ynpopnw1uwzs06o1_540.jpg&type=a340"/>
		                   </div>
		                </a>
		                <div class="card-body">
		                    <p class="card-title fs-3"><strong>책방 투어 모임</strong></p>
		                    <p class="card-text">전국에 책방을 파헤치자!</p>
		                </div>
		                <ul class="list-group list-group-flush">
			                <li class="list-group-item"><strong>관리자  :</strong> <strong>김형규</strong></li>
			                <li class="list-group-item"><strong>가입 날짜  :</strong> <strong>2023.08.01</strong></li>
			                <li class="list-group-item"><strong>총 가입 인원  :</strong> <strong>8명</strong></li>
		               	</ul>
		             </div>
		         </div>	         	        	         
		      </div>
	     </c:forEach>
	  </div>
	</div>
    <nav>
       <ul class="pagination justify-content-center">
          <c:choose>
             <c:when test="${dto.prevNum ne 0 }">
                <li class="page-item mr-3">
                     <a class="page-link" href="${pageContext.request.contextPath}">&larr; Prev</a>
                </li>
             </c:when>
         </c:choose>
         <c:choose>
            <c:when test="${dto.nextNum ne 0 }">
               <li class="page-item">
                   <a class="page-link" href="${pageContext.request.contextPath}">Next &rarr;</a>
               </li>
            </c:when>
         </c:choose>         
       </ul>
    </nav>
</body>
</html>

