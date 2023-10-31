<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	p {
		margin: 20px 0px;
	}
</style>
</head>
<body>
	<%@include file="../include/header.jsp" %>
	<div class="row">
		<div class="col-md-10" style="margin:45px; padding:25px;">
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
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>등록일</td>
								<th>조회수</th>
							</tr>
					</table>
					
					
					<div class="row">
						<span style="float: right; margin: 10px; padding: 10px;">
							<a href="/shop/notice/noticewrite" class="btn btn-primary">글쓰기</a>
						</span>
					</div>
					
					<div class="col-md-offset-3">
						<!-- 페이징 -->
					</div>
					
						
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n">-----</option>
								<option value="t">제목</option>
								<option value="c">내용</option>
								<option value="w">작성자</option>
								<option value="tc">제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input type="text" name="keyword" id="keywordInput" class="form-control"/>
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
</body>
</html>