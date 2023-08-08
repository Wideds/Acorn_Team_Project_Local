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
		<form action="${pageContext.request.contextPath}/group/insert" method="post" id="myForm">
			<div class="mb-2">
				<label class="control-label fw-bold" for="groupName">TITLE</label>
				<input class="form-control" type="text" name="name" id="groupName" placeholder="Add text..."/>		
			</div>
			<div class="d-flex mb-3">
				<select name="genre" id="genre" class="form-select col me-4">
					<option selected>장르 선택</option>
					<option value="self_improve">자기계발</option>
					<option value="humanity_history_art">인문/역사/예술</option>
					<option value="business_economics">경영/경제/</option>
					<option value="literature">문학</option>
					<option value="etc">기타</option>
				</select>
	            <div class="form-group col">
					<input class="form-control" type="number" name="group_maxNum" min="1" max="10">
				</div>
			</div>
			<div class="d-flex mb-4">
				<select name="onOff" id="onOff" class="form-select col me-4">
					<option selected>온/오프라인 선택</option>
					<option value="online">온라인</option>
					<option value="offline">오프라인</option>
				</select>
				<div class="col">
					<input class="form-control" type="file" placeholder="이미지 파일을 선택해주세요 "/>
				</div>
			</div>
			<div>
				<textarea class="form-control border border-4 border-dark-subtle fs-3" 
						name="group_caption" id="group_caption" rows="5" placeholder="Add Text..."></textarea>
			</div>
			<div class="d-flex justify-content-center mt-3">
				<button style="background-color: rgb(65, 75, 178); color:white" class="btn mt-3" type="submit">개설하기</button>
			</div>
		</form>
	</div>
</body>
</html>