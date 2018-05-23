<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="about-heading">
	<h2>
		Single <span>page</span>
	</h2>
</div>
<!-- //about-heading -->
<!-- blog -->
<div class="blog">
	<div class="container">
		<div class="agile-blog-grids">
			<div class="agile-blog-grid">
				<div class="agile-blog-grid-left-img">
					<a href="/board/list${cri.getUrl(param.bno)}"><button
							class="label label-danger">back</button></a> <a href="single.html"><img
						src="images/2a.jpg" alt="" /></a>
				</div>
				<div class="blog-left-grids">
					<div class="blog-left-left">
						<i class="fa fa-pencil" aria-hidden="true"></i>
					</div>
					<div class="blog-left-right">
						<div class="blog-left-right-top">
							<h2>
								<c:out value="${vo.title }"></c:out>
							</h2>
							<p>
								writer &nbsp;&nbsp;
								<c:out value="${vo.writer }"></c:out>
								&nbsp;&nbsp;
								<c:out value=" ${vo.regdate }"></c:out>
							</p>
						</div>
						<div class="blog-left-right-bottom">
							<p>${vo.content}</p>
						</div>
					</div>
					<div align="right">
						<a href="/board/update${cri.getUrl(param.bno)}"><button
								class="label label-default">UPDATE</button></a>
						<form method="post"
							action="/board/delete?bno=${vo.bno}&pbno=${vo.pbno}">
							<button class="label label-default">DELETE</button>
						</form>
						<a href="/board/replyregister${cri.getUrl(param.bno)}">
						<button class="label label-default">REPLY</button></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<!--VIEW END-->
				
			<!--comment REGISTER -->
			<div class="opinion">
				<h3>Leave Your Comment</h3>
					<form>
					<input type="text" name="commenter" placeholder="Name" required="" id="commenter">
					<textarea name="comment" placeholder="Message" required="" id="comments"></textarea>
					</form>
					<h4 align="right"><button class="label label-default" id="sendBtn">SEND</button></h4>
			</div>
			<!--comment REGISTER END-->
			
				<!--comment LIST-->
				<div class="response">
					<h3>Responses</h3>
					<!--comment OUTER-->
					<div class="outer">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#"> <img class="media-object" src="images/t1.jpg"
									alt="">
								</a>
								<h5>comment</h5>
							</div>


							<div class="media-body response-text-right">
								<p>comments</p>
								<ul>
									<li>June 21, 2016</li>
									<li><a href="single.html">comment</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<!--comment OUTER END-->

					<div class="clearfix"></div>
					<!--inner comment END-->
				</div>
				<!--comment LIST END-->
			</div>

		</div>
	</div>

	<div class="clearfix"></div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>


<!--REPLY SCRIPT-->

<script>
/*REPLY LIST*/
	var page = 1;
	var bno = ${param.bno};
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
	
	$(document).ready(function() {
		getAllList(page);
		
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
			url : "/comment/bdelete/"+acno,
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
		});
	});
	
	$(".response").on("click", ".upsend", function (e){
		var ucomment = $("#ucomment").val();
		var ucno = $("#ucomment").attr("data-cno");
		
		console.log(ucomment);
		console.log(ucno);
		
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
	
	function getAllList() {
		$.getJSON("/comment/" + bno + "/" + page, function(data) {
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
		});
	};


</script>


<%@ include file="../includes/footer.jsp"%>