//register
var files = "";
var formData = "";
var str = "";
var upstr = "";
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB	
var displayHeight = document.documentElement.clientHeight;
var imagebox = $(".imagebox");
	
imagebox.attr("style", "height:"+displayHeight+"px;");
	
$(document).ready(function () {
	imagebox.hide();
});
	
imagebox.on("click", function(e){
	imagebox.hide();
});
	
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

$(".uploadList").on("click", ".file_image", function (e) {
	
	imagebox.show();
	
	imagebox.html("<img src='"+$(e.target).attr("data-fileLink")+"'>");
	
});

function uploadAjax(files) {
	formData = new FormData();
	// file upload size, extension option
	for (var i = 0; i < files.length; i++) {
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
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
							upstr += "<div>"
									+ "<img class='file_image' src='/display?fileName="
									+ fileCallPath
									+ "' data-fileLink='/display?fileName="
									+ originalFile+"'>"
									+ "<br>"+obj.fname
									+ "<span data-file=\'"+fileCallPath+"\' data-type='image' data-uuid="+obj.uuid+"> x </span>"
									+ "<input type='hidden' name='uuid' value='"+obj.uuid+"'>"
									+ "</div>";
						}
					});
	$(".uploadList").append(upstr);
}

function checkExtension(fileName, fileSize){
	
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	return true;
}	