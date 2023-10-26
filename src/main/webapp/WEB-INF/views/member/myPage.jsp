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
	<%@include file="../include/header.jsp"%>
	<div class="row">
		<!--768px 이상에서는 열 3개 병합-->
		<!--576px 이하에서는 열 4개 병합-->
		<div class="col-md-2 col-sm-4" style="padding: 30px;">
			<!--list-group : 수직 목록 생성-->
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action">HTML5</a>
				<a href="#" class="list-group-item list-group-item-action">CSS3</a>
				<a href="#" class="list-group-item list-group-item-action">ECMAScript5</a>
			</div>
			<br>
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action">Jquery</a>
				<a href="#" class="list-group-item list-group-item-action">API</a>
			</div>
			<br>
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action">공지사항</a>
				<a href="/shop/member/memberUpdatePage" class="list-group-item list-group-item-action">회원정보수정</a>
			</div>
		</div>
		<h2 style="padding: 30px;">마이페이지</h2>
	</div>
	
</body>
</html>