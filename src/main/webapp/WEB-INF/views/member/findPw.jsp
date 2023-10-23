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
	<form class="from-horizontal custom-form" id="frm" action="/shop/member/findPw" method="post">
		<div class="form-group text-center">
			<h2>비밀번호 찾기</h2>
		</div>
		<div class="d-grid gap-3">
			<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="id">본인 아이디</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="text" name="memberId" id="memberId" /><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="pwd">본인 이메일</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="text" name="memberEmail" id="memberEmail" /><br>
			</div>
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<button class="btn btn-lg btn-success btn-block" type="submit">비밀번호 찾기</button><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<input class="btn btn-lg btn-warning btn-block" type="button" value="돌아가기" onclick="back()"><br>
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
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}

	function back(){
		location="/shop";
	}
</script>
</html>