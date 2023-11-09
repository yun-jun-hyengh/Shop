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

#breack {
	padding-right: 55px;
	padding-left: 55px;
	margin: 15px;
}

#footer {
	position: relative;
	transform: translateY(350px);
}
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div class="row ">
		<form name="readForm" role="form">
			<input type="hidden" id="bno" name="bno" value="${noticeVO.bno}">
			<input type="hidden" name="page" value="${fCri.page}"> <input
				type="hidden" name="numPerPage" value="${fCri.numPerPage}">
			<input type="hidden" name="findType" value="${fCri.findType}">
			<input type="hidden" name="keyword" value="${fCri.keyword}">
		</form>
		<div class="form-group text-center" style="margin: 35px;">
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
						<td>${noticeVO.writer}<span style='float: right'>조회 :
								${noticeVO.hit}</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p>
								<font size="10em">
									<div class="text-break" style="white-space: pre-line;">
										${noticeVO.content}</div>
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
		<div class="row mt">
			<div class="col-lg-12">
				<div class="form-panel" style="margin: 40px; padding: 25px;">
					<div class="form-group">
						<h3>댓글작성</h3>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="replyer"
								id="writer" value="${member.memberName}" readonly="readonly"><br>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">댓글</label>
						<div class="col-sm-10">
							<input type="text" name="replyContent" id="addReContent"
								class="form-control" /><br>
						</div>
					</div>
					<div class="form-group" style="float: right;">
						<button id="submitBtn" type="submit" class="btn btn-primary">댓글
							작성</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 댓글목록 -->
		<!--  <div class="form-group">
			<ul class="justify-content-start bg-light" id="reply" style="margin: 16px; padding-left: initial; font-size: 30px; color: #15e1a1;"></ul>
			<ul class="pgeNumList"></ul>
		</div> -->
		<div class="border-top border-bottom" style="margin:35px; padding: 18px; maring-left: 10px;">
			<div style="margin-top: 10px"></div>
			<c:forEach items="${replyList}" var="replyList">
				<div><p class="fw-bold" style="padding: 4px; margin: 7px; font-size: 20px;">작성자 : ${replyList.replyer}</p></div>
				<div class="text-break" style="padding: 4px; margin: 7px;"><p>내용 : ${replyList.replyContent}</p></div>
				<div><p class="fw-light" style="padding: 4px; margin: 7px;">작성날짜 : <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></p></div>
				<button type="button" class="btn float-end btn-secondary opacity-75 deleteReply" style="margin-left: 10px">삭제</button> 
				<button type="button" class="btn float-end btn-secondary opacity-75 deleteReply" style="margin-left: 10px">수정</button>
			</c:forEach>
		</div>	
	</div>
	<footer id="footer">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-6">
					<div class="copyright">
						<p>
							@ 2016 - Design By <span><a href="">&#9798;</a></span>
						</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="designer">
						<p>
							A Design By <a href="#">XpeedStudio</a>
						</p>
					</div>
				</div>
			</div>
			<!--End of row-->
		</div>
		<!--End of container-->

	</footer>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	var bno = $("#bno").val();
	//console.log(bno);
	var formObj = $("form[role='form']");
	$(document).ready(function() {
		// 목록
		$("#list_btn").click(function() {
			location.href = "/shop/notice/noticelist?page=${fCri.page}"
							+ "&numPerPage=${fCri.numPerPage}"
							+ "&findType=${fCri.findType}&keyword=${fCri.keyword}";
		});

		// 삭제 
		$("#delete_btn").click(function() {
			$.ajax({
				url : "/shop/notice/noticeDel?bno="+ bno,
				type : "post",
				success : function(data) {
					//console.log(data);
					if (data == "success") {
						alert("게시글 삭제가 완료되었습니다.");
						location.href = "/shop/notice/noticelist?page=${fCri.page}"
										+ "&numPerPage=${fCri.numPerPage}"
										+ "&findType=${fCri.findType}&keyword=${fCri.keyword}";
					}
				}
			});
		});

		// 수정 
		$("#update_btn").click(function() {
			formObj.attr("action","/shop/notice/noticeModifyPage");
			formObj.attr("method", "GET");
			formObj.submit();
		});
	});
</script>
<script type="text/javascript">

	// 댓글 작성 
	$("#submitBtn").on("click", function(){
		var reWriter = $("#writer").val();
		var reContent = $("#addReContent").val();
		// url 주소 최상위 루트 경로가 shop이므로 반드시 명시해 주어야 한다 
		// 아니면 404 에러남
		$.ajax({
			type:'post',
			url:'/shop/replies',
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data: JSON.stringify({
				bno : ${noticeVO.bno},
				replyer : reWriter,
				replyContent : reContent
			}),
			success : function(result){
				if(result == 'success'){
					alert("댓글 등록 성공");
					history.go(0);
				}
			}
		});
	});
	
	$("#reDelBtn").on("click", function(){
		
		
	});
</script>
</html>