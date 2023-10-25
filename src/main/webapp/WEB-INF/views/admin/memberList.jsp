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
<title>관리자페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/admin/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
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
			<main>
			
			<div class="container-fluid px-4">
				<h1 class="mt-4">회원정보</h1>
				
				<div class="card mb-4">
					<div class="card-header">
						
						<span style="float: right;">
							<button class="btn btn-outline-secondary">EXCEL</button>
						</span>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr>
										<th>번호</th>
										<th>사용자 ID</th>
										<th>이름</th>
										<th>휴대폰 번호</th>
										<th>이메일</th>
										<th>적립 포인트</th>
										<th>회원권한</th>
										<th>회원등급</th>
										<th>권한수정</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="mList">
										<tr>
											<td>${mList.memberNum}</td>
											<td>${mList.memberId}</td>
											<td>${mList.memberName}</td>
											<td>${mList.memberPhoneNumber}</td>
											<td>${mList.memberEmail}</td>
											<td>${mList.point}</td>
											<c:if test="${mList.adminCk == 1}">
												<td>관리자</td>
											</c:if>
											<c:if test="${mList.adminCk == 0}">
												<td>일반사용자</td>
											</c:if>
											<td>${mList.codeName}</td>
											<td><button class="btn btn-danger"
													onclick="updateBtn(${mList.memberNum}, 1)">수정</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 페이지 버튼 -->
					<div class="showback" align="center">
						<div class="btn-group">
							<c:if test="${pagingMaker.prev}">
								<button type="button" class="btn btn-theme03" onclick="goPage()">◀◀</button>
							</c:if>

							<c:if test="${pagingMaker.prev}">
								<a
									href="/shop/admin/memberlist${pagingMaker.makeFind(pagingMaker.startPage - 1)}">
									<button type="button" class="btn btn-theme03">◀</button>
								</a>
							</c:if>

							<c:forEach begin="${pagingMaker.startPage}"
								end="${pagingMaker.endPage}" var="pNum">
								<a href="/shop/admin/memberlist${pagingMaker.makeFind(pNum)}">
									<button type="button"
										class="<c:out value="${pagingMaker.cri.page == pNum ? 'btn btn-theme':'btn btn-default'}"/>">${pNum}</button>
								</a>
							</c:forEach>

							<c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
								<a
									href="/shop/admin/memberlist${pagingMaker.makeFind(pagingMaker.endPage + 1)}">
									<button type="button" class="btn btn-theme03">▶</button>
								</a>
							</c:if>

							<c:if test="${pagingMaker.next && pagingMaker.endPage > 0}">
								<a
									href="/shop/admin/memberlist${pagingMaker.makeFind(finalEndPage)}">
									<button type="button" class="btn btn-theme03">▶▶</button>
								</a>
							</c:if>
						</div>
					</div>

					<div class="input-group justify-content-center">

						<select class="col-2" name="findType">
							<option value="N"
								<c:out value="${fcri.findType == 'N' ? 'selected' : '' }"/>>이름</option>
							<option value="P"
								<c:out value="${fcri.findType == 'P' ? 'selected' : '' }"/>>휴대폰
								번호</option>
							<option value="NP"
								<c:out value="${fcri.findType == 'NP' ? 'selected' : '' }"/>>이름+휴대폰
								번호</option>
						</select> <input class="col-3" type="text" name="keyword" id="findword"
							value="${fcri.keyword}" />
						<button id="findBtn" class="btn btn-outline-secondary">검색</button>
						
					</div>
				</div>
			</main>
			</div>
			
		</div>
		<br>
		<br>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function goPage() {
		location.href = "/shop/admin/memberlist?page=${pagingMaker.cri.page = 1}&numPerPage=${pagingMaker.cri.numPerPage}";
	}
	
	$(document).ready(function(){
		$("#findBtn").on("click", function(e){
			//console.log("클릭됨");
			self.location = "/shop/admin/memberlist" + "${pagingMaker.makeURI(1)}"
						+"&findType="+$("select option:selected").val()
						+"&keyword="+$("#findword").val();
		});
	});
	
	// 회원등급 수정 버튼 
	function updateBtn(memberNum, adminCk) {
		console.log("버튼클릭됨");
		console.log(memberNum);
		console.log(adminCk);
		$.ajax({
			url : "/shop/admin/roleModify?memberNum=" + memberNum + "&adminCk=" + adminCk,
			type : "post",
			success : function(data){
				console.log(data);
				alert("회원 권한이 변경되었습니다.");
				history.go(0);
			}
		});
	}
</script>
</html>