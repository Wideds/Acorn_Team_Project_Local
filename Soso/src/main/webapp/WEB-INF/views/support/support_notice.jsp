<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_notice</title>
<style>
	.notice_management{
		width: 240px;
	    height: 60px;
	    margin: 0 auto;
	    display: block;
	    border: 1px solid gray;
	    border-radius: 30px;
	    background-color: gray;
	    color: white;
	    font-size: 18px;
	    text-align: center;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_notice.css" />
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
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="menu_faq">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_faq">자주하는 질문</a>
		</li>
		<li class="menu_notice">
			<a class="nav-link active" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="menu_inquire">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
	<!-- 메인 메뉴바 끝 -->
	<div class="container">
		<div class="main_content">
			<h3 class="faq">공지사항</h3>
			<table class="table">
				<thead class="table-light">
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${notice_list }">
					<tr>
						<td>${tmp.notice_num }</td>
						
						<td>
							<c:choose>
								<c:when test="${tmp.category == 1}">공지</c:when>
								<c:when test="${tmp.category == 2}">업데이트</c:when>
								<c:when test="${tmp.category == 3}">휴무</c:when>
								<c:when test="${tmp.category == 0}">기타</c:when>
							</c:choose>
						</td>
						
						<td>
						<a href="${pageContext.request.contextPath }/support/support_notice_detail?notice_num=${tmp.notice_num}">${tmp.title }</a>
						</td>
						<td>${tmp.regdate }</td>
							<td>
							<c:if test="${isAdmin }">
								<a data-num="${tmp.notice_num }" href="${pageContext.request.contextPath }/support/support_notice_updateform?notice_num=${tmp.notice_num}">수정</a>
							</c:if>
							
							</td>
		
							<td>
							<c:if test="${isAdmin }">
								<button data-num="${tmp.notice_num }"type="submit" id="deleteBtn">삭제</button>
							</c:if>
							</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${isAdmin}">
			<a href="${pageContext.request.contextPath }/support/support_notice_insertform" class="notice_management">Notice 관리</a>
			</c:if>
		</div>
	</div>
	<script>
			document.querySelector("#deleteBtn").addEventListener("click", (e)=>{
				e.preventDefault();
				const isTrue = confirm("공지사항을 삭제하시겠습니까?")
				if(isTrue){
					const noticeNum=document.querySelector("#deleteBtn").getAttribute("data-num");
					location.href="${pageContext.request.contextPath}/support/support_notice_delete?notice_num=" + noticeNum;
				}
			});
	</script>
	<!-- 페이지네이션 시작 -->
	<div class="pagination_wrap">
		<nav class="pagination">
			<ul class="pagination_ul">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
					&condition=${condition}&keyword=${encodedK}
				 --%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a href="support_notice?pageNum=${startPageNum-1 }">이전</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a href="support_notice?pageNum=${i }">${i }</a>
					</li>
				</c:forEach>
				<%--
					마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				 --%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a href="support_notice?pageNum=${endPageNum+1 }">></a>
					</li>
				</c:if>				
			</ul>
		</nav>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





