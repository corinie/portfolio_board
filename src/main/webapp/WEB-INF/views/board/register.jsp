<%@ include file="../includes/header.jsp"%>
<style>
.file-area {
	border: 4px dotted gray;
	min-height: 100px;
	margin-bottom: 10px;
}
</style>

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
							<input type="text" name="title" placeholder="title" required="">
							<input type="text" name="writer" placeholder="writer" required="">
							<textarea name="content" placeholder="content" required=""></textarea>
							
							<div class="file-area">
								<!-- <input type="file" multiple> -->
							</div>
							
							<button class="btn1">Submit</button>
						</form>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
		</div>
	</div>
	


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script>

<script>

$(".file-area").on("dragenter dragover", function (e) {
	e.preventDefault();
});

$(".file-area").on("drop", function (e) {
	e.preventDefault();
	
	var files = e.originalEvent.dataTransfer.files;
	var formData = new FormData();
	
	for(var i=0; i<files.length; i++){
		formData.append("uploadFile", files[i]);
	}
	
	console.log(formData);
	
	$.ajax({
		url : "/uploadAjax",
		type : "POST",
		data : formData,
		dataType : 'json',
		processData : false,
		contentType : false,
		success : function (result) {
			
		}
		
	});
	
});

</script>
	
	<%@ include file="../includes/footer.jsp"%>
	