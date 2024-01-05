<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.center-div {
		display: grid;
        place-items: center;
        height: 100vh;
    }
    .custom-form {
            width: 50%;
        }
    
</style>
</head>
<body>

	<%@include file="../include/header.jsp" %>
	<div class="center-div">	
	<form class="from-horizontal custom-form" method="post" id="login_form">
		<div class="form-group text-center">
			<h2>로그인</h2>
		</div>
		<div class="d-grid gap-3">
			<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="id">아이디</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="text" name="memberId" id="memberId" onkeypress="enterLog(event)" /><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="pwd">비밀번호</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="password" name="memberPw" id="memberPw" onkeypress="enterLog(event)"/><br><br>
			</div>
			
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-center">
				<c:if test="${result == 0}">
					<h4 style="color:red">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</h4><br>
				</c:if>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<input class="btn btn-lg btn-success btn-block" type="button" value="로그인" id="login_button"><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<a class="btn btn-block" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b46f32de6a278176d725a43658dc9b68&redirect_uri=http://localhost:10000/shop/oauth/kakao&response_type=code">
					<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_wide.png">
				</a><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-center">
				<a style="cursor:pointer;" id="findIdBtn">아이디 찾기</a>&nbsp;&nbsp;
				<a style="cursor:pointer;" id="findPwBtn">비밀번호 찾기</a>&nbsp;&nbsp;
				<a style="cursor:pointer;" id="joinBtn">회원가입</a>&nbsp;&nbsp;
			</div>
		</div>
		</div>
	</form>
	
	
</div> 
	
	
      <%@include file="../include/footer.jsp" %>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$("#login_button").click(function(){
		$("#login_form").attr("action", "${pageContext.request.contextPath}/member/login.do");
		$("#login_form").submit();
	});
	
	$("#joinBtn").click(function(){
		location="/shop/member/useSuccess";
	});
	
	$("#findIdBtn").click(function(){
		location="/shop/member/findId";
	});
	
	$("#findPwBtn").click(function(){
		location="/shop/member/findPw";
	});
	
	function enterLog(e){
		var memberId = document.getElementById("memberId");
		var memberPw = document.getElementById("memberPw");
		if(e.keyCode == 13){
			$("#login_button").click();
		}
	}
	
</script>
</html>