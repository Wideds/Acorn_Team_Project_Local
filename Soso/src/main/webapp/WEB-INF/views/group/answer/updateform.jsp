<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 문의사항 답변 수정하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/groupfaq.css" />
<style>
	/* 확인, 취소 버튼 */
	#submitBtn, #resetBtn{
		border : 2px solid black;
		border-radius : 10px;
		display : inline-block; /* 필요한 만큼만 감싸기 */
		justify-content : flex-end;
	    padding: 5px 10px; /* 원하는 패딩 값 설정 */
	}
	/* 제목 */
	#q_title{
		margin : 1rem;
		font-size : larger;
	}
	/* 문의내용 */
	#q_content, #a_answer{
		resize : none;
		border : 1px solid black;
		border-radius : 10px;
		outling : none;
		background-color : #0000000b;
		width : 80%;
		margin-left: 2rem;
		margin-top : 1rem;
		margin-bottom: 1rem;
		padding : 1rem;
	
	}


</style>
</head>
<body>
	<div class="container">
		<h2>수정하기</h2>
		<form action="${pageContext.request.contextPath}/group/answer/insert" method="post">
			<div class="col-12">
				<!-- faq의 글 번호를 알아온다. -->
				<pre name="q_content" id="q_content">${dto.q_content }</pre>
				<!-- 문의글 번호와 소모임 번호를 동시에 넘겨준다. -->
				<input type="text" id="num" name="num" value="${dto.num }" hidden/>
				<input type="text" id="group_num" name="group_num" value="${dto.group_num }" hidden/>
			<div>
				<!-- 답변 내용 -->
				<label for="a_content"></label>
				<textarea name="a_answer" id="a_answer" rows="10">${dto.a_answer }</textarea>
			</div>	
			<button type="submit" onclick="submitContents(this)" style="margin-left: 106.2ex;" id="submitBtn">등록</button>
			<button type="reset" id="resetBtn">리셋</button>
		</form>
	</div>
	<script>
	//여기서부터 ajax faq
	//취소버튼 누르면 돌아가기
	$("#resetBtn").click(function() {
		$.ajax({
			type : "GET", //전송방식을 지정한다 (POST,GET)
	        url : "${pageContext.request.contextPath}/group/faq/list?num=${dto.group_num }",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	        dataType : "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
	        error : function(){
	        	console.log("통신실패");
	        },
	        success : function(Parse_data){
	            $("#Parse_Area").html(Parse_data); //div에 받아온 값을 넣는다.
	            console.log("통신 데이터 값 : " + Parse_data);
	        }
	    });
	});
	</script>
</body>
</html>
