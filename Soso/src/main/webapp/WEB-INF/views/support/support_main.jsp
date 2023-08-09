<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/support_main</title>
<style>
	.main_content{
		margin: 100px auto 90px;
		box-sizing: border-box;
		width: 100%;
		min-height: 260px;
	}
	.area_faq ul{
		padding: 37px 40px 13px;
		box-sizing: border-box;
		border-top: 2px solid #3d4652;
		border-bottom: 1px solid #3d4642;
	}
	.area_faq ul li{
		margin-bottom: 27px;
		box-sizing: border-box;
		display: inline-block;
		width: 49%;
		font-size: 14px;
	}
	.area_faq ul li .faq_category{
		margin-right: 40px;
		width: 100px;
		color: #666;
		display: inline-block;
	}
	.area_faq ul li p{
		width: 440px;
		display: inline-block;
	}
	.notice{
		width:630px;
		height:290px;
		display: inline-block;
	}
	.notice .view_more{
		float: right;
		margin-right: 50px;
		display: inline-block;
		font-size: 14px;
	}
	.notice h3.title{
		padding-bottom: 16px;
		display: inline-block;
	}
	.area_contact{
		width: 630px;
		height: 290px;
		padding: 51px;
		float: right;
		display: inline-block;
		box-sizing: border-box;
		border: 1px solid gray;
		
	}
	.area_faq .faq_more{
		float: right;
		margin-right: 50px;
		display: inline-block;
		font-size: 14px;
	}
	.faq{
		display: inline-block;
	}
	
	.head{
		background-image:url("https://static.onoffmix.com/images/pc/default/cs_bg.png");
		height:360px;
		background-size:cover;
		overflow:hidden;
	}
	.head h2{
		text-align:center;
		margin:116px auto 20px;
	}
	.head p{
		text-align:center;
		font-size:20px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>

	<div class="head">
		<h2>고객센터</h2>
		<p class="sub_text">서비스 이용 중 불편 했던 점이나 궁금한 점을 빠르고 친절하게 안내해 드리겠습니다.</p>
	</div>
	<!-- 메인 메뉴바 시작 -->
	<ul class="nav justify-content-center">
		<li class="nav-item">
			<a class="nav-link active" href="${pageContext.request.contextPath }/support/support_main">고객센터</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_faq">자주하는 질문</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_notice">공지사항</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="${pageContext.request.contextPath }/support/support_inquire">문의하기</a>
		</li>
	</ul>
	<!-- 메인 메뉴바 끝 -->
	<div class="container">
		<div class="main_content">
			<section class="area_faq">
			<h3 class="faq">자주하는 질문 10</h3>
			<a class="faq_more" href="${pageContext.request.contextPath }/support/support_faq">주제별 FAQ 더보기</a>
			<ul>
				<li>
					<span class="faq_category">모임신청</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">회원</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">회원</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">모임개설</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">모임개설</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">모임해산</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">모임해산</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">회원</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">회원</span>
					<p>빈공간입니다.</p>
				</li>
				<li>
					<span class="faq_category">회원</span>
					<p>빈공간입니다.</p>
				</li>
			</ul>
			</section>
			<section class="notice">
				<h3 class="title">공지사항</h3>
				<a class="view_more" href="${pageContext.request.contextPath }/support/support_notice">더보기</a>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<a href="">[공지] 비어있음</a>
					</li>
					<li class="list-group-item">
						<a href="">[공지] 비어있음</a>
					</li>
					<li class="list-group-item">
						<a href="">[공지] 비어있음</a>
					</li>
					<li class="list-group-item">
						<a href="">[공지] 비어있음</a>
					</li>
					<li class="list-group-item">
						<a href="">[공지] 비어있음</a>
					</li>
				</ul>
			</section>
			<section class="area_contact">
				<h3 class="title">소모임 운영시간 및 연락처</h3>
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
			</section>
		</div>
	</div>
</body>
</html>





