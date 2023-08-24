<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/groupfaq.css" />
</head>
<body>
	<div class="cafe_table">
				<a id="faqInsert">문의하기</a>
			<c:choose>
				<%-- 만약 list가 없으면  --%>
				<c:when test="${empty list }">
					<div id="emptyBox" name="emptyBox">문의사항이 없습니다.</div>
				</c:when>
				<c:otherwise>
					 <table class="altertable">
				        <tbody>
				            <c:forEach var="tmp" items="${list}">
				                <tr>
				                	<td class="q-answer">
				                		<c:if test="${not empty tmp.a_answer }">
								        	<div class="answer_end">답변 완료</div>
								        </c:if>
								        <c:if test="${empty tmp.a_answer }">
								        	<div class="answer_wait">답변 대기</div>
								        </c:if>
				                	</td>
				                    <td>
				                        <a class="q-title" href="#" data-content-id="content-${tmp.num}">${tmp.q_title}</a>
				                    </td>
				                    <td>${tmp.q_writer}</td>
				                    <td style="text-align:center">${tmp.regdate}</td>
				                    <td class="q-delete">
				                       <c:if test="${dto.manager_id == sessionScope.id }">
								        	<a href="${pageContext.request.contextPath}/group/faq/delete?num=${tmp.num}&group_num=${tmp.group_num}" id="delete">x</a>					        
								        </c:if>
				                    </td>
				                </tr>
				                <tr id="content-${tmp.num}" class="hidden-content">
								    <td colspan="5">
										<div class="qna_question">
											<span class="qna_q">Q</span>
									    	<pre name="content" id="content" readonly>${tmp.q_content}</pre>
									        <c:if test="${empty tmp.a_answer }">
									        	<a href="${pageContext.request.contextPath}/group/faq/updateform?num=${tmp.num}" id="update">수정</a>
									        	<a href="${pageContext.request.contextPath}/group/faq/delete?num=${tmp.num}&group_num=${tmp.group_num}" id="delete">삭제</a>
									        </c:if>
										</div>
										<div class="qna_answer">
											<span class="qna_a">A</span>
											<c:if test="${not empty tmp.a_answer }">
								        	<pre name="answer" id="answer" readonly>${tmp.a_answer }</pre>
								        	</c:if>
								        	<c:if test="${empty tmp.a_answer && dto.manager_id == sessionScope.id}">
								        	<a href="${pageContext.request.contextPath}/group/answer/insertform?num=${tmp.num}" id="insertAnswer">답변 하기</a>
								        	</c:if>
								        <!-- session id과 manager id를 검증해서 조건부 출력 -->
								        <c:if test="${not empty tmp.a_answer && dto.manager_id == sessionScope.id }">
								        	<a href="${pageContext.request.contextPath}/group/answer/updateform?num=${tmp.num}" id="updateAnswer" >수정</a>
								        	<a href="${pageContext.request.contextPath}/group/answer/delete?num=${tmp.num}&group_num=${tmp.group_num}" id="deleteAnswer">삭제</a>						        
								        </c:if>
								       </div>
								    </td>
								</tr>
				            </c:forEach>
				        </tbody>
				    </table>
					<br />
						<ul class="pagination">
							<%--
								startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
							 --%>
							<c:if test="${startPageNum ne 1 }">
								<li class="page-item">
									<a class="page-link animate__animated" href=${pageContext.request.contextPath}/group/faq/list?num=${num }&pageNum=${startPageNum-1 }">Prev</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
								<li class="page-item ${pageNum eq i ? 'active' : '' }">
									<a id="nowPage" class="page-link animate__animated" href="${pageContext.request.contextPath}/group/faq/list?num=${num }&pageNum=${i }" data-page-num=${i }>${i }</a>
								</li>
							</c:forEach>
							<%--
								마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
							 --%>
							<c:if test="${endPageNum lt totalPageCount }">
								<li class="page-item">
									<a class="page-link animate__animated" href="${pageContext.request.contextPath}/group/faq/list?num=${num }&pageNum=${endPageNum+1 }">Next</a>
								</li>
							</c:if>				
						</ul>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- cafe-table의 end -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			
			//페이징 처리 시 링크 전송을 막는다.
			$(document).ready(function() {
		    $(".page-link").on("click", function(e) {
		        e.preventDefault(); // 클릭된 링크의 기본 동작(페이지 이동)을 막습니다.
		
		        // 클릭한 페이지의 번호를 가져옵니다.
		        var pageNum = $(this).data("page-num");
	
		        // TODO: AJAX 처리를 통해 페이지 내용을 갱신하는 코드를 추가합니다.
		        $.ajax({
		            type: "GET",
		            url: "${pageContext.request.contextPath}/group/faq/paginglist?num=${num }&pageNum=" + pageNum,
		            dataType: "text",
		            error: function() {
		                console.log("통신실패");
		            },
		            success: function(data) {
		                // TODO: 받아온 데이터를 사용하여 페이지 내용을 갱신하는 코드를 작성합니다.
		                $(".altertable").html(data);
		            }
		        });
		    });
		});

			
			$(document).ready(function () {
			    $(".q-title").on("click", function (e) {
			        e.preventDefault();

			        var contentId = $(this).data("content-id");
			        var contentRow = $("#" + contentId);

			        contentRow.slideToggle(0);
			    });

			    // 처음에는 숨겨두기
			    $(".hidden-content").hide();
			});

			//여기서부터 ajax faq
			  //작성글 클릭 시 faq 페이지 로딩
			  $("#faqInsert").click(function() {
				  $.ajax({
			            type : "GET", //전송방식을 지정한다 (POST,GET)
			            url : "${pageContext.request.contextPath}/group/faq/insertform?num=${num }",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
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
			
			//문의 수정
			  $(document).ready(function() {
			        $("#update").click(function(event) {
			            event.preventDefault(); // 앵커의 기본 동작을 막습니다.

			            var href = $(this).attr("href"); // 앵커의 href 속성을 가져옵니다.
			            var tmpNum = href.split("num=")[1]; // href에서 num 값을 추출합니다.

			            $.ajax({
			                type: "GET",
			                url: href,
			                dataType: "text",
			                error: function() {
			                    console.log("통신실패");
			                },
			                success: function(Parse_data) {
			                    $("#Parse_Area").html(Parse_data);
			                    console.log("통신 데이터 값: " + Parse_data);
			                }
			            });
			        });
			    });
			
			//답변
			  $(document).ready(function() {
			        $("#answer").click(function(event) {
			            event.preventDefault(); // 앵커의 기본 동작을 막습니다.

			            var href = $(this).attr("href"); // 앵커의 href 속성을 가져옵니다.
			            var tmpNum = href.split("num=")[1]; // href에서 num 값을 추출합니다.

			            $.ajax({
			                type: "GET",
			                url: href,
			                dataType: "text",
			                error: function() {
			                    console.log("통신실패");
			                },
			                success: function(Parse_data) {
			                    $("#Parse_Area").html(Parse_data);
			                    console.log("통신 데이터 값: " + Parse_data);
			                }
			            });
			        });
			    });
			/* //답변 수정
			  $(document).ready(function() {
			        $("#updateAnswer").click(function(event) {
			            event.preventDefault(); // 앵커의 기본 동작을 막습니다.

			            var href = $(this).attr("href"); // 앵커의 href 속성을 가져옵니다.
			            var tmpNum = href.split("num=")[1]; // href에서 num 값을 추출합니다.

			            $.ajax({
			                type: "GET",
			                url: href,
			                dataType: "text",
			                error: function() {
			                    console.log("통신실패");
			                },
			                success: function(Parse_data) {
			                    $("#Parse_Area").html(Parse_data);
			                    console.log("통신 데이터 값: " + Parse_data);
			                }
			            });
			        });
			    }); */
		</script>
</body>
</html>