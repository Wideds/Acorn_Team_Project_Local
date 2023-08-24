<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소모임 개설하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/group_managing/group_managing_group_insert.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.min.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
        <jsp:param value="login" name="current"/>
    </jsp:include>
    <div class="container">
		<div id="insert_title">소모임 개설 신청</div>
		<div id="insert_subtitle">소모임장이 되어 원하는 소모임을 개설해보세요.</div>
		
		<div class="image_container" style="display:flex; flex-direction:column; align-items:center">
			<img id="image_preview" src="${pageContext.request.contextPath}/resources/images/main/001.jpg" 
				style="width:150px; height:150px; border-radius:50%; border: 1px solid rgb(222, 226, 230)" alt="소모임 이미지"/>
			<div style="margin-top:20px; margin-bottom:20px; font-size: 15px;">소모임 이미지</div>
		</div>
		
		<form action="${pageContext.request.contextPath}/group/insert" method="post" id="myForm" enctype="multipart/form-data">
			<div class="form_header">
                <div class="form_label">
                     <label for="groupName">TITLE</label>
                </div>
                <input class="form_input" type="text" name="name" id="groupName" autocomplete="off" placeholder="Add text..."/>
            </div>
            <div class="form_header">
            	<input class="form_input" type="text" name="manager_comment" id="manager_comment" autocomplete="off" placeholder="이 소모임을 한마디로 표현해주세요!" />
			</div>
			<div class="grid_wrapper">
                    <select name="genre" id="genre" class="select_box">
                         <option selected>장르</option>
                         <option value = 1>자기계발</option>
                         <option value = 2>인문/역사/예술</option>
                         <option value = 3>경영/경제</option>
                         <option value = 4>문학</option>
                         <option value = 0>기타</option>
                    </select>
                    <select name="max_people" id="max_people" class="select_box">
                         <option selected>모임 정원</option>
                         <option value = 2>2명</option>
                         <option value = 3>3명</option>
                         <option value = 4>4명</option>
                         <option value = 5>5명</option>
                         <option value = 6>6명</option>
                         <option value = 7>7명</option>
                         <option value = 8>8명</option>
                         <option value = 9>9명</option>
                    </select>
                    <select name="on_off" id="on_off" class="select_box">
                              <option selected>온/오프라인 선택</option>
                              <option value = 0>온라인</option>
                              <option value = 1>오프라인</option>
                    </select>
                    <div class="select_box" style="display:flex; align-items:center; justify-content:space-between">소모임의 이미지를 선택해주세요
                    	<button id="image_btn" style="width: 65px; height: 27px; color: white;
                    				 background-color: rgb(195, 181, 157); border:none; border-radius: 15px;">file</button>
                    </div>
                    <input id="image" name="image" type="file" style="display: none;"
                    	accept=".jpg, .png, .gif, .JPG, .JPEG, .jpeg"/>
               </div>
               <script>
		            document.querySelector("#image_btn").addEventListener("click", (e) => {
						e.preventDefault();
		                document.querySelector("#image").click()
					});
					document.querySelector("#image").addEventListener("change", (e) => {
						const files = e.target.files;
						if(files.length > 0){
							const reader = new FileReader();
							reader.onload = (event) => {
								const data=event.target.result;
								document.querySelector("#image_preview").setAttribute("src", data);
							};
							reader.readAsDataURL(files[0]);
						}
					});
					document.querySelector("#on_off").addEventListener("change", (e) => {
						if(e.target.value == 0){
							document.querySelector("#meeting_loc").value = "온라인"
						} else {
							document.querySelector("#meeting_loc").value = ""
						}
					});
				</script>
               <div class="loc_time">
				<div>
					<input class="form_input" id="meeting_loc" type="text" name="meeting_loc" autocomplete="off" placeholder="모임 장소"/>
				</div>
				<div>
					<input id="meeting_time" class="form_input" type="text" name="meeting_time" autocomplete="off" placeholder="모임 시간"/>
				</div>
			</div>
			<div class="date_pickers">
				<div>
					<input id="start_dt" class="form_input" type="text" name="start_dt" autocomplete="off" placeholder="모임 시작일"/>
				</div>
				<div>
					<input id="ended_dt" class="form_input" type="text" name="ended_dt" autocomplete="off" placeholder="모임 종료일"/>
				</div>
				<div>
					<input id="deadline_dt" class="form_input" type="text" name="deadline_dt" autocomplete="off" placeholder="모임 모집 마감일"/>
				</div>
			</div>
			<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
			<!-- 플러그인 javascript 로딩 -->
			<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.full.min.js"></script>
			<script>
				//언어
			    $.datetimepicker.setLocale("ko");
				$("#start_dt").datetimepicker({
					timepicker:false,
					format:"Y.m.d"
				});
				$("#ended_dt").datetimepicker({
					timepicker:false,
					format:"Y.m.d"
				});
				$("#deadline_dt").datetimepicker({
					timepicker:false,
					format:"Y.m.d"
				});
				$("#meeting_time").datetimepicker({
			        datepicker:false,
			        format:"H:i"
			    });
			</script>
			<div>
				<textarea name="caption" id="caption" rows="2" autocomplete="off" placeholder="이곳에 소모임 규칙 또는 자세한 설명을 적어주세요!"></textarea>
				<div style = "display:flex; justify-content:end">
					<div id="currentTextLength">0 / 200</div> 
				</div>
				<div class="invalid-feedback">소모임 소개는 최소 100자이상 최대 200자 미만으로 적어주시길 바랍니다</div>
			</div>
			<script>
				$(".invalid-feedback").css("color", "red").css("font-size", "13px").css("font_weight", "600").hide();
				$("#caption").on("input", function(){
					const textNum = $(this).val().length;
					$("#currentTextLength").text(textNum + " / 200");
					if(textNum >= 200 || textNum < 100) {
						$("#caption").removeClass("is-valid").addClass("is-invalid");
						$(".invalid-feedback").show();
					} else {
						$("#caption").removeClass("is-invalid").addClass("is-valid");
			  		 	$(".invalid-feedback").hide();
					}
				});
			</script>
			
			<!-- 책 검색 공간(임시) -->
			
			<div class="Book_Area"></div>
			<script>
			    const booklist = [];
			    $(document).ready(function() {
			        $.ajax({
			            type: "GET",
			            url: "${pageContext.request.contextPath}/test/booksearch", // 페이지 경로를 적절하게 수정해야 함
			            dataType: "html", // 수정: 데이터 타입을 "html"로 지정
			            error: function() {
			                console.log("실패");
			            },
			            success: function(Parse_data) {
			                $(".Book_Area").html(Parse_data);
			            }
			        }); // 수정: $.ajax 함수 호출 부분이 닫히지 않음
			    });
			</script>
			
			
			<div id="form_button">
				<button type="submit">개설</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>