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
	<form class="from-horizontal custom-form" method="post" id="deleteForm" name="deleteForm">
		<input type="hidden" name="memberId" id="memberId" value="${member.memberId}">
		<div class="form-group text-center">
			<h2>SSJ 쇼핑몰을 탈퇴하시겠습니까?</h2><br>
			<h3>회원탈퇴를 하시면 현재 보유하고 계신 포인트는 자동 소멸됩니다.</h3>
		</div>
		<div class="d-grid gap-3">
			<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="id">비밀번호 입력</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="password" name="memberPw" id="memberPw" /><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="pwd">비밀번호 재확인</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="password" name="memberPw2" id="memberPw2"/><br><br>
			</div>
			
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<input class="btn btn-lg btn-success btn-block" type="button" value="회원탈퇴" id="deletee"><br>
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
	$(document).ready(function(){
		$("#deletee").on("click", function(){
			if($("#memberPw").val() == ""){
				alert("비밀번호를 입력해주세요");
				$("#memberPw").focus();
				return false;
			}
			
			if($("#memberPw2").val() == ""){
				alert("비밀번호 확인을 입력해주세요");
				$("#memberPw2").focus();
				return false;
			}
			
			if($("#memberPw").val() != $("#memberPw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#memberPw").focus();
				return false;
			}
			
			$.ajax({
				url : "/shop/member/pwCheck",
				type : "POST",
				dataType : "json",
				data : $("#deleteForm").serializeArray(),
				success : function(data){
					//console.log($("#memberId").val());
					//console.log(data);
				}
			});
		});
	});
	
</script>
</html>