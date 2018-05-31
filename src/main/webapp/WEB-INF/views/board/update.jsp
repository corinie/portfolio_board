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
						Update <span>content</span>
					</h3>
				</div>
				<div class="agileinfo-contact-form-grid">
					<form method="post">
						<input type="text" name="title" placeholder="title" required=""
							value="${vo.title}"> <input type="text" name="writer"
							placeholder="writer" required="" value="${vo.writer}"
							readonly="readonly">
						<textarea name="content" placeholder="content" required="">${vo.content}</textarea>

						<div class="file-area">
							<input id="fileInput" type="file" multiple><br> 파일선택
							혹은 이 곳에 파일을 드래그하세요.<br>
							<div id="upload">
								<div class="uploadList">
									<c:forEach items="${fileList}" var="file">
										<c:if test="${file.image eq 'n' }">
											<div class="imgcontent">
												<img src='/resources/images/attach.png'> <a href='/download?fileName=${file.datefolder }/${file.uuid}_${file.fname}' download>
												<br>${file.fname }</a> 
												<span data-file="${file.datefolder }/${file.uuid}_${file.fname}" data-type='file' data-uuid='${file.uuid }'>ⓧ </span> 
												<input type='hidden' name='uuid' value='${file.uuid }'>
											</div>
										</c:if>
										<c:if test="${file.image eq 'y' }">
											<div class="imgcontent">
												<a href='/display?fileName=${file.datefolder }/${file.uuid}_${file.fname}' target="_blank">
												<img src='/display?fileName=${file.datefolder }/s_${file.uuid}_${file.fname}'></a>
												<a href='/display?fileName=${file.datefolder }/${file.uuid}_${file.fname}' download>
												<br>${file.fname }</a> 
												<span data-file="${file.datefolder }/${file.uuid}_${file.fname}" data-type='file' data-uuid='${file.uuid }'>ⓧ </span> 
												<input type='hidden' name='uuid' value='${file.uuid }'>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div align="right" style="inline">
						<input type="hidden" name="page" value="${param.page}">
						<button class="btn1">Submit</button>
						
					</form>
						<a href="/board/view?bno=${vo.bno}&page=${param.page}"><button
							class="btn1">Return</button></a>
						</div>
				</div>
			
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>

var formData="";
var files="";


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


/* uploadFile Delete */
$(".uploadList").on("click", "span", function(e){
	$(e.target).parent("div").remove();	
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
									+ "</a>"
									+ "<br>"+obj.fname
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
