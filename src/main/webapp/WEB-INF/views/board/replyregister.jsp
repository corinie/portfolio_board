<%@ include file="../includes/header.jsp"%>

	<div class="about-heading">
		<h2>Contact <span>Us</span></h2>
	</div>
	<!-- //about-heading -->
	<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="agile-contact-form">
				<div class="col-md-6 contact-form-right">
					<div class="contact-form-top">
						<h3>Register <span>content</span></h3>
					</div>
					<div class="agileinfo-contact-form-grid">
						<form method="post">
							<input type="text" name="title" placeholder="title" required="" value="Reply:${vo.title }">
							<input type="text" name="writer" placeholder="writer" required="">
							<textarea name="content" placeholder="content" required="">
							${vo.content}
							================================================================</textarea>
							<input type="hidden" name="bno" value="${param.bno }">
							<input type="hidden" name="depth" value="${vo.depth }">
							<input type="hidden" name="rbno" value="${vo.rbno }">
							<button class="btn1">Submit</button>
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	