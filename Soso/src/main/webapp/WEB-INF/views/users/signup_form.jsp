<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css" type="text/css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/include/navbar_c.jsp">
      <jsp:param value="signup" name="current"/>
   </jsp:include>
   <div class="container">
      <p class="title">회원 가입</p>
      <form action="${pageContext.request.contextPath}/users/signup" method="post" id="myForm">
         <input type="hidden" name="agreement1" value="${sessionScope.agreement1}" />
	     <input type="hidden" name="agreement2" value="${sessionScope.agreement2}" />
	     <input type="hidden" name="agreement3" value="${sessionScope.agreement3}" />
         <div>
            <label class="control-label" for="userName">이름(닉네임)</label>
            <input class="form-control" type="text" name="userName" id="userName"/>  
            <small class="form-text text-muted">2~16자의 영어 또는 숫자 또는 한글만 사용가능합니다.</small>
          	<div class="invalid-feedback">이름을 확인하세요.</div>
         </div>
         <div>
            <label class="control-label" for="birth">생년월일</label>
            <input class="form-control" type="date" name="birth" id="birth"/>      
         </div>
         <fieldset>
               <legend>성별 체크</legend>
               <div class="form-check">
                   <input class="form-check-input" type="radio" id="one" name="gender" value="남" checked>
                   <label class="form-check-label" for="one">남</label>
               </div>
               <div class="form-check">
                   <input class="form-check-input" type="radio" id="two" name="gender" value="여">
                   <label class="form-check-label" for="two">여</label>
               </div>
               <div class="form-check">
                   <input class="form-check-input" type="radio" id="three" name="gender" value="비공개">
                   <label class="form-check-label" for="three">비공개</label>
               </div>
         </fieldset>
         <div>
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/> 
            <small class="form-text text-muted">2~15자의 영문 소문자로 시작하고 영어소문자, 숫자만 사용가능합니다.</small>
          	<div class="invalid-feedback">아이디를 확인하세요.</div>     
         </div>
         <div>
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/> 
            <small class="form-text text-muted">최소 8자 이상으로 문자와 숫자, 특수 문자를 각각 하나 이상 조합하세요.</small>
          	<div class="invalid-feedback">비밀 번호를 확인 하세요</div>  
         </div>
         <div>
            <label class="control-label" for="pwd2">비밀번호 확인</label>
            <input class="form-control" type="password" name="pwd2" id="pwd2"/>
            <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div> 
         </div>
         <div>
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
            <div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
         </div>
         <button class="btn btn-primary mt-3" type="submit" disabled>가입</button>
      </form>
   </div>   
   
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
    
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
   <script>
   		let isuserNameValid=false;
   		$("#userName").on("input", () => {
   		  const userName = $("#userName").val();
   		  const reg= /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
   		  isuserNameValid = reg.test(userName);
   		  
	   	if (userName !== '') {
	      if (isuserNameValid) {
	  		 $("#userName").removeClass("is-invalid").addClass("is-valid");
	  		 $(".invalid-feedback.user-name-feedback").hide();
	  	  } else {
	  		 $("#userName").removeClass("is-valid").addClass("is-invalid");
	  		 $(".invalid-feedback.user-name-feedback").show();
	  	  }
	    }
   		  
   		  checkFormState();
   		});
   		
   		let isIdValid=false;
   		$("#id").on("input", () => {
   		  const Id = $("#id").val();
   		  const reg = /^[a-z][a-z0-9]{1,14}$/;
   		  isIdValid = reg.test(Id);
   		  
   		  if (Id !== '') {
   		    if (isIdValid) {
   		      $("#id").removeClass("is-invalid").addClass("is-valid");
   		      $(".invalid-feedback.user-name-feedback").hide();
   		    } else {
   		      $("#id").removeClass("is-valid").addClass("is-invalid");
   		      $(".invalid-feedback.user-name-feedback").show();
   		    }
   		  }
   		  
   		  checkFormState();
   		});
   
   		let isPwdValid=false;
	   	//비밀번호 입력란과 비밀번호 확인란에 입력했을때 실행할 함수 등록(다중선택)
	   	$("#pwd").on("input", () => {
		  const pwd = $("#pwd").val();
		  const reg = /^(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$/;
		  isPwdValid = reg.test(pwd);
		  
		  if (pwd !== '') {
		    if (isPwdValid) {
		      $("#pwd").removeClass("is-invalid").addClass("is-valid");
		      $(".invalid-feedback.pwd-feedback").hide();
		    } else {
		      $("#pwd").removeClass("is-valid").addClass("is-invalid");
		      $(".invalid-feedback.pwd-feedback").show();
		    }
		  }
		  
		  checkFormState();
		});
	   	
	   	$("#pwd2").on("input", () => {
	   	  const pwd = $("#pwd").val();
	   	  const pwd2 = $("#pwd2").val();
	   	  
	   	  if (pwd2 !== '') {
	   	    if (pwd === pwd2) {
	   	      $("#pwd2").removeClass("is-invalid").addClass("is-valid");
	   	    } else {
	   	      $("#pwd2").removeClass("is-valid").addClass("is-invalid");
	   	    }
	   	  }
	   	  
	   	  checkFormState();
	   	});
	   	
	   	
	   	let isEmailValid=false;
	   	$("#email").on("input", (e) => {
	   	  const inputEmail = $(e.target).val();
	   	  const reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	   	  isEmailValid = reg.test(inputEmail);
	   	  
	   	  if (inputEmail !== '') {
	   	    if (isEmailValid) {
	   	      $(e.target).removeClass("is-invalid").addClass("is-valid");
	   	      $(".invalid-feedback.email-feedback").hide();
	   	    } else {
	   	      $(e.target).removeClass("is-valid").addClass("is-invalid");
	   	      $(".invalid-feedback.email-feedback").show();
	   	    }
	   	  }
	   	  
	   	  checkFormState();
	   	});
   		
   		//폼 전체의 유효성 여부를 판단해서 제출버튼의 disabled 속성을 관리하는 함수 
   		function checkFormState(){
   		   if(isuserNameValid && isIdValid && isEmailValid && isPwdValid){
   		      $("button[type=submit]").removeAttr("disabled");
   		   }else{
   		      //속성명만 추가할때는 value 에 빈 문자열을 작성하면 된다.
   		      $("button[type=submit]").attr("disabled", "");
   		   }
   		} 
   </script>
   
</body>
</html>



















