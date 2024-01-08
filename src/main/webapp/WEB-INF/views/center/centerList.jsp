<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#boardList{
		margin: 13px;
		padding: 11px;
	}
</style>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	<div class="row">
		<div class="col-xs-12 col-sm-12">
	    <h2>&nbsp;</h2> 
	    	<h2 class="text-center">고객센터</h2>
	    </div>
	</div>
	<div id="boardList">
	    	<div class="card mb-5">
						<div class="card-header bg-primary p-3">
							<div class="boardTitle d-inline-block fs-24 text-white">카테고리 | 제목</div>
							<div class="d-inline-block fs-18 float-right btn btn-sm btn-light text-primary font-weight-bold">
								10000 원
							</div>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-4">
									<div class="w-100 h-100 border d-flex justify-content-center align-items-center" style="margin: 3px; padding: 3px;">
										<img src="../resources/img/p2.jpg" style="max-width:150%; height:auto; max-height:350px;" />
									</div>
								</div>
								<div class="boardContent col-md-6" style="maring: 10px; padding: 50px; font-size: 2em;">
									내용
								</div>
							</div>
						</div>
						<div class="card-footer text-muted" style="line-height:38px;">
							<span class="boardWdate">
								2022-02-01
							</span>
							
							<span class="boardCommentCount fs-12 pl-3">
								댓글수 <span class="badge badge-dark ml-1" style="background-color:#999;">10</span>
							</span>
							
							<span class="boardWriter fs-12 pl-3">
								작성자 : 윤준형
							</span>
							
							<div class="float-right">
								<button type="button" class="btn btn-primary" onclick="#">수정</button>
									<button type="button" class="btn btn-danger" onclick="#">삭제</button>
								<button type="button" class="btn btn-primary" onclick="#">더보기</button>
							</div>
						</div>
					</div>
	    </div>
	    
	    <%@include file="../include/footer.jsp" %>
</body>
</html>