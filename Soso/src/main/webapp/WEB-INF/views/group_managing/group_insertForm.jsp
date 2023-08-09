<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 소모임 개설하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<style>
	.container{
		width: 768px;
	}
</style>
</head>
<body>
	<h3 class="text-center fw-bold mt-5 pt-5 mb-3">소모임 개설 신청</h3>
	<div class="container pt-5">
		<form action="${pageContext.request.contextPath}/group/insert" method="post" id="myForm" enctype="multipart/form-data">
			<div class="mb-2">
				<label class="control-label fw-bold mb-2" for="groupName">TITLE</label>
				<input class="form-control mb-2" type="text" name="name" id="groupName" placeholder="Add text..."/>
				<label class="control-label fw-bold" for="caption">이 소모임을 한줄로 표현해주세요!</label>
				<input class="form-control mb-3" type="text" name="caption" id="caption" placeholder="Add text..." />		
			</div>
			<div class="d-flex mb-3">
				<select name="genre" id="genre" class="form-select col me-4">
					<option selected>장르 선택</option>
					<option value=1>자기계발</option>
					<option value=2>인문/역사/예술</option>
					<option value=3>경영/경제/</option>
					<option value=4>문학</option>
					<option value=0>기타</option>
				</select>
	            <div class="form-group col">
					<input class="form-control" type="number" 
						name="max_people" min="2" max="8" placeholder="최대 모임 회원 수를 지정해주세요">
				</div>
			</div>
			<div class="d-flex mb-3">
				<select name="on_off" id="on_off" class="form-select col me-4">
					<option selected>온/오프라인 선택</option>
					<option value = 0>온라인</option>
					<option value = 1>오프라인</option>
				</select>
				<div class="col">
					<input name="image" class="form-control" type="file" placeholder="이미지 파일을 선택해주세요 "/>
				</div>
			</div>
			<div class="d-flex mb-3">
				<div class="col me-4">
					<label class="fw-bold" for="ended_dt">모임 모집 마감 일자</label>
					<input class="form-control" type="date" name="deadline_dt" />
				</div>
				<div class="col me-4">
					<label class="fw-bold" for="start_dt">모임 활동 시작 일자</label>
					<input class="form-control" type="date" name="start_dt" />
				</div>
				<div class="col">
					<label class="fw-bold" for="ended_dt">모임 활동 종료 일자</label>
					<input class="form-control" type="date" name="ended_dt" />
				</div>
			</div>
			<div class="d-flex mb-4">
				<div class="col me-4">
					<label class="fw-bold" for="meeting_loc">모임 장소</label>
					<input class="form-control" type="text" name="meeting_loc" />
				</div>
				<div class="col">
					<label class="fw-bold" for="meeting_time">모임 시간</label>
					<input class="form-control" type="time" name="meeting_time" />
				</div>
			</div>
			<div>
				<textarea class="form-control border border-4 border-dark-subtle fs-3" 
						name="manager_comment" id="manager_comment" rows="5" placeholder="Add Text..."></textarea>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<button style="background-color: rgb(65, 75, 178); color:white" class="btn mt-3" type="submit">개설하기</button>
			</div>
		</form>
	</div>
</body>
</html>