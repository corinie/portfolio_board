<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--FOOTER-->
			</div>
		</div>
		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section class="alt">
					
										<span>			
										 <c:if test="${pinfo ne 'anonymousUser'}">
				 							<span id="pinfo" data-pinfo="${pinfo.username}"></span>	
											<span><i class="fa fa-user" aria-hidden="true"></i></h4>${pinfo.username}</span>
											<br><span><i class="fa fa-unlock" aria-hidden="true"></i>${pinfo.authorities}</span>
										 </c:if>
			
										<c:if test="${pinfo eq 'anonymousUser'}">
											<span id="pinfo" data-pinfo="Guest"></span>	
											<span><i class="fa fa-user" aria-hidden="true"></i>${pinfo}</span>
											<span><i class="fa fa-unlock" aria-hidden="true"></i>GUEST</span>
										</c:if>
										</span>
																			
										
										<c:if test="${pinfo eq 'anonymousUser'}">
											<a href="/login/login"  class="ahref"><button class="button small">LOGIN</button></a>
										</c:if>
					<div class="inline-left">
										<c:if test="${pinfo ne 'anonymousUser'}">
											<a href="/message/list" class="ahref"><button class="button small">MESSAGE</button></a>
											<form action="/logout" method="post" class="inline-right">
											<button class="button small">LOGOUT</button>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
											</form>
										
										</c:if>
										
										</div>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="/index">HOME</a></li>
						<li><a href="/skills">SKILLS</a></li>
						<li><a href="/board/list">Board</a></li>
						<li><span class="opener">Board Pages</span>
							<ul>
								<li><a href="/login/login">Login</a></li>
								<li><a href="/admin/list">Admin Page</a></li>
								<li><a href="/board/register">Board Register</a></li>
								<li><a href="/board/list/">Board View/Update/Delete</a></li>
								<li><a href="#">File upload Sample</a></li>
								<li><a href="#">Sample</a></li>
								<li><a href="#">Message</a></li>
							</ul></li>
						<li><a href="#">Etiam Dolore</a></li>
						<li><a href="#">Adipiscing</a></li>
						<li><span class="opener">Another Submenu</span>
							<ul>
								<li><a href="#">Lorem Dolor</a></li>
								<li><a href="#">Ipsum Adipiscing</a></li>
								<li><a href="#">Tempus Magna</a></li>
								<li><a href="#">Feugiat Veroeros</a></li>
							</ul></li>
						<li><a href="#">Maximus Erat</a></li>
						<li><a href="#">Sapien Mauris</a></li>
						<li><a href="#">Amet Lacinia</a></li>
					</ul>
				</nav>



				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
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

	<script>
		var csrftoken = "${_csrf.token}";
		var userName = "${userName}";

		function setCSRF(tokenValue) {

			$.ajaxSetup({
				headers : {
					'X-CSRF-TOKEN' : tokenValue
				}
			});
		}
	</script>

</body>
</html>