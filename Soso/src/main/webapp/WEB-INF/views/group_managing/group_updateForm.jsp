<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 소모임 정보 수정하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<style>
	.container{
		width: 768px;
	}
</style>
<body>
	<h3 class="text-center fw-bold mt-5 pt-5 mb-3">소모임 정보 수정</h3>
	<div class="container pt-5">
		<form action="${pageContext.request.contextPath}/group_managing/group_update" method="post" id="myForm" enctype="multipart/form-data">
			<div class="mb-2">
				<input type="hidden" name="num" value="${dto.num}"/>
				<label class="control-label fw-bold mb-2" for="groupName">TITLE</label>
				<input class="form-control mb-2" type="text" name="name" id="groupName" placeholder="Add text..." value="${dto.name}"/>
				<label class="control-label fw-bold" for="manager_comment">이 소모임을 한줄로 표현해주세요!</label>
				<input class="form-control mb-3" type="text" name="manager_comment" id="manager_comment" placeholder="Add text..." value="${dto.manager_comment}" />		
			</div>
			<div class="d-flex mb-3">
				<select name="genre" id="genre" class="form-select col me-4">
					<option selected>장르 선택</option>
					<option value=1 ${dto.genre == 1 ? "selected" : "" }>자기계발</option>
					<option value=2 ${dto.genre == 2 ? "selected" : "" }>인문/역사/예술</option>
					<option value=3 ${dto.genre == 3 ? "selected" : "" }>경영/경제/</option>
					<option value=4 ${dto.genre == 4 ? "selected" : "" }>문학</option>
					<option value=0 ${dto.genre == 0 ? "selected" : "" }>기타</option>
				</select>
	            <div class="form-group col">
					<input class="form-control" type="number" 
						name="max_people" min="2" max="8" placeholder="최대 모임 회원 수를 지정해주세요" value=${dto.max_people}>
				</div>
			</div>
			<div class="d-flex mb-3">
				<select name="on_off" id="on_off" class="form-select col me-4">
					<option selected>온/오프라인 선택</option>
					<option value = 0 ${dto.on_off == 0 ? "selected" : "" }>온라인</option>
					<option value = 1 ${dto.on_off == 1 ? "selected" : "" }>오프라인</option>
				</select>
				<div class="col">
					<input name="image" class="form-control" type="file"
						value="${pageContext.request.contextPath}${dto.img_path}"/>
				</div>
			</div>
			<div class="d-flex mb-3">
				<div class="col me-4">
					<label class="fw-bold" for="deadine_dt">모임 모집 마감 일자</label>
					<input class="form-control" type="date" name="deadline_dt" value=${dto.deadline_dt }/>
				</div>
				<div class="col me-4">
					<label class="fw-bold" for="start_dt">모임 활동 시작 일자</label>
					<input class="form-control" type="date" name="start_dt" value=${dto.start_dt } />
				</div>
				<div class="col">
					<label class="fw-bold" for="ended_dt">모임 활동 종료 일자</label>
					<input class="form-control" type="date" name="ended_dt" value=${dto.ended_dt } />
				</div>
			</div>
			<div class="d-flex mb-4">
				<div class="col me-4">
					<label class="fw-bold" for="meeting_loc">모임 장소</label>
					<input class="form-control" type="text" name="meeting_loc" value = "${dto.meeting_loc}"/>
				</div>
				<div class="col">
					<label class="fw-bold" for="meeting_time">모임 시간</label>
					<input class="form-control" type="time" name="meeting_time" value = ${dto.meeting_time} />
				</div>
			</div>
			<div>
				<textarea class="form-control border border-4 border-dark-subtle fs-3" 
						name="caption" id="caption" rows="5" placeholder="Add Text...">${dto.caption}</textarea>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<button style="background-color: rgb(65, 75, 178); color:white" class="btn mt-3 me-4" type="submit">수정하기</button>
				<a style="background-color: black; color:white" class="btn mt-3" 
					href="${pageContext.request.contextPath}/group_managing/group_delete?num=${dto.num}">해산하기</a>
			</div>
		</form>
	</div>
</body>
</html>