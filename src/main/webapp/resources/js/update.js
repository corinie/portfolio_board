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
	setCSRF(csrftoken);
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