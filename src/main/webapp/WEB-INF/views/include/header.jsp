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

        
        
      


        
</head>
<body>
<!--Start Hedaer Section-->
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
                                <c:if test="${member == null}">
                                    <a href="/shop/member/login">로그인  </a>
                                    <a href="/shop/member/useSuccess">회원가입  </a>
                                    <a href="#">장바구니  </a>
                                    <a href="#">고객센터  </a>
                                </c:if>
                                <c:if test="${member != null}">
                                	<c:if test="${member.adminCk == 1}">
                                		<a href="/shop/admin/adminMain">관리자페이지</a>
                                	</c:if>
                                	<a href="/shop/member/mypage">마이페이지  </a>
                                    <a style="cursor:pointer;" id="logout_button">로그아웃  </a>
                                    <a href="#">장바구니  </a>
                                    <a href="#">고객센터</a>
                                    
                                </c:if>    
                                
                                <c:if test="${userId ne null}">
                            
                                	<a href="/shop/member/mypage">마이페이지  </a>
                                    <a style="cursor:pointer;" id="logout_button">로그아웃  </a>
                                    <a href="#">장바구니  </a>
                                    <a href="#">고객센터</a>
                                    
                                </c:if>    
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
                                    <c:if test="${member != null}">
                                    	<li><a>${member.memberName}(${member.codeName})&nbsp;&nbsp; |&nbsp;&nbsp; ${member.point} (point)</a></li>
                                    </c:if>
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
</body>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$("#logout_button").click(function(){
		//console.log('버튼작동');
		$.ajax({
			type : "post",
			url : "/shop/member/logout",
			success : function(data){
				alert('로그아웃 하셨습니다. 이용해 주셔서 감사합니다.');
				location="/shop";
			}
		});
	});
</script>
</html>