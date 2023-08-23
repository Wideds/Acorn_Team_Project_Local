<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_faq_updateform</title>
<style>
	.faqBtn{
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_inquire.css" />

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
	<div class="main_area">
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
		<div class="body_area">
			<div class="main_content">
				<h3>질문 수정</h3>
				<form action="${pageContext.request.contextPath }/support/support_faq_update" class="area_form" method="post" >
					<div class="row-wrap">
						<div class="input_title">
							<input type="hidden" name="faq_num" value="${dto.faq_num }" />
							<h4 class="label">질문</h4>
							<select name="category" id="category" class="title_select">
								<option selected="selected" class="inquire_select">분류</option>
								<option value="1"${dto.category == 1 ? 'selected' : '' }>회원</option>
								<option value="2"${dto.category == 2 ? 'selected' : '' }>모임신청</option>
								<option value="3"${dto.category == 3 ? 'selected' : '' }>모임개설</option>
								<option value="0"${dto.category == 0 ? 'selected' : '' }>기타</option>
							</select>
							<input value="${dto.question }"type="text" class="inquire_title" name="question" id="question" placeholder="질문을 입력해주세요" />
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_text">
							<h4 class="label">답변 *</h4>
							<textarea name="answer" id="answer" placeholder="답변내용을 입력 해 주세요.">${dto.answer }</textarea>
						</div>
					</div>
					
					<p class="info_message">
						이 사이트는 reCAPTCHA에 의해 보호되며 Google 개인 정보 취급 방침 및 서비스 약관이 적용됩니다.
					</p>
					<button type="submit" class="faqBtn">수정하기</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		//수정 버튼을 눌렀을 때 알림창이 뜨도록
			$(".faqBtn").click(function(){
				alert("수정되었습니다.");
			});
	</script>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





