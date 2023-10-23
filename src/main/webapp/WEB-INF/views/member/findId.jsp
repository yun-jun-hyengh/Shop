<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form class="from-horizontal custom-form" id="frm">
		<div class="form-group text-center">
			<h2>아이디찾기</h2>
		</div>
		<div class="d-grid gap-3">
			<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="id">본인이름</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="text" name="memberName" id="memberName" /><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="pwd">이메일</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="text" name="memberEmail" id="memberEmail" /><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="pwd">휴대폰번호</label> 
			</div>
			<div class="col-sm-12 text-left">
				<input class="form-control" style="height:45px" type="text" name="memberPhoneNumber" id="memberPhoneNumber" /><br><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<input class="btn btn-lg btn-success btn-block" type="button" value="아이디찾기" onclick="find()"><br>
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
	function find(){
		var memberName = $("#memberName").val();
		var memberEmail = $("#memberEmail").val();
		var memberPhoneNumber = $("#memberPhoneNumber").val();
		console.log(memberName);
		console.log(memberEmail);
		console.log(memberPhoneNumber);
		var formData = {'memberName' : memberName, 'memberEmail' : memberEmail, 'memberPhoneNumber' : memberPhoneNumber};
		$.ajax({
			type : "post",
			url : "/shop/member/findIdSuccess",
			data : formData,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType : "json",
			success : function(data){
				console.log(data);
				var idList = data.memberId;
				//console.log(idList);
				var idLength = idList.length;
				var idfind = idList.substring(1, idLength - 1);
				//console.log(idfind);
				alert("회원님의 아이디는 " + idfind + "입니다.");
			}
		});
	}
	
	function back(){
		location="/shop";
	}
</script>
</html>