<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${path }/resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/group_list.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="${path }/resources/js/jquery-1.12.0.min.js"></script>
    <script src="${path }/resources/js/jquery.easing.1.3.js"></script>
    <script src="${path }/resources/js/common.js"></script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="home" name="current"/>
	</jsp:include>

    <main id="main-banner" class="main-banner-01">
        <div class="inner-wrap">
            <div class="title">
                <h2>북메이트 찾기</h2>
                <p>
			                    깊게 읽고 사유하는,<br>
			                    북메이트와 함께 취향의 독서를 나누세요.
                </p>
            </div>
            <div class="indicator">
                <div class="home circle">
                    <a href="../../index.html" title="메인페이지가기"><img src="${path }/resources/images/sub/icon_home.svg" alt="홈버튼이미지"></a>
                </div>
                <div class="main-menu circle">BOOKMATE</div>

            </div>
        </div>
    </main>

    <section class="sub-contents mate_content">
        <div class="inner-wrap">
            <h3 class="title black" data-aos="fade-up"
            data-aos-offset="300"
            data-aos-easing="ease-in-sine">소모임 찾기</h3>
        </div>
        <div class="inner-wrap">
            <div class="mate_content_theme">
                <ul>
                    <li><a href="#">전체보기</a></li>
                    <li><a href="#">분류1</a></li>
                    <li><a href="#">분류2</a></li>
                    <li><a href="#">분류3</a></li>
                    <li><a href="#">분류4</a></li>
                </ul>
            </div>
            <div>
                <input class="theme_search" type="text" placeholder="검색">
            </div>
        </div>
        <div class="inner-wrap">
        	<c:forEach var="tmp" items="${list}">
        		<div class="mate_content_list">
	               <div class="mate_contents">
	                   <a href="#">
	                       <div class="mate_content_img">
	                           <img src="${path }/resources/images/main/001.jpg" alt="테스트이미지1">
	                       </div>
	                   </a>
	                   <a href="#">
	                       <div class="mate_content_text">
	                           <p class="mate_content_title">${tmp.name}</p>
	                           <p>모임장 ${tmp.manager_id}</p>
	                           <p class="mate_content_date">${tmp.meeting_time}ㆍ금요일ㆍ${tmp.meeting_loc }</p>
	                       </div>
	                   </a>
	               </div>
	           </div>
        	</c:forEach>
            
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/002.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>   
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/003.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/004.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/005.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/006.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/007.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/008.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="mate_content_list">
                <div class="mate_contents">
                    <a href="#">
                        <div class="mate_content_img">
                            <img src="${path }/resources/images/main/009.jpg" alt="테스트이미지1">
                        </div>
                    </a>
                    <a href="#">
                        <div class="mate_content_text">
                            <p class="mate_content_title">마음 살롱 - 심리학자와 함께하는 독서 모임</p>
                            <p>모임장 농담곰</p>
                            <p class="mate_content_date">8월 11일ㆍ금요일ㆍ강남</p>
                        </div>
                    </a>
                </div>
            </div>

        </div>
    </section>

<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>