<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.id_input_re_1{
		color : green;
		display : none;
	}
	
	.id_input_re_2{
		color : red;
		display : none;
	}
</style>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	<div class="row">
     
    <div class="col-xs-12 col-sm-12">
    <h2>&nbsp;</h2> 
    <h2 class="text-center">회원가입</h2>
    </div>        
     
    <div class="col-xs-3 col-sm-3"></div>   
    <div class="col-xs-8 col-sm-8">
         
      <div >      
        <p>&nbsp;</p>
         
        <form name="updateFrm" class="form-horizontal">
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label for="id">아이디</label>
            </div>
            <div class="col-sm-6 text-left">
                <input type="text" class="form-control" name="memberId" value="${member.memberId}" readonly>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="pwd">패스워드</label>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="memberPw" id="memberPw" placeholder="비밀번호 입력" minlength="8" maxlength="15">
            </div>
         </div>
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="pwdCk">패스워드 체크</label>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" name="pwdCheck" id="pwdCheck" placeholder="비밀번호 재확인">
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="name">이름</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memberName" value="${member.memberName}">
            </div>
         </div> 
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="phone">전화번호</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memberPhoneNumber" value="${member.memberPhoneNumber}">
            </div>
         </div>       
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="email">이메일</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memberEmail" value="${member.memberEmail}">
            </div>
         </div>   
          
          <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="zip_num">우편번호</label>
            </div>
            <div class="col-sm-6">
             <input type="text" class="form-control" name="address1" value="${member.address1}">
            </div>
         </div>   
         
            <div class="form-group" >
             <div class="col-sm-2 control-label">
                <label id="address1">주소</label>
             </div>
             <div class="col-sm-6">
                <input type="text" class="form-control" name="address2" value="${member.address2}">
             </div>   
           </div>
      
          <div class="form-group"> 
             <div class="col-sm-2 control-label">
                <label id="address1">상세주소</label>
             </div>
             <div class="col-sm-6"> 
               <input type="text" class="form-control" name="address3" value="${member.address3}">
               </div>
          </div>
          
         
         <div class="text-center">
            <div class="col-sm-10">
	            <input type="button" value="정보수정" class="btn btn-success btn-lg" id="update_btn">&nbsp;
	     		<input type="button" value="돌아가기" class="btn btn-warning btn-lg" id="back_btn">
            </div>
         </div>
         
        </form> 
      </div>
    </div>
 
</div>
<br><br>
<%@include file="../include/footer.jsp" %>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$("#update_btn").click(function(){
			//alert('수정 버튼 클릭됨');
			var memberPw = $("#memberPw").val();
			var pwdCheck = $("#pwdCheck").val();
			
			if(memberPw == ""){
				alert("비밀번호를 입력해 주세요");
				$("#memberPw").focus();
				return false;
			}
			
			// 비밀번호 정규식 
			var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			if($("#memberPw").val().match(regExp) == null){
				alert("비밀번호 형식에 맞지 않습니다.");
				$("#memberPw").focus();
				return false;
			}
			
			if(memberPw != pwdCheck){
				alert("입력하신 비밀번호를 다시 확인해 주세요");
				$("#pwdCheck").focus();
				return false;
			}
			
			var formObj = $("form[name='updateFrm']");
			formObj.attr("action", "/shop/member/memberUpdate");
			formObj.attr("method", "POST");
			formObj.submit();
		});
		
		$("#back_btn").click(function(){
			location="/shop";
		});
	});
</script>
</html>