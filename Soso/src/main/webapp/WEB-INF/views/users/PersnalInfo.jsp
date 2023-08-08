<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageContext.request.contextPath}</title>
</head>
<body>
	<fieldset class="fieldarea f2">
		<legend>
			<span>이용</span>약관
		</legend>
		<p class="agreeText">
			<label for="agreement1">아래 사항에 동의 합니다.</label> <input id="agreement1"
				type="checkbox" name="agreement1" />
			<textarea id="text1" readonly>
				이용약관
			</textarea>
		</p>
	</fieldset>
	<fieldset class="fieldarea f3">
		<legend>
			<span>개인정보</span>취급방침
		</legend>
		<p class="agreeText">
			<label for="agreement2">아래 사항에 동의 합니다.</label> <input id="agreement2"
				type="checkbox" name="agreement2" />
			<textarea id="text2" readonly>
				개인정보 방침 및 안내
			</textarea>
		</p>
	</fieldset>
	<script>
		//체크박스 체크여부
		$("input:checkbox").click(checkedChange);
		function checkedChange() {
			if ($(this).prop("checked")) {
				$("label[for=" + this.id + "]").text("동의되었습니다.");
				$("label[for=" + this.id + "]").css("color", "blue");
			} else {
				$("label[for=" + this.id + "]").text("동의 해주시기 바랍니다.");
				$("label[for=" + this.id + "]").css("color", "red");
			}
		}
	</script>
</body>
</html>