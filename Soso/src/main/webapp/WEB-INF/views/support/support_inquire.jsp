<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_inquire</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/support_inquire.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
				<ul class="inquire_navi">
					<li>
						<a href="${pageContext.request.contextPath }/support/support_inquire">1:1 문의하기</a>
					</li>
					<li>
						<a class="my_inquire" href="${pageContext.request.contextPath }/support/support_inquire_MyInquire">나의 문의내역</a>
					</li>
				</ul>
				<h3>1:1 문의하기</h3>
				<form action="${pageContext.request.contextPath}/support/support_inquire_submit" class="area_form" method="post">
					<div class="row-wrap">
						<div class="input_name">
							<h4 class="label">ID</h4>
							<input type="text" class="writer" name="writer" value="${dto.id}" readonly />
						</div>
						<div class="input_email">
							<h4 class="label">이메일 *</h4>
							<input type="text" class="email" name="email" value="${dto.email}" readonly />
							<p class="tip_txt">* 답변 받을 이메일 주소를 확인해 주세요.</p>
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_title">
							<h4 class="label">제목</h4>
							<select name="category" id="category" class="title_select">
								<option value selected="selected" class="inquire_select">문의분류</option>
								<option value="1">회원</option>
								<option value="2">모임신청</option>
								<option value="3">모임개설</option>
								<option value="0">기타</option>
							</select>
							<input type="text" class="inquire_title" name="title" placeholder="제목을 입력해주세요" />
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_text">
							<h4 class="label">내용 *</h4>
							<textarea name="content" placeholder="북메이트를 이용하시면서 궁금한 점이나 어려운점, 모임 관련 내용이나 북메이트의 전반적인 문의를 입력 해 주세요."></textarea>
						</div>
					</div>
					<div class="row-wrap">
						<div class="input_agreement">
							<h4 class="label">
								개인 정보 수집
								<div style="margin-left:13px">이용 동의</div>
							</h4>
							<label>
							<input class="privacy_check" type="checkbox" name="confirm" value="1" />
								"작성해주신 이메일, 전화번호는 문의내용 확인 및 답변처리 용도로 쓰이며 3년간 보관 후 파기합니다."
							</label>
						</div>
					</div>
					<p class="info_message">
						이 사이트는 reCAPTCHA에 의해 보호되며 Google 개인 정보 취급 방침 및 서비스 약관이 적용됩니다.
					</p>
					<input type="submit" value="1 : 1 문의하기" class="btn_submit"/>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>





