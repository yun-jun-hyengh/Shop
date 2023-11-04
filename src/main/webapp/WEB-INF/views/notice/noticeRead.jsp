<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	p {
		margin: 20px 0px;
	}
	
	#breack{
		padding-right: 55px;
		padding-left: 55px;
		margin: 15px;  
	}
	
	#footer{
	  position : relative;
	  transform: translateY(350px);
	}
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="row ">
		<form name="readForm" role="form">
			<input type="hidden" id="bno" name="bno" value="${noticeVO.bno}">
		</form>
		<div class="form-group text-center" style="margin:35px;">
				<h2>상세페이지</h2>
		</div>
		<div class="col-md-12 breack" id="breack">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th width="10%">제목</th>
						<th width="60%">${noticeVO.title}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${noticeVO.regdate}" /></td>
					</tr>
					<tr>
						<td>글쓴이</td>
						<td>${noticeVO.writer} <span style='float: right'>조회 :
								${noticeVO.hit}</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p>
								<font size="10em">
									<div class="text-break" style="white-space: pre-line;">
										${noticeVO.content}
									</div>
								</font>
							</p> <!--<c:forEach var="file" items="${freefile}">
								<img src="/img/${file.STORED_FILE_NAME}">
								<br>

							</c:forEach> -->

						</td>
					</tr>

				</tbody>
			</table>
			<table id="commentTable" class="table table-condensed"></table>

			<table class="table table-condensed">
				<thead>
					<tr>
						<td><span style='float: right'>
								<button type="submit" id="list_btn" class="btn btn-default">목록</button>
								<button type="submit" id="update_btn" class="btn btn-default">수정</button>
								<button type="submit" id="delete_btn" class="btn btn-default">삭제</button>
						</span></td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<footer id="footer">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-6">
                        <div class="copyright">
                            <p>@ 2016 - Design By <span><a href="">&#9798;</a></span></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="designer">
                            <p>A Design By <a href="#">XpeedStudio</a></p>
                        </div>
                    </div>
                </div>
                <!--End of row-->
            </div>
            <!--End of container-->
       
	</footer>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	var bno = $("#bno").val();
	//console.log(bno);
	$(document).ready(function(){
		// 목록
		$("#list_btn").click(function(){
			location.href = "/shop/notice/noticelist";
		});
		
		// 삭제 
		$("#delete_btn").click(function(){
			$.ajax({
				url:"/shop/notice/noticeDel?bno="+bno,
				type:"post",
				success:function(data){
					//console.log(data);
					if(data == "success"){
						alert("게시글 삭제가 완료되었습니다.");
						location.href = "/shop/notice/noticelist";
					}
				}
			});
		});
	});
</script>
</html>