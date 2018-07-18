
<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- //header -->
<!-- about-heading -->
<h1></h1>
<!-- //about-heading -->
<div class="registration">
	<div class="container">
		<div class="signin-form profile">
			<h3>Login</h3>
			<div class="login-form">
				<form action="/login" method="post">
					<input type="text" name="username" placeholder="ID" required="">
					<input type="password" name="password" placeholder="Password"
						required="">
						<input type="checkbox" id="remember-me" name="remember-me">
																<label for="remember-me">Remember-me</label>
					
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="tp">
						<input type="submit" value="LOGIN NOW">
					</div>
				</form>
			</div>
			<div class="login-social-grids">
				<ul>
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-rss"></i></a></li>
				</ul>
			</div>
			<p>
				<a href="registration.html"> Don't have an account?</a>
			</p>
		</div>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>