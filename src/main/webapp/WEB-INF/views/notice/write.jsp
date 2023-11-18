<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
	#textStyle{
		line-height: 2.2;
	}
</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/shop"><img
			src="${pageContext.request.contextPath}/resources/img/logo.png"
			alt=""></a>
		<!-- Sidebar Toggle-->

		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="/shop/admin/visitlist"> <!--  <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div> -->
							방문자정보
						</a>
						<!--  <div class="sb-sidenav-menu-heading">Interface</div> -->
						<a class="nav-link collapsed" href="/shop/admin/memberlist"> <!--  <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div> -->
							회원리스트
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		
		<div id="layoutSidenav_content">
			<main class="col-md-10 ms-sm-auto row">
				<form class="col d-block" method="POST" enctype="multipart/form-data" id="frm">
					<div class="row ms-sm-auto">
						<div class="col-md-2"></div>
						<div class="col-md-8" style="width: 86.66666667%;">
							<h2 class="text-center breack" id="textStyle">게시글 쓰기</h2>
							
								<table class="table table-striped">
									<tr>
										<td class="align-middle text-center">제목</td>
										<td><input type="text"  class="form-control" name="title" id="title"></td>
									</tr>
									<tr>
										<td class="align-middle text-center">작성자</td>
										<td><input type="text"  class="form-control" name="writer" id="writer" value="${member.memberName}" readonly="readonly"></td>
									</tr>                 
									<tr>
										<td class="align-middle text-center">글내용</td>
										<td><textarea rows="10" cols="50" name="content" id="content" class="form-control"></textarea></td>
									</tr>
									<tr>
										<td class="align-middle text-center">첨부파일</td>
										<!--  <td><input type="file" class="form-control" name="file" multiple="multiple"></td> -->
										<td><input name="multipartFiles" type="file" multiple/></td>
									</tr>
									<tr>
										<td>
											<td id="fileIndex">
											</td>
										</td>
									</tr>
									<tr>
										<td colspan="2"  class="text-center">
											<input type="button" value="글쓰기" class="btn" id="writeBtn" style="background-color:rgb(210,244,234) ;">
											<input type="button" value="다시작성" class="btn" id="backBtn" style="background-color:rgb(210,244,234) ;" > 
											
										</td>
									</tr>
								</table>
						</div>
					</div>
				</form>
			</main>
		</div>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).on("click", "#writeBtn", function(e){
		var title = $("#title").val();
		var writer = $("#writer").val();
		var content = $("#content").val();
		
		if(title == ""){
			alert("제목을 입력해 주세요");
			return;
		}
		
		if(content == ""){
			alert("내용을 입력해 주세요");
			return;
		}
		
		$("#title").val(title);
		$("#writer").val(writer);
		$("#content").val(content);
		
		var formData = $("#frm").serialize();
		
		$.ajax({
			url : "/shop/notice/noticewrite",
			data : formData,
			dataType : "text",
			type : "POST",
			success : function(data){
				if(data == "ok"){
					alert("공지사항 등록이 완료되었습니다.");
					location.href = "/shop/notice/noticelist";
				}
			}
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function(e){
		var regex = new RegExp("(.*/)\.(exe|sh|zip|alz)$");
		var maxSize = 1024 * 1024 * 20; //20MB
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			var $inputFile = $(this);
			var files = $inputFile[0].files;
			//console.log(files);
			
			for(let i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("multipartFiles", files[i]);
			}
			$.ajax({
				url : "/shop/notice/noticeUpload",
				processData: false,
				contentType: false,
				data: formData,
				type: "post",
				dataType: "json",
				success: function(result){
					alert("업로드 완료");
				}
			});
		});
		
		function checkExtension(fileName, fileSize){
			if(regex.test(fileName)){
				alert("업로드 할 수 없는 파일 형식입니다.");
				return false;
			}
			
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			return true;
		}
	});
</script>
</html>