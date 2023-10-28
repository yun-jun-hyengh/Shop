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
                <input type="text" class="form-control" name="memberId" id="memberId" placeholder="4 ~ 12자리 아이디 입력" minlength="4" maxlength="12">
            </div>
            <div class="col-sm-2">
            	<a class="btn btn-danger" id="idChk" onclick="fn_idChk()" data-value="N">중복확인</a>
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
                <input type="text" class="form-control" name="memberName" id="memberName" placeholder="이름입력">
            </div>
         </div> 
         
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="phone">전화번호</label>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" name="memberPhoneNumber" id="memberPhoneNumber" placeholder="(-)하이픈을 제외하고 전화번호 입력">
            </div>
         </div>       
          
         <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="email">이메일</label>
            </div>
            <div class="col-sm-6">
                <input class="form-control" name="memberEmail" id="memberEmail" placeholder="이메일 입력">
            </div>
            <div class="col-sm-2">
            	<!--  <input type="button" id="mail_check_button" value="인증번호" class="btn btn-primary"> -->
          		<a class="btn btn-primary" id="mail_check_button" data-value="N">인증번호</a>
            </div>
            
         </div>   
         
         <div class="form-group">
         	<div class="col-sm-2 control-label">
         		<label id="autoemail">인증번호 입력</label>
         	</div>
         	<div class="col-sm-6">
         		<input class="form-control" id="mail_check_input" placeholder="인증번호를 입력해주세요">
         	</div>
         </div>
      
          
          <div class="form-group">
            <div class="col-sm-2 control-label">
                <label id="zip_num">우편번호</label>
            </div>
            <div class="col-sm-3">
             <input type="text" name="address1" id="address1" placeholder="우편번호" class="form-control">
            </div>
            <div class="col-sm-3">
            <input type="button" onclick="execution_daum_address()" value="우편번호 찾기" class="btn btn-primary">
          
            </div>
         </div>   
         
            <div class="form-group" >
             <div class="col-sm-2 control-label">
                <label id="address1">주소</label>
             </div>
             <div class="col-sm-6">
                <input type="text" name="address2" id="address2" placeholder="주소" class="form-control">
             </div>   
           </div>
      
          <div class="form-group"> 
             <div class="col-sm-2 control-label">
                <label id="address1">상세주소</label>
             </div>
             <div class="col-sm-6"> 
               <input type="text" name="address3" id="address3" placeholder="상세주소" class="form-control">
               </div>
          </div>
          
         
         <div class="text-center">
            <div class="col-sm-9">
	            <input type="button" value="회원가입" class="btn btn-success btn-lg" id="btn_submit">&nbsp;
	     		<input type="reset" value="가입취소" class="btn btn-warning btn-lg">
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 다음 주소 연동 */
	var code = "";
	function execution_daum_address(){
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 주소변수 문자열과 참고항목 문자열 합치기
	      			addr += extraAddr;
	            
	            } else {
	                addr += ' ';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //$("#address_input_1").val(data.zonecode);
	            $("[name=address1]").val(data.zonecode);	// 대체가능
	            //$("#address_input_2").val(addr);
	            $("[name=address2]").val(addr);			// 대체가능
	            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	            $("[name=address3]").attr("readonly",false);
	            $("[name=address3]").focus();
	            
	        }
	    }).open();   
	    
	}
	
	$(function(){
		$("#btn_submit").click(function(){
			var memberId = $("#memberId").val();
			var memberPw = $("#memberPw").val();
			var pwdCheck = $("#pwdCheck").val();
			var memberName = $("#memberName").val();
			var memberPhoneNumber = $("#memberPhoneNumber").val();
			var memberEmail = $("#memberEmail").val();
			var address1 = $("#address1").val();
			var address2 = $("#address2").val();
			var address3 = $("#address3").val();
			var idChk = $("#idChk").data('value');
			var mail_check_button = $("#mail_check_button").data('value'); // 인증버튼 클릭 유무 
			var mail_check_input = $("#mail_check_input").val(); // 인증번호 입력 란 
			
			//console.log(memberId);
			//console.log(memberPw);
			//console.log(pwdCheck);
			//console.log(memberName);
			//console.log(memberPhoneNumber);
			//console.log(memberEmail);
			//console.log(address1);
			//console.log(address2);
			//console.log(address3);
			console.log(idChk);
			if(memberId == ""){
				alert("아이디를 입력해 주세요");
				$("#memberId").focus();
				return false;
			}
			
			// 아이디 정규식
			if(($("#memberId").val().length < 4)){
				alert("아이디를 4자리 이상 입력하세요");
				$("#memberId").focus();
				return false;
			}
			
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
			
			if(memberName == ""){
				alert("이름을 입력해 주세요");
				$("#memberName").focus();
				return false;
			}
			
			if(memberPhoneNumber == ""){
				alert("전화번호를 입력해 주세요");
				$("#memberPhoneNumber").focus();
				return false;
			}
			
			if(memberEmail == ""){
				alert("이메일을 입력해 주세요");
				$("#memberEmail").focus();
				return false;
			}
			
			if(address1 == ""){
				alert("우편번호를 입력해 주세요");
				$("#address1").focus();
				return false;
			}
			
			if(address2 == ""){
				alert("주소를 입력해 주세요");
				$("#address2").focus();
				return false;
			}
			
			if(address3 == ""){
				alert("상세주소를 입력해 주세요");
				$("#address3").focus();
				return false;
			}
			
			if(idChk == "N"){
				alert("중복확인 버튼을 눌러주세요");
				return false;
			}
			
			if(mail_check_button == "N"){
				alert('이메일 인증을 진행해 주세요');
				return false;
			}
			
			if(code != mail_check_input){
				alert('인증번호가 다릅니다.');
				return false;
			} else if(code == mail_check_input){
				alert('이메일 인증이 완료되었습니다.');
			}
			
			
			var formData = $("#frm").serialize();
			
			$.ajax({
				type: "POST",
				data: formData,
				url: "/shop/member/registerSuccess",
				dataType: "text",
				
				success: function(result){
					if(result == "ok"){
						alert("회원가입이 완료되었습니다. 즐거운 쇼핑되세요");
						location="/shop/member/login";
					}
				},
				error: function(){
					console.log('오류발생');
				}
			});
			
		});
	});
	
	function fn_idChk(){
		$.ajax({
			url : "/shop/member/idChk",
			type : "post",
			dataType : "json",
			data : {"memberId" : $("#memberId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 아이디 입니다.");
				} else if(data == 0){
					$("#idChk").data("value", "Y");
					alert("사용가능한 아이디입니다.");
					console.log($("#idChk").data("value"));
				}
			}
		});
	}
	
	// 인증번호 이메일 전송 
	$("#mail_check_button").click(function(){
		//console.log("클릭됨");
		var email = $("#memberEmail").val();
		if(email == ""){
			alert('이메일을 입력해 주세요.');
			return false;
		} 
		$.ajax({
			type:"GET",
			url : "/shop/member/mailCheck?email=" + email,
			success : function(data){
				//console.log("data : " + data);
				alert('본인 이메일로 인증번호를 전송하였습니다.');
				code = data;
				$("#mail_check_button").data('value',"Y");
			}
		});
	});
	
	// 문자열이 영어, 숫자인지 확인하는 메소드 
	function checkEngNumber(value){
		var count = 0;

        for(var i=0; i<value.length; i++){
            if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=48 && value.charCodeAt(i)<=57)){
                count += 1;
            }
        }

        //카운트 수와 문자의 길이가 같다면 true
        if(count === (value.length)){
            return true;
        } else{
            return false;
        }
	}
	
	// 영어 한글인지 확인 
	function checkKorEng(value){
		var count = 0;

        for(var i=0; i<value.length; i++){
            console.log(value.charCodeAt(i));
            if((value.charCodeAt(i)>=65 && value.charCodeAt(i)<=90) || (value.charCodeAt(i)>=97 && value.charCodeAt(i)<=122) || (value.charCodeAt(i)>=44032 && value.charCodeAt(i)<=55203)){
                count += 1;
            }
        }

        if(count === (value.length)){
            return true;
        } else{
            return false;
        }
	}
</script>
</html>