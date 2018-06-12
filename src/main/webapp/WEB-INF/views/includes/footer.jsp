<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- footer -->
<div class="footer">
	<div class="container">
		<div class="agile-footer-grids">
			<div class="col-md-4 agile-footer-grid"></div>
			<div class="col-md-4 agile-footer-grid">

				<ul class="w3agile_footer_grid_list"></ul>
			</div>


			<div class="clearfix"></div>
		</div>
	</div>
	<div class="copyright">
		<p>
			© 2018 Seoul City. All rights reserved | Design by <a
				href="http://w3layouts.com">W3layouts</a>
		</p>
	</div>
</div>
<!-- //footer -->

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