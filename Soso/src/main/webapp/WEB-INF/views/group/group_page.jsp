<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<style>
	.d-flex{
		border : 1px solid red;
		border-radius: 10px
	}
}
</style>
<body>
	<div class="container">
		<h1 class="mb-3 mt-3">${dto.name }</h1>
		<div class="d-flex flex-row mb-3">
			<div class="p-2"><strong>장소 : </strong>${dto.meeting_loc }</div>
			<div class="p-2"><strong>시간 : </strong>${dto.meeting_time }</div>
			<div class="p-2"><strong>인원 : </strong>${dto.max_people }명</div>
		</div>
		
		<div class="d-flex mb-3">
			<div class="p-2 flex-grow-1">모임 대표 이미지</div>
			<div class="p-2 flex-grow-1">
				<h4>모임 소개</h4>
				<span>${dto.caption }</span>
				<div class="d-flex flex-row-reverse" style="border : 0px;">
					<div class="p-2">
						<c:choose>
							<c:when test="${empty jjim }">
								<div class="p-2 heart" id="fillHeart">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
									  <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
									</svg>
								</div>
								<div id="jjimCount">${jjimCount }</div>
							</c:when>
							<c:otherwise>
								<div class="p-2 heart" id="emptyHeart">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
									  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
									</svg>
								</div>
								<div id="jjimCount">${jjimCount }</div>
							</c:otherwise>
						</c:choose>
					</div>
					<input type="hidden" name="jjimNum" id="jjimNum" value="${dto.num }" hidden />
					<button id="jjim" hidden>찜하기 버튼 테스트</button>
					<c:choose>
						<c:when test="${knowJoin == -1 || empty knowJoin}">
							<button type="button" class="btn btn-outline-primary"><a href="${pageContext.request.contextPath}/group/group_in?num=${dto.num }">가입하기</a></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-outline-primary cancle" id="cancleBtn" name="cancleBtn">신청 취소</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="d-flex mb-3">
			<div class="p-2 flex-grow-1">호스트의 한마디</div>
			<div class="p-2 flex-grow-1">${dto.manager_comment }</div>
		</div>
		<div>
			<h4 class="mx-1 my-1">이 모임에서는 이런 책들을 읽어요</h4>
			<div class="d-flex">
				<div class="card mx-1 my-1" style="width: 9rem;">
					<div class="card-body">
						<img src="${pageContext.request.contextPath}/images/0.png" class="card-img-top" alt="..." />
					</div>
					<h5 class="card-title">책 이름1</h5>
					<p class="card-text">여기에 책 설명이 출력될 예정입니다.</p>
				</div>
				<div class="card mx-1 my-1" style="width: 9rem;">
					<div class="card-body">
						<img src="${pageContext.request.contextPath}/images/1.png" class="card-img-top" alt="..." />
					</div>
					<h5 class="card-title">책 이름2</h5>
					<p class="card-text">여기에 책 설명이 출력될 예정입니다.</p>
				</div>
				<div class="card mx-1 my-1" style="width: 9rem; height: 18rem;">
					<div class="card-body">
						<img src="${pageContext.request.contextPath}/images/2.png" class="card-img-top" alt="..." />
					</div>
					<h5 class="card-title">책 이름3</h5>
					<p class="card-text">여기에 책 설명이 출력될 예정입니다.</p>
				</div>
				<!-- 반복문으로 출력할 예정입니다. -->
			</div>
		</div>
		<div>
			<h4 class="mx-1 my-1">이 모임에 참석한 사람들의 후기입니다.</h4>
			<div class="d-flex flex-column mb-3">
			<!-- forEach를 사용해서 댓글 출력(나중에는 분기 써서 댓글이 없을 때는 다른 페이지 표시하) -->
				<c:choose>
					<c:when test="${empty list}">
						<div class="card mx-1 my-1">
							<div class="card-body">
								<p class="card-text">아직 후기가 없어요</p>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="tmp" items="${list}" end="2">
							<div class="card mx-1 my-1">
								<div class="card-body">
									<p class="card-text">${tmp.review}</p>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div>
			<h5 class="mx-1 my-1">저희 모임에 궁금한 게 있으신가요?(문의 게시판 만들기)</h5>
			<div class="d-flex flex-column mb-3">
				<div class="p-2">댓글 기능</div>
			</div>
		</div>
	</div>
	<!-- jQuery 라이브러리를 로드 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>

	// heart 이모티콘을 클릭하면 button id="jjim"를 강제로 클릭하는 코드
	  $(".heart").on("click", function() {
	    $("#jjim").click();
	  });
	  
	  //id가 jjim인 버튼을 눌렀을 때 ajax 요청하기
	  $("#jjim").on("click", function(){
		  var jjimNum = $("#jjimNum").val();
		  //ajax로 요청한다.
		  $.ajax({
		    // 요청 경로
		    url: "${pageContext.request.contextPath}/group/jjim",
		    // 요청 방식
		    method: "get",
		    // num이라는 파라미터를 request 영역에 담아둔다. 1은 테스트용 값
		    data: { "num": jjimNum },
		    success: function(data){
		    // 서버에서 반환된 응답 데이터를 이용하여 원하는 처리를 한다.
		    // data 여부에 따라 클라이언트에게 표시해준다.
		    if (data.isSuccess == true) {
		    	
		    	// 찜 추가되었습니다.
				alert(jjimNum+"찜 추가되었습니다.");
				
		    	// div의 클래스를 'emptyHeart'에서 'heart'로 변경
				$(".heart").removeClass("emptyHeart").addClass("heart");
				
				// 하트의 모양을 채워지게 변경
				$(".heart").html(`
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
					    <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
					</svg>
				`);
				} else {
				
					// 찜 취소하셨습니다.
				alert(jjimNum+"찜 취소하셨습니다.");
				
				// 하트의 모양을 비워지게 변경
				$(".heart").html(`
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
					    <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
					</svg>
				`);
				}
			 // jjimCount 엘리먼트의 내용을 data.jjimCount로 변경
			 $("#jjimCount").text(data.jjimCount);
		      }
		    });
	  });
	  
	  //신청 취소 버튼 누르면 신청 취소가 되게 해주는 ajax
	  $(".cancle").on("click", function(){
		  var jjimNum = $("#jjimNum").val();
		  var $cancleBtn = $(this); // 클릭된 버튼을 참조

		  $.ajax({
			  url : "${pageContext.request.contextPath}/group/cancleJoin",
			  method : "get",
			  data : { "num" : jjimNum },
			  success: function(data){
				  // 신청 취소 버튼을 가입하기 버튼으로 변경
			      $cancleBtn.replaceWith(`
			        <button type="button" class="btn btn-outline-primary cancleBtn">
			          <a href="${pageContext.request.contextPath}/group/group_in?num=${dto.num }">가입하기</a>
			        </button>
			      `);
				  alert("가입 신청을 취소하셨습니다.")
			  }
		  })
	  })
	</script>
</body>
</html>
</html>