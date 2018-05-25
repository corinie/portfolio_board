<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




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
						<input type="text" name="writer" placeholder="writer" required="">
						<textarea name="content" placeholder="content" required=""></textarea>

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

<script>
	var files = "";
	var formData = "";
	var str = "";
	var upstr = "";

	/* uploadFile Delete */
	$(".uploadList").on("click", "span", function(e){
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		$.ajax({
			url : "/deleteFile",
			data : {fileName : targetFile, type : type},
			dataType : 'text',
			type: 'post',
			success : function(result){
				$(e.target).parent("div").remove();
			}
		});	
	});
	
	$(".file-area").on("dragenter dragover", function(e) {
		e.preventDefault();
	});

	/* Drag and Drop Event */
	$(".file-area").on("drop", function(e) {
		e.preventDefault();

		files = e.originalEvent.dataTransfer.files;
		uploadAjax(files);

	});

	/* Input File Event */
	$("#fileInput").change(function(e) {

		/* var files = e.originalEvent.dataTransfer.files; */

		files = e.target.files;
		uploadAjax(files);
	});

	function uploadAjax(files) {
		formData = new FormData();

		for (var i = 0; i < files.length; i++) {
			formData.append("uploadFile", files[i]);
		}

		$.ajax({
			url : "/uploadAjax",
			type : "POST",
			data : formData,
			dataType : 'json',
			processData : false,
			contentType : false,
			success : function(result) {

				showUploadedFile(result);

			}
		});
	}

	function showUploadedFile(uploadResultArr) {
		upstr = "";
		$(uploadResultArr)
				.each(
						function(i, obj) {
							if (obj.image != "y") {
								var fileCallPath = encodeURIComponent(obj.datefolder
										+ "/" + obj.uuid + "_" + obj.fname);
								var fileLink = fileCallPath.replace(new RegExp(
										/\\/g), "/");
								upstr += "<div><a href='/download?fileName="
										+ fileCallPath
										+ "'>"
										+ "<img src='/resources/images/attach.png'>"
										+ "</a><a href='/download?fileName='"+fileCallPath+"'>"
										+ "<br>"+obj.fname
										+ "</a>"
										+ "<span data-file=\'"+fileCallPath+"\' data-type='file' data-uuid="+obj.uuid+"> x </span>"
										+ "<input type='hidden' name='uuid' value='"+obj.uuid+"'>"
										+ "</div>";
							} else {
								var fileCallPath = encodeURIComponent(obj.datefolder
										+ "/s_" + obj.uuid + "_" + obj.fname);
								var originalFile = encodeURIComponent(obj.datefolder
										+ "/" + obj.uuid + "_" + obj.fname);
								var originPath = obj.datefolder + "\\"
										+ obj.uuid + "_" + obj.fname;
								originPath = fileCallPath.replace(new RegExp(
										/\\/g), "/");
								upstr += "<div><a href='/display?fileName="
										+ originalFile
										+ "' target='_blank'>"
										+ "<img src='/display?fileName="
										+ fileCallPath
										+ "'>"
										+ "<br>"+obj.fname
										+ "</a>"
										+ "<span data-file=\'"+fileCallPath+"\' data-type='image' data-uuid="+obj.uuid+"> x </span>"
										+ "<input type='hidden' name='uuid' value='"+obj.uuid+"'>"
										+ "</div>";
							}
						});
		$(".uploadList").append(upstr);
	}
	
	
</script>

<%@ include file="../includes/footer.jsp"%>
