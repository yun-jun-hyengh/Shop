<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#p{
		margin: 35px;
		/*padding-right: 15px;*/
		padding-left: 150px;
	}
</style>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	<div class="row">
		<div class="col-md-10" id="p">
			<div class="form-group text-center">
				<h2>공지사항</h2>
			</div>
			<section id="container">
				<form role="form" method="get">
					
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="bvo" varStatus="i">
							<tr>
								<td>${bvo.bno}</td>
								<td><a href="/shop/notice/noticeRead${pagingMaker.makeFind(pagingMaker.cri.page)}&bno=${bvo.bno}">${bvo.title}</a></td>
								<td>${bvo.writer}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd" value="${bvo.regdate}"/></td>
								<th>${bvo.hit}</th>
							</tr>
						</c:forEach>
					</table>
					
					
					<div class="row">
						<span style="float: right; margin: 10px; padding: 10px;">
							<a href="/shop/notice/noticewrite" class="btn btn-primary">글쓰기</a>
						</span>
					</div>
					
					<div class="form-group text-center">
						<div class="col-md-offset-3" style="padding: 5px; margin: 5px;">
							<!-- 페이징 -->
							<c:if test="${pagingMaker.prev}">
								<button type="button" class="btn btn-theme03" onclick="goPage()" >◀◀</button>
							</c:if>
							
							<c:if test="${pagingMaker.prev}">
							<a href="/shop/notice/noticelist${pagingMaker.makeFind(pagingMaker.startPage - 1)}">
								<button type="button" class="btn btn-theme03">◀</button>
							</a>
							</c:if>
							
							<c:forEach begin="${pagingMaker.startPage}" end="${pagingMaker.endPage}" var="pNum">
								<a href="/shop/notice/noticelist${pagingMaker.makeFind(pNum)}">
									<button type="button" class="<c:out value="${pagingMaker.cri.page == pNum ? 'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>
							
							<c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
								<a href="/shop/notice/noticelist${pagingMaker.makeFind(pagingMaker.endPage + 1)}">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>
							
							<c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
								<a href="/shop/notice/noticelist${pagingMaker.makeFind(finalEndPage)}">
									<button type="button" class="btn btn-theme03">▶▶</button>
								</a>
							</c:if>
						</div>
					</div>
					
					
						
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="findType" class="form-control">
								<option value="n" <c:out value="${fCri.findType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t" <c:out value="${fCri.findType == 't' ? 'selected' : '' }"/>>제목</option>
								<option value="c" <c:out value="${fCri.findType == 'c' ? 'selected' : '' }"/>>내용</option>
								<option value="w" <c:out value="${fCri.findType == 'w' ? 'selected' : '' }"/>>작성자</option>
								<option value="tc">제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="findword" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						 
						
					</div>
				</form>
			</section>
		</div>
	</div>
	<%@include file="../include/footer.jsp" %>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	var modifyResult = "${modifyResult}";
	if(modifyResult == 'modSuccess'){
		alert("게시글 수정이 완료되었습니다.");
	}
	//first페이지로 이동
  	function goPage() { location.href="/shop/notice/noticelist?page=${pagingMaker.cri.page = 1}&numPerPage=${pagingMaker.cri.numPerPage}"; }
	
	$(document).ready(function(){
		$("#searchBtn").on("click", function(e){
			self.location="/shop/notice/noticelist" + "${pagingMaker.makeURI(1)}"
						+"&findType="+$("select option:selected").val()
						+"&keyword="+$("#findword").val();
		});
	});
</script>
</html>