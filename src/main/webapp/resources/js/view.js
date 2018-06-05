

var page = 1;
var bno = $(".havebno").data("bno");
var str = "";
var cstr = "";
var comments = "";
var commenter = "";
var target = "";
var branch = "";
var branchComments = "";
var branchCommenter = "";
var cno ="";
var innercstr="";
var bodytarget="";
var displayHeight = document.documentElement.clientHeight;
var imagebox = $(".imagebox");
var fileInput = $("#fileInput");
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB
var uuid = new Array();
var uploadList = $(".uploadList");
var regex = new RegExp("(.*?)\.(jpg|png|gif|bmp)$");

	$(document).ready(function() {
		getAllList(page);
	});
	
	imagebox.attr("style", "height:"+displayHeight+"px;");
	
	$(document).ready(function () {
		imagebox.hide();
	});
	
	imagebox.on("click", function(e){
		imagebox.hide();
	});
	
	/*  */
	$(".fileList").on("click", ".file_image", function (e) {
		
		imagebox.show();
		
		imagebox.html("<img src='"+$(e.target).attr("data-fileLink")+"'>");
		
	});
	
	/*REPLY CREATE*/
	$("#sendBtn").on("click", function (e) {
		
		comments = $("#comments").val();
		commenter = $("#commenter").val();

		if(comments != ""){
			$.ajaxSettings.traditional = true;
			$.ajax({
				url : "/comment/root",
				type : "POST",
				dataType : "text",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					bno : bno,
					comments : comments,
					commenter : commenter,
					uuid : uuid
				}),  
				success : function (result) {
					if(result == 'rsuccess'){
						getAllList(page);
						$("#comments").val("");
						$("#commenter").val("");
						fileInput.val("");
						uploadList.html("");
						alert("댓글 등록 성공");
						uuid = "";
					}
				}
			});
		}else{
			alert("댓글 내용을 작성하세요.");
		}
	
		
	});

	
	
	/* Input File Event */
	$("#fileInput").change(function(e) {

		/* var files = e.originalEvent.dataTransfer.files; */
		
		files = e.target.files;
		getAllList(page);
		uploadAjax(files);
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

	/*re-comment view*/
	$(".response").on("click", ".resendopen", function (e) {
		
		target = $(this).attr("data-cno"); 
		 
		if(($(this).attr("data-display") == "hide")){
		$("."+target).show();
		$(this).html("x");
		$(this).attr("data-display","show");
		}else{
			$("."+target).hide();
			$(this).html("comment");
			$(this).attr("data-display", "hide");
		};
		
	});
	/*re-commnet register*/
	$(".response").on("click", ".resend", function (e) {
		e.preventDefault();
		
		branch = $("."+target);
		branchComments = branch[1].children[1].value;
		branchCommenter = branch[1].children[0].value;
		
		console.log(branchComments);
		console.log(branchCommenter);
		
		$.ajax({
			url : "/comment/branch",
			type : "POST",
			dataType : "text",
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				bno : bno,
				gno : target,
				comments : branchComments,
				commenter : branchCommenter
			}),
			success : function (result) {
				if(result == 'bsuccess'){
					alert("댓글 등록 성공");
					getAllList(page);
				}
			}
		});
	});
	
	/*ROOT COMMENT DELETE*/
	$(".response").on("click", ".rdelete", function (e) {
	
		cno = $(e.target).attr("data-cno");
		
		$.ajax({
			url : "/comment/rdelete/"+cno,
			type : "PUT",
			dataType : "text",
			
			success : function (result) {
				if(result == 'rcdsuccess'){
					alert("댓글 삭제 성공");
					getAllList(page);
				}
			}
		});
	});
	
	/*BRANCH COMMENT DELETE*/
	$(".response").on("click", ".innercomment .bdelete", function (e) {
		
		cno = $(e.target).attr("data-cno");
 		
		$.ajax({
			url : "/comment/bdelete/"+cno,
			type : "PUT",
			dataType : "text",
			headers : {
				"Content-Type" : "application/json"
			},
			success : function (result) {
				if(result == 'bcdsuccess'){
					alert("댓글 삭제 성공");
					getAllList(page);
				}
			}
		});
	});
		
	/*COMMENT UPDATE*/
	$(".response").on("click", ".rupdate", function (e) {
		bodytarget = $(e.target).attr("data-cno");
		
		//comment opened-reset		
		$("#comments").val("");
		$("#commenter").val("");
		fileInput.val("");
		uploadList.html("");
		
		$.getJSON("/comment/"+bodytarget, function (data) {
			console.log(data);
			
			innercstr = "<textarea id='ucomment' data-cno="+data.cno+" cols='70' rows='5' >"+data.comments+"</textarea>"
						+"<div class='file-area'>"
							+"<input id='fileInput' type='file' multiple='multiple'>"
							+"<div id='upload'>"
							+"<div class='uploadList'>";
			if(data.fileList[0].fname != null){
				for(var i=0; i<data.fileList.length; i++){
					var fileUrl = encodeURIComponent(data.fileList[i].datefolder
							+ "/s_" + data.fileList[i].uuid + "_" + data.fileList[i].fname);
				
					innercstr += "<div><img src='/display?fileName="+fileUrl+"'>"
								+ "<br>"+data.fileList[i].fname
								+ "<span data-file=\'"+fileUrl+"\' data-type='image' data-uuid="+data.fileList[i].uuid+"> x </span>"
								+ "<input type='hidden' name='uuid' value='"+data.fileList[i].uuid+"'></div>";
					
					uuid.push(data.fileList[i].uuid);
					
				}
			}
				innercstr +="</div>"
							+"</div>"
							+"</div>"
							+"<button class='label label-default upsend'>update</button>";
							
			$("."+bodytarget).html(innercstr);
			innercstr = "";
		});
	});
	
	//COMMENT UPDATE DATA SENDING
	$(".response").on("click", ".upsend", function (e){
		var ucomment = $("#ucomment").val();
		var ucno = $("#ucomment").attr("data-cno");
		
		console.log(uuid);
		
		$.ajaxSettings.traditional = true;
		$.ajax({
			url : "/comment/"+ucno,
			type : "PUT",
			dataType : "text",
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				cno : ucno,
				comments : ucomment,
				uuid : uuid
			}),
			success : function (result) {
				if(result == 'usuccess'){
					alert("댓글 수정 성공");
					getAllList(page);
				}
			}
		});
		
	});
	
	$(".response").on("click", ".pageNum", function (e) {
		e.preventDefault();
		var pageNum = $(e.target).attr("href");
		
		getAllList(pageNum);
	});
	
	/* uploadFile Delete */
	$(".response").on("click",".uploadList span", function(e){
		e.preventDefault();
		e.stopPropagation();
		$(e.target).parent("div").remove();	
	});
	
	function getAllList(pageNum) {
		$.getJSON("/comment/" + bno + "/" + pageNum, function(data) {
			console.log(data.list);
			$(data.list).each(function() {
			 		innercstr = "<div class='media response-info'>"
				 		 	  +	"<div class='media-left response-text-left'>"
				   		      +"<h5>"+this.commenter+"</h5>"
				 		  	  +"</div>"
				 		  	  +"<div class='media-body response-text-right'>";
				 
				 	if(this.deleteyn == 'm'){
				 		innercstr += "<p>이 댓글은 삭제된 댓글입니다. </p>";
				 	}else{
				 		innercstr += "<div class="+this.cno+"><p>"+this.comments+"</p>";
				 		if(this.fileList[0].fname != null){
					 		for(var i=0; i<this.fileList.length; i++){
					 			var fileUrl = encodeURIComponent(this.fileList[i].datefolder
										+ "/s_" + this.fileList[i].uuid + "_" + this.fileList[i].fname);
					 			innercstr += "<img src='/display?fileName="+fileUrl+"'>";
					 		}
					 		innercstr += "</div>";
				 		}
				 	}
				 	innercstr +="<ul><li>"+this.regdate+"</li>";
				 	
				if(this.cno == this.gno){
					cstr 	 += innercstr
							 +"<li><button data-cno='"+this.cno+"' data-display='hide' class='label label-default resendopen'>comment</button>"
							 +"<button data-cno='"+this.cno+"' class='label label-default rdelete'>delete</button>"
							 +"<button data-cno='"+this.cno+"' class='label label-default rupdate'>Update</button></li></ul>"
						 	 +"</div>"
							 +"<div class='"+this.cno+"' style='display : none;'>"
							 +"<input type='text' name='commenter' placeholder='Name' required='' class='branchcommenter'>"
							 +"&nbsp; <input name='comment' size='125' placeholder='Message' required='' class='branchcomments'>"
							 +"&nbsp; <a href='#' class='label label-default resend' id='sendBtn' >SEND</a></div>"
							 +"</div>"
							 +"<hr>";
				}else{
					cstr += "<div class='media response-info'>"
						 	+"<div class='media-left response-text-left'>"
							+"<h5>     </h5>"
						 	+"</div>"
						 	+"<div class='media-body response-text-right'>"
						 	+"<div class='innercomment'>"
						 	+innercstr
						 	+"<li><button data-cno='"+this.cno+"' class='label label-default bdelete'>delete</button>"
						 	+"<button data-cno='"+this.cno+"' class='label label-default rupdate'>Update</button></li></ul>"
						 	+"<div class='clearfix'></div>"
						 	+"</div></div></div></div>"
						 	+"<hr>";
				}
			});
			$(".outer").html(cstr);
			cstr = "";
			
			pagination(data.pm);
		});
	};
	
	function pagination(page) {
		var pstr = "";
		if(page.prev){
			pstr += "<li><a href='"+(page.start-1)+"' class='pageNum'>이전</a>";
		}
		for(var i = page.start; i <= page.end; i++){
			pstr += "<li><a href='"+i+"' class='pageNum'>"+i+"</a>";
		}
		if(page.next){
			pstr += "<li><a href='"+(page.end+1)+"' class='pageNum'>다음</a>";
		}
		
		$(".pagination").html(pstr);
	};
	
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
	function showUploadedFile(uploadResultArr) {
		upstr = "";
	
		$(uploadResultArr)
				.each(
						function(i, obj) {
								
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
								uuid.push(obj.uuid);
						});
		$(".uploadList").append(upstr);
		
		
	}
	
	function uploadAjax(files) {
		formData = new FormData();
		// file upload size, extension option
		for (var i = 0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)){
				fileInput.val("");
				return false;
			}
			formData.append("uploadFile", files[i]);
		}

		$.ajax({
			url : "/comment/uploadAjax",
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
	

	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}	