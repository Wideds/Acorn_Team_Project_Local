<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<!-- 메인 메뉴바 끝 -->
<!-- 검색 창 시작 -->
<div class="search">
	<form action="" class="search_form" method="get">
		<input type="text" value="${keyword}"name="keyword" class="search_main" placeholder="예) 회원가입, 로그인, 결제 등" />
		<input type="submit" class="search_cs"/>
	</form>
</div>
<!-- 검색 창 끝 -->
<div class="main_content">
	<div class="tab_section">
		<ul class="tab_menu">
			<li class="active">
				<a href="${pageContext.request.contextPath }/support/support_faq">전체(${totalRow})</a>
			</li>
			<li class="">
				<a href="${pageContext.request.contextPath }/support/support_faq_user">회원(${categoryOneRow})</a>
			</li>
			<li class="">
				<a href="${pageContext.request.contextPath }/support/support_faq_request">모임신청(${categoryTwoRow})</a>
			</li>
			<li class="">
				<a href="${pageContext.request.contextPath }/support/support_faq_open">모임개설(${categoryThreeRow})</a>
			</li>
			<li class="">
				<a href="${pageContext.request.contextPath }/support/support_faq_etc">기타(${categoryZeroRow})</a>
			</li>
		</ul>
	</div>
</div>