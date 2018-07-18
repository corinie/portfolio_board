<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
	<head>
		<title>Editorial by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
					
							<!-- Header -->
								<header id="header">
								

										
									<a href="/index" class="logo"><strong>EDITORIAL</strong> by CORINIE</a>
									
										
										
									<ul class="icons">
									<sec:authentication property="principal" var="pinfo"/>	
										<span class="inline-left">			
										 <c:if test="${pinfo ne 'anonymousUser'}">
				 							<span id="pinfo" data-pinfo="${pinfo.username}"></span>	
											<span><i class="fa fa-user" aria-hidden="true"></i></h4>${pinfo.username}</span>
											<span><i class="fa fa-unlock" aria-hidden="true"></i>${pinfo.authorities}</span>
										 </c:if>
			
										<c:if test="${pinfo eq 'anonymousUser'}">
											<span id="pinfo" data-pinfo="Guest"></span>	
											<span><i class="fa fa-user" aria-hidden="true"></i>${pinfo}</span>
											<span><i class="fa fa-unlock" aria-hidden="true"></i>GUEST</span>
										</c:if>
										</span>
																			
										
										<c:if test="${pinfo eq 'anonymousUser'}">
											<a href="/login/login"  class="logo-button"><button class="button small">LOGIN</button></a>
										</c:if>
					
										<c:if test="${pinfo ne 'anonymousUser'}">
											<a href="/message/list" class="logo-button"><button class="button small">MESSAGE</button></a>
											<form action="/logout" method="post" class="inline-right">
											<button class="button small">LOGOUT</button>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
											</form>
									
										</c:if>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>Hi, I’m TEAM brief<br />inner your company</h1>
											<p>managing your document <br />and procedure of Reporting history!</p>
										</header>
										<p>사내 업무 협업의 진행과정, 파일관리, 이력을 남겨주어 <br />업무를 효율적으로 빠르고 정확하게 진행해보세요!</p>
										<ul class="actions">
											<li><a href="#" class="button big">Learn More</a></li>
										</ul>
									</div>
									<span class="image object">
										<img src="/resources/image/pic10.jpg" alt="" />
									</span>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>CORE FUNCTION</h2>
									</header>
									<div class="features">
										<article>
											<span class="icon fa-signal"></span>
											<div class="content">
												<h3>hierarchical Structure</h3>
												<p>계층형 게시판을 통한, 보고의 상태를 대기, 진행, 반려로, 프로젝트를 진행, 중지, 완료로 관리 할 수 있습니다.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-rocket"></span>
											<div class="content">
												<h3>File Attachment</h3>
												<p>파일 업로드, 다운로드를 통한 업무 파일 관리, 이미지 파일은 썸네일을 통한 미리보기, 원본확대 보기 등.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-paper-plane"></span>
											<div class="content">
												<h3>Message</h3>
												<p>담당 업무의 상태 변경시, 개인 메시지 전송을 통한, 업무 변화 알림서비스.</p>
											</div>
										</article>
										<article>
											<span class="icon fa-diamond"></span>
											<div class="content">
												<h3>Authority Management</h3>
												<p>Spring Security를 사용한 보안과 ADMIN PAGE를 통한 회원의 권한 관리를 통해, 사내 사원의 권한을 변경해 업무를 진행할 수 있습니다.</p>
											</div>
										</article>
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ipsum sed dolor</h2>
									</header>
									<div class="posts">
										<article>
											<a href="#" class="image"><img src="/resources/image/pic01.jpg" alt="" /></a>
											<h3>Interdum aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic02.jpg" alt="" /></a>
											<h3>Nulla amet dolore</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic03.jpg" alt="" /></a>
											<h3>Tempus ullamcorper</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic04.jpg" alt="" /></a>
											<h3>Sed etiam facilis</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic05.jpg" alt="" /></a>
											<h3>Feugiat lorem aenean</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic06.jpg" alt="" /></a>
											<h3>Amet varius aliquam</h3>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
											<ul class="actions">
												<li><a href="#" class="button">More</a></li>
											</ul>
										</article>
									</div>
								</section>

						</div>
					</div>

				
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										<li><a href="/index">HOME</a></li>
										<li><a href="/skills">SKILLS</a></li>
										<li><a href="/board/list">Boards</a></li>
										<li>
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="/login/login">Login</a></li>
												<li><a href="/admin/admin">Admin Page</a></li>
												<li><a href="/board/register">Board Register</a></li>
												<li><a href="/board/view/">Board View/Update/Delete</a></li>
												<li><a href="#">File upload Sample</a></li>
												<li><a href="#">Sample</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul>
								</nav>
								
							<!-- Section -->
								<section>
									<header class="major">
										<h2>Ante interdum</h2>
									</header>
									<div class="mini-posts">
										<article>
											<a href="#" class="image"><img src="/resources/image/pic07.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic08.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
										<article>
											<a href="#" class="image"><img src="/resources/image/pic09.jpg" alt="" /></a>
											<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
										</article>
									</div>
									<ul class="actions">
										<li><a href="#" class="button">More</a></li>
									</ul>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>Get in touch</h2>
									</header>
									<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
									<ul class="contact">
										<li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
										<li class="fa-phone">(000) 000-0000</li>
										<li class="fa-home">1234 Somewhere Road #8254<br />
										Nashville, TN 00000-0000</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>