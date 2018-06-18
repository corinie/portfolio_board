<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--imagebox-->
<div class="imagebox">
</div>
<!--imagebox end-->


<div class="about-heading">
	<h2>
		Contact <span>Us</span>
	</h2>
</div>
<!-- //about-heading -->
<!-- contact -->
<div class="contact">
	<div class="container">
		<div class="agile-contact-form">
				<div class="contact-form-top">
					<h3>
						Register <span>content</span>
					</h3>
				</div>
				<div class="agileinfo-contact-form-grid">
					<form method="post">
						<input type="text" name="title" placeholder="title" required="">
						<input type="text" name="writer" placeholder="writer" required="" value="${pinfo.username}" readonly="readonly">
						<textarea name="content" placeholder="content" required=""></textarea>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="file-area">
							<input id="fileInput" type="file" multiple><br> 파일
							선택 혹은 이 곳에 파일을 드래그하세요.<br>
							<div id="upload">
								<div class="uploadList"></div>
							</div>
						</div>
						<button class="btn1">Submit</button>
					</form>
				</div>
			
			<div class="clearfix"></div>
		</div>


	</div>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>


<script src="/resources/js/register.js"></script>
<%@ include file="../includes/footer.jsp"%>
