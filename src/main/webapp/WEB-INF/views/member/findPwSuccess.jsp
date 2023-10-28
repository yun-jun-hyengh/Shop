<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--Fontawesom-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">

        <!--Animated CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.min.css">

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Bootstrap Carousel-->
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/carousel.css" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/isotope/style.css">

        <!--Main Stylesheet-->
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
        <!--Responsive Framework-->
        <link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet">

<style type="text/css">
	.center-div {
		display: grid;
        place-items: center;
        height: 100vh;
    }
    .custom-form {
            width: 50%;
        }
</style>
</head>
<body>
	<section id="header">
            <div class="header-area">
                <div class="top_header">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
                                <div class="address">
                                    
                                    <i class="fa fa-facebook"></i>
                                    <i class="fa fa-twitter"></i>
                                    <i class="fa fa-google-plus"></i>
                                    <i class="fa fa-youtube"></i>
                                </div>
                            </div>
                            <!--End of col-md-4-->
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 zero_mp">
                                <div class="phone">
                                    <i class="fa fa-phone floatleft"></i>
                                    <p>+ 8801532-987039</p>
                                </div>
                            </div>
                            <!--End of col-md-4-->
                            <div class="col-md-4">
                                <div class="social_icon text-right">
                                <a href="/shop/member/login">로그인  </a>
                                <a href="/shop/member/useSuccess">회원가입  </a>
                                <a href="#">장바구니  </a>
                                <a href="#">고객센터  </a>
                                
                                </div>
                            </div>
                            <!--End of col-md-4-->
                        </div>
                        <!--End of row-->
                    </div>
                    <!--End of container-->
                </div>
                <!--End of top header-->
                <div class="header_menu text-center" data-spy="affix" data-offset-top="50" id="nav">
                    <div class="container">
                        <nav class="navbar navbar-default zero_mp ">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand custom_navbar-brand" href="/shop"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
                            </div>
                            <!--End of navbar-header-->

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse zero_mp" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav navbar-right main_menu">
                                    <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">about</a></li>
                                    <li><a href="#">project</a></li>
                                    <li><a href="#">achivment</a></li>
                                    <li><a href="#">event</a></li>
                                    
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </nav>
                        <!--End of nav-->
                    </div>
                    <!--End of container-->
                </div>
                <!--End of header menu-->
            </div>
            <!--end of header area-->
        </section>
        <!--End of Hedaer Section-->
	<div class="center-div">	
	<form class="from-horizontal custom-form" id="frm" action="shop/member/findPw" method="post">
		<div class="form-group text-center">
			<h2>비밀번호 찾기</h2>
		</div>
		<div class="d-grid gap-3">
			<div class="form-group">
			<div class="col-sm-8 control-label">
				<label class="form-label" for="id"></label> 
			</div>
			<div class="col-sm-12 text-left">
				<h2>임시 비밀번호가 전송되었습니다</h2><br>
				<h2>${member}</h2><br>
				<h2>를 확인해 주세요</h2>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<input class="btn btn-lg btn-success btn-block" type="button" value="로그인페이지" onclick="find()"><br>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-12 text-left">
				<input class="btn btn-lg btn-warning btn-block" type="button" value="메인페이지" onclick="back()"><br>
			</div>
		</div>
	</div>
	</form>
	</div>
	<%@include file="../include/footer.jsp" %>
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	function find(){
		location="/shop/member/login";
	}
	
	function back(){
		location="/shop";
	}
</script>
</html>