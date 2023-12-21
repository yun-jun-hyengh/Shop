<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/admin/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style type="text/css">
	.custom-text-size{
		font-size: 27px;
	}
</style>
<title>Insert title here</title>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/shop"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
            <!-- Sidebar Toggle-->
            
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="/shop/admin/visitlist">
                                <!--  <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div> -->
                                	방문자정보	
                            </a>
                            <!--  <div class="sb-sidenav-menu-heading">Interface</div> -->
                            <a class="nav-link collapsed" href="/shop/admin/memberlist">
                                <!--  <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div> -->
                                	회원리스트
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="layout-static.html">Static Navigation</a>
                                    <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                	상품등록	
                            </a>
                            
                            <a class="nav-link" href="charts.html">
                                	상품목록
                            </a>
                            <a class="nav-link" href="tables.html">
                                	팝업등록
                            </a>
                            <a class="nav-link" href="/shop/admin/cateRegister">
                                	카테고리등록
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
			<div class="container-fluid px-4">
				<h1 class="mt-4">카테고리 목록</h1>
				<hr><p>
				<div class="row">
					<div class="col-12">
						<h3>대분류</h3>
						<ul class="list-group cate1">
							
						</ul>
					</div>
				</div>
				<hr><p>
				<div class="row">
					<div class="col-12">
						<h3>중분류</h3>
						<ul class="list-group cate2">
							
						</ul>
					</div>
				</div>
				<hr><p>
				<div class="row">
					<div class="col-12">
						<h3>소분류</h3>
						<ul class="list-group cate3">
							
						</ul>
					</div>
				</div>
			</div>
		</div>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	let cateList = JSON.parse('${cateList}');
	
	let cate1Array = new Array();
	let cate2Array = new Array();
	let cate3Array = new Array();
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cate1 = $(".cate1"); // 대분류
	let cate2 = $(".cate2"); // 중분류
	let cate3 = $(".cate3"); // 소분류
	
	function makeCateArray(obj, array, cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateParent1 = cateList[i].cateParent1;
				obj.cateParent2 = cateList[i].cateParent2;
				
				array.push(obj);
			}
		}
	}
	
	makeCateArray(cate1Obj, cate1Array, cateList, 1);
	makeCateArray(cate2Obj, cate2Array, cateList, 2);
	makeCateArray(cate3Obj, cate3Array, cateList, 3);
	
	/*$(document).ready(function(){
		console.log(cate1Array);
		console.log(cate2Array);
		console.log(cate3Array);
	});*/
	
	for(let i = 0; i < cate1Array.length; i++){
		cate1.append("<li class='list-group-item'>" + cate1Array[i].cateName + "</li>");
	}
</script>
</html>