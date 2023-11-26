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
	#reply {
		margin: 39px;
		padding: 19px;
		margin-right: 1250px;
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
							</p>
							<div class="uploadResult">
								<ul></ul>
							</div> 
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
			
			<!-- 댓글 수정 화면 -->
			<div class="form-panel" id="modifyDiv" style="margin: 40px; padding: 25px;">
				<span class="title-dialog"></span>번 댓글
				<div class="form-group">
					<label class="col-sm-2 col-sm-2 control-label">수정할 내용</label>
						<div class="col-sm-10">
							<input type="text" name="replyContent" id="replyContent"
								class="form-control" /><br>
						</div>
				</div>
				<div class="form-group" style="float: right;">
					<button id="reModifyBtn" class="btn btn-primary">댓글수정</button>
					<button id="reDelBtn" class="btn btn-primary">댓글삭제</button>
					<button id="closeBtn" class="btn btn-primary">닫기</button>
				</div>
			</div>
			
			<div class="border-top border-bottom" style="margin:35px; padding: 18px; maring-left: 10px;">
				<ul id="reply" style="width: 500px;"></ul>
				<ul class="pgeNumList">
				</ul>
			</div>
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
						$(".uploadResult ul li").each(function(i, li){
							var fileName = encodeURIComponent($(li).data("filetype") ? $(li).data("uploadpath") + "/t_" + $(li).data("uuid") + "_" + $(li).data("filename") : 
								$(li).data("uploadpath") + "/" + $(li).data("uuid") + "_" + $(li).data("filename"));
							$.ajax({
								url: "/shop/notice/deleteFile",
								type: "post",
								data: {fileName: fileName, fileType: $(li).data("fileType")},
								success: function(){
									
								}
							});
						});
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
	var retrievedValue = sessionStorage.getItem('member');
	console.log(retrievedValue);

	function reListAll(){
		$.getJSON("/shop/replies/selectAll/"+${noticeVO.bno}, function(data){
			var str = "";
			$(data).each(function(){
				 str += "<li data-rno='"+this.rno+"'class='reList'>"+
			        '<div class="text-justify" style="padding: 4px; margin: 7px; font-size: 15px;">' +
			        '작성자 : <span class="replyer">' + this.replyer + '<span>' + '   |   내용 : <span class="replyerContent">' + this.replyContent + '</span>' + '<span style="color: #ff52a0;"><button type="button" class="btn float-end btn-secondary opacity-75 updateReply" style="float: right;">수정</button></span>'+
			        '</div>' +
			        '</li>';
			});
			$("#reply").html(str);
		});
	}
	reListAll();

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
					reListAll();
				}
			}
		});
	});
	
	// 수정 버튼 클릭시 
	$("#reply").on("click", ".updateReply", function(){
		var listItem = $(this).closest('li');
		
		var rno = listItem.data('rno');
		var replyer = listItem.find('.replyer').text();
		var replyContent = listItem.find('.replyContent').text();
		
		$(".title-dialog").html(rno);
		$("#replyContent").val(replyer + replyContent);
		$("#modifyDiv").show();
	});
	
	$("#modifyDiv").hide(); // 숨기고 있다가 
	
	$("#closeBtn").on("click", function(){ // 열리면 닫기 버튼 클릭시 닫기 !! 
		$("#modifyDiv").hide();
	});
	
	$("#reDelBtn").on("click", function(){
		var rno = $(".title-dialog").html();
		var replyContent = $("#replyContent").val();
				
		$.ajax({
			type : 'delete',
			url : '/shop/replies/reDel/'+rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result){
				console.log("result:"+result);
				if(result=='success'){
					alert("댓글 삭제 성공!!!");
					$("#modifyDiv").hide(); // 수정창 숨김 !! 
					reListAll();
				}
			}
		});//ajax
	});
	
	$("#reModifyBtn").on("click", function(){
		var rno = $(".title-dialog").html();
		var replyContent = $("#replyContent").val();
		
		$.ajax({
			type:'put',
			url:'/shop/replies/' + rno,
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			data:JSON.stringify({replyContent:replyContent}),
			dataType : 'text',
			success : function(result){
				if(result == 'success'){
					alert("댓글이 수정되었습니다.");
					$("#modifyDiv").hide();
					reListAll();
				}
			}
		});
	});
	
	
	// 첨부파일
	$(document).ready(function(e){
		var $uploadResult = $(".uploadResult ul");
		
		$.getJSON("/shop/notice/files", {bno: "${noticeVO.bno}"}, function(files){
			showUploadResult(files);
		});
		
		function showUploadResult(files){
			var str = "";
			
			$(files).each(function(i, file){
				
				if(!file.fileType){
					str += "<li data-filename='" + file.fileName + "' data-uuid='" + file.uuid + "' data-uploadpath='" + file.uploadPath + "' data-filetype='" + file.fileType + "'>";
					str += "<div>";
					str += "<img src='${pageContext.request.contextPath}/resources/img/attach.png' width='300' height='300'>";
					str += "</div>";
					str += "<span>" + file.fileName + "</span>"
					str += "</li>";
					
				}else{
					var fileName = encodeURIComponent(file.uploadPath + "/t_" + file.uuid + "_" + file.fileName);
					console.log(file.fileType);
					str += "<li data-filename='" + file.fileName + "' data-uuid='" + file.uuid + "' data-uploadpath='" + file.uploadPath + "' data-filetype='" + file.fileType + "'>";
					str += "<div>";
					str += "<img src='/shop/notice/display?fileName=" + fileName + "' width='300' height='300'>";
					str += "</div>";
					str += "<span>" + file.fileName + "</span>"
					str += "</li>";
				}
			});
			$uploadResult.append(str);
		}
	});
	
</script>
</html>