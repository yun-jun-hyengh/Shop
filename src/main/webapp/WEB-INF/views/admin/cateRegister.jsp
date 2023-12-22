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
				<hr><p>
				<div class="row">
					<div class="col-12">
						<h3>카테고리 등록</h3>
						<table class="table table-striped">
							<tr>
								<td class="align-middle text-center">대분류</td>
								<td>
									<select id="selectbox" class="form-control">
										<option selected value="none">선택</option>
										<option value="direct">직접입력</option>
									</select><br>
									<input type="text" class="form-control" id="selectboxDirect">
								</td>
								<td colspan="1">
									<input class="btn btn-success btn-block" type="button" value="등록" id="cate1_btn">
								</td>
							</tr>
							<tr>
								<td class="align-middle text-center">중분류</td>
								<td>
									<input type="text" class="form-control" id="cateName1">
								</td>
								<td colspan="1">
									<input class="btn btn-success btn-block" type="button" value="등록" id="cate2_btn">
								</td>
							</tr>
							<tr>
								<td class="align-middle text-center">소분류</td>
								<td>
									<input type="text" class="form-control" id="cateName2">
								</td>
								<td colspan="1">
									<input class="btn btn-success btn-block" type="button" value="등록" id="cate3_btn">
								</td>
							</tr>
							<!--  <tr>
								<td></td>
								<td align="center"><input class="btn btn-success btn-block" type="button" value="카테고리 등록" id="login_button"></td>
							</tr> -->
						</table>
					</div>
				</div>
			</div>
			
			<footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
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
	
	let selectbox = $("#selectbox");
	
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
	
	for(let i = 0; i < cate2Array.length; i++){
		cate2.append("<li class='list-group-item'>" + cate2Array[i].cateName + "(" + cate2Array[i].cateParent1 + ")" + "</li>");
	}
	
	for(let i = 0; i < cate3Array.length; i++){
		cate3.append("<lis class='list-group-item'>" + cate3Array[i].cateName + "(" + cate3Array[i].cateParent1 + ")" + "</li>");
	}
	
	for(let i = 0; i < cate1Array.length; i++){
		selectbox.append("<option id='cateName'>" + cate1Array[i].cateName + "</option>");
	}
	
	$(function(){
		var category1 = "";
		var category2 = "";
		var category3 = "";
		//var selectboxDirect = "";
		$("#selectboxDirect").hide();
		$("#selectbox").change(function(){
			if($("#selectbox").val() == "direct"){
				$("#selectboxDirect").show();
			} else {
				$("#selectboxDirect").hide();
			}
		});
		
		$("#cate1_btn").click(function(){
			if($("#selectbox").val() == "direct" || $("#selectbox").val() == "직접입력" || $("#selectbox").val() == "none"){
				selectboxDirect = $("#selectboxDirect").val();
				if(selectboxDirect === ""){
					alert("대분류 카테고리를 직접 기재해 주세요!!");
				} else {
					//console.log(selectboxDirect);	
					category1 = selectboxDirect;
					$.ajax({
						url : "/shop/admin/cate1",
						type : "post",
						data : {
							tier : 1,
							cateName : category1
						},
						success : function(data){
							//console.log(data);
							if(data == "success"){
								alert("1차 카테고리 등록 완료");
							}
						}
					});
				}
			} else {
				var selectbox = $("#selectbox").val();
				//console.log(selectbox);
				category1 = selectbox;
				$.ajax({
					url : "/shop/admin/cate1",
					type : "post",
					data : {
						tier : 1,
						cateName : category1
					},
					success : function(data){
						//console.log(data);
						if(data == "success"){
							alert("1차 카테고리 등록 완료");
						}
					}
				});
			}
		});
		
		$("#cate2_btn").click(function(){
			//alert("2번클릭됨")
			category2 = $("#cateName1").val();
			if(category1 === ""){
				alert("1차 카데고리를 추가해 주세요");
			} else if(category2 === ""){
				alert("2차 카테고리를 추가해 주세요");
			} else {
				//console.log(category2);
				$.ajax({
					url : "/shop/admin/cate2",
					type : "post",
					data : {
						tier : 2,
						cateName : category2,
						cateParent1 : category1
					},
					success : function(data){
						//console.log(data);
						if(data == "success"){
							alert("2차 카테고리 등록 완료");
						}
					}
				});
			}
		});
		
		$("#cate3_btn").click(function(){
			//alert("3번클릭됨")
			category3 = $("#cateName2").val();
			if(category1 === "" && category2 === ""){
				alert("1차 카데고리와 2차 카테고리를 추가해 주세요");
			} else if(category2 === ""){
				alert("2차 카테고리를 추가해 주세요");
			} else if(category1 === ""){
				alert("1차 카테고리를 추가해 주세요");
			} else {
				//console.log(category3);	
				$.ajax({
					url : "/shop/admin/cate3",
					type : "post",
					data : {
						tier : 3,
						cateName : category3,
						cateParent1 : category1,
						cateParent2 : category2
					},
					success : function(data){
						//console.log(data);
						if(data == "success"){
							alert("3차 카테고리 등록 완료");
						}
					}
				});
			}
		});
	});
</script>
</html>