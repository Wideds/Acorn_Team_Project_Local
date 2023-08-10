<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${pageContext.request.contextPath}</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/floating-labels/">
	<link href="${pageContext.request.contextPath}/resources/css/floating-labels.css" rel="stylesheet">
	<style>
		.container {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
		}
	</style>
</head>

<body class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp">
		<jsp:param value="signup" name="current" />
	</jsp:include>
	<div class="container">
		<form action="${pageContext.request.contextPath}/users/signup_form"
			method="post" id="myForm">
			<div>
				<fieldset class="fieldarea f2">
					<h1 class="h3 mb-3 font-weight-normal" style="width: 30rem">이용약관(필수)</h1>
					<p class="agreeText">
						<label for="agreement1">아래 사항에 동의 합니다.</label> <input
							id="agreement1" type="checkbox" name="agreement1" />
						<textarea id="text1" readonly>
				이용약관
			</textarea>
					</p>
				</fieldset>
				<fieldset class="fieldarea f3">
					<h1 class="h3 mb-3 font-weight-normal" style="width: 30rem">개인정보취급방침(필수)</h1>
					<p class="agreeText">
						<label for="agreement2">아래 사항에 동의 합니다.</label> <input
							id="agreement2" type="checkbox" name="agreement2" />
						<textarea id="text2" readonly>
				개인정보 방침 및 안내
			</textarea>
					</p>
				</fieldset>
				<fieldset class="fieldarea f3">
					<h1 class="h3 mb-3 font-weight-normal" style="width: 30rem">마케팅 이용약관(선택)</h1>
					<p class="agreeText">
						<label for="agreement3">아래 사항에 동의 합니다.</label> <input
							id="agreement3" type="checkbox" name="agreement3" />
						<textarea id="text3" readonly>
				이용약관
			</textarea>
					</p>
				</fieldset>
			</div>
			<button class="btn btn-primary mt-3" type="submit" disabled>다음</button>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
	<script>
		// 체크박스 체크여부
		$("input:checkbox").click(checkedChange);

		function checkedChange() {
			if ($(this).prop("checked")) {
				$("label[for=" + this.id + "]").text("동의되었습니다.");
				$("label[for=" + this.id + "]").css("color", "blue");
			} else {
				$("label[for=" + this.id + "]").text("동의 해주시기 바랍니다.");
				$("label[for=" + this.id + "]").css("color", "red");
			}

			// 체크 상태에 따라 버튼 활성화 여부 관리
			checkFormState();
		}

		// 폼 전체의 유효성 여부를 판단해서 제출버튼의 disabled 속성을 관리하는 함수
		function checkFormState() {
			var isAgreement1Checked = $("#agreement1").prop("checked");
			var isAgreement2Checked = $("#agreement2").prop("checked");

			if (isAgreement1Checked && isAgreement2Checked) {
				$("button[type=submit]").removeAttr("disabled");
			} else {
				// 속성명만 추가할 때는 value 에 빈 문자열을 작성하면 된다.
				$("button[type=submit]").attr("disabled", "");
			}
		}
	</script>
</body>
</html>