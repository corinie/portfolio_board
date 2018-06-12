<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Hosting City a Hosting Category Flat Bootstrap responsive Website Template | Blog :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Hosting City Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="/resources/css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="/resources/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="/resources/js/jquery-1.11.1.min.js"></script>
    <script src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/SmoothScroll.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
</head>
<body>
	<!-- header-top -->
	<div class="header-top">
		<div class="container">
			<div class="w3layouts-address">
				<ul>
					<li><i class="fa fa-user" aria-hidden="true"></i>${userDetails.username}</li>
					<br><li><i class="fa fa-unlock" aria-hidden="true"></i>${userDetails.authorities}</li>
				</ul>
			</div>
			<div class="agileinfo-social-grids">
				<ul>
					
					<c:if test="${userDetails.username ne null}">
					<form action="/logout" method="post">
					<button class="btn-primary">logout</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
					</form>
					</c:if>
				</ul>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>

	<!-- //header-top -->
	<!-- header -->
	<div class="header">
			<div class="container">
				<nav class="navbar navbar-default">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					  </button>
						<div class="w3layouts-logo">
							<h1><a href="/board/list">Hosting <span>City</span></a></h1>
						</div>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
						<nav>
							<ul class="nav navbar-nav">
								<li><a href="/board/list" class="hvr-sweep-to-bottom">Home</a></li>
								<li><a href="/board/register" class="hvr-sweep-to-bottom">Register</a></li>
								<li><a href="plans.html" class="hvr-sweep-to-bottom">Plans</a></li>
								<li><a href="#" class="dropdown-toggle hvr-sweep-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a class="hvr-sweep-to-bottom" href="services.html">Services</a></li>
										<li><a class="hvr-sweep-to-bottom" href="faq.html">FAQs</a></li>
										<li><a class="hvr-sweep-to-bottom" href="login.html">Login</a></li>
										<li><a class="hvr-sweep-to-bottom" href="registration.html">Registration</a></li>
										<li><a class="hvr-sweep-to-bottom" href="icons.html">Icons</a></li>
										<li><a class="hvr-sweep-to-bottom" href="typography.html">Typography</a></li>          
									</ul>
								</li>
								<li class="active"><a href="blog.html" class="hvr-sweep-to-bottom">Blog</a></li>
								<li><a href="mail.html" class="hvr-sweep-to-bottom">Mail Us</a></li>
							</ul>
						</nav>
					</div>
					<!-- /.navbar-collapse -->
				</nav>
			</div>
	</div>