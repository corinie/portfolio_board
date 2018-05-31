

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
				commenter : commenter
			}),
			success : function (result) {
				if(result == 'rsuccess'){
					alert("댓글 등록 성공");
					getAllList(page);
				}
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
		console.log("update click");
		bodytarget = $(e.target).attr("data-cno");
		$.getJSON("/comment/"+bodytarget, function (data) {
			
			innercstr = "<textarea id='ucomment' data-cno="+data.cno+" cols='70' rows='5' >"+data.comments+"</textarea>"
					  +"<button class='label label-default upsend'>update</button>";

			$("."+bodytarget).html(innercstr);
			innercstr = "";
		});
	});
	
	$(".response").on("click", ".upsend", function (e){
		var ucomment = $("#ucomment").val();
		var ucno = $("#ucomment").attr("data-cno");
		
		$.ajax({
			url : "/comment/"+ucno,
			type : "PUT",
			dataType : "text",
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				cno : ucno,
				comments : ucomment
			}),
			success : function (result) {
				if(result == 'usuccess'){
					alert("댓글 등록 성공");
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
				 		innercstr += "<p>이 댓글은 삭제된 댓글입니다. </p>"
				 	}else{
				 		innercstr += "<div class="+this.cno+"><p>"+this.comments+"</p></div>"
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

