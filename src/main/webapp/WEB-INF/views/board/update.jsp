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
						<h3>Update <span>content</span></h3>
					</div>
					<div class="agileinfo-contact-form-grid">
						<form method="post">
							<input type="text" name="title" placeholder="title" required="" value="${vo.title}">
							<input type="text" name="writer" placeholder="writer" required="" value="${vo.writer}" readonly="readonly">
							<textarea name="content" placeholder="content" required="">${vo.content}</textarea>
							<input type="hidden" name="page" value="${param.page}">
							<button class="btn1">Submit</button>
						</form>
						<a href="/board/view?bno=${vo.bno}&page=${param.page}"><button class="btn1">Return</button></a>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>	
		</div>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	