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
         
        <form id="frm" class="form-horizontal">
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label for="id">아이디</label>
            </div>
            <div class="col-sm-6 text-left">
                <input type="text" class="form-control" value="${member.memberId}" readonly>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="name">이름</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" value="${member.memberName}" readonly>
            </div>
         </div> 
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="phone">전화번호</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" value="${member.memberPhoneNumber}" readonly>
            </div>
         </div>       
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="email">이메일</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" value="${member.memberEmail}" readonly>
            </div>
         </div>   
          
          <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="zip_num">우편번호</label>
            </div>
            <div class="col-sm-6">
             <input type="text" class="form-control" value="${member.address1}" readonly>
            </div>
         </div>   
         
            <div class="form-group" >
             <div class="col-sm-2 control-label">
                <label id="address1">주소</label>
             </div>
             <div class="col-sm-6">
                <input type="text" class="form-control" value="${member.address2}" readonly>
             </div>   
           </div>
      
          <div class="form-group"> 
             <div class="col-sm-2 control-label">
                <label id="address1">상세주소</label>
             </div>
             <div class="col-sm-6"> 
               <input type="text" class="form-control" value="${member.address3}" readonly>
               </div>
          </div>
          
         
         <div class="text-center">
            <div class="col-sm-9">
	            <input type="button" value="정보수정" class="btn btn-success btn-lg">&nbsp;
	     		<input type="reset" value="돌아가기" class="btn btn-warning btn-lg">
            </div>
         </div>
         
        </form> 
      </div>
    </div>
 
</div>
<br><br>
<%@include file="../include/footer.jsp" %>
</body>
</html>