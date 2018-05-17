

<%@ include file="../includes/header.jsp"%>

<!-- //header -->
<!-- about-heading -->
<div class="about-heading">
	<h2>
		Our <span>Blog</span>
	</h2>
</div>
<!-- //about-heading -->
<!-- blog -->
<div class="blog">
	<div class="container">
		<div class="agile-blog-grids">
			<div class="container">
				<c:forEach items="${list }" var="item">
					<div class="agile-blog-grid">
						<div class="blog-left-grids">
							<div class="blog-left-left">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</div>
							<div class="blog-left-right">

								<div class="blog-left-right-top">
									<h4>
										<a href="/board/view${cri.getUrl(item.bno)}" class="view" data-bno="${item.bno}">
										<c:out value="${item.title}"></c:out></a>&nbsp;
										<a href="${item.bno }" class="replyBtn">(${item.boardcount })</a>
									</h4>
									<p>
										Writer &nbsp;&nbsp;
										<c:out value="${item.writer }"></c:out>
										&nbsp;&nbsp;
										<c:out value="${item.regdate }"></c:out>
									</p>
								</div>
								<div class="blog-left-right-bottom">
									<p>
										<c:out value="${item.bno}"></c:out>
									</p>
								</div>
							</div>
							<div class="replyList">
							<div id="${item.bno}">
							
							</div>
							
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</c:forEach>
				<!--SEARCH VAR-->
				<div>
				<form action="/board/list">
					<select name="type">
						<option value="t">title</option>
						<option value="c">content</option>
						<option value="w">writer</option>
						<option value="tc">title+content</option>
						<option value="tw">title+writer</option>
						<option value="cw">content+writer</option>
						<option value="tcw">title+content+writer</option>
					</select> 
					<input type="text" name="keyword"> <button>search</button>
					</form>
					
					<h3 class="hdg" align="right">
						<a href="/board/register"><button class="label label-success">REGISTER</button></a>
					</h3>
				</div>
				<!--SEARCH VAR END-->
				
				<!--PAGINATION-->
				<nav>
					<ul class="pagination">
						
					</ul>
				</nav>
				<!--PAGINATION END-->
			</div>
			<div class="col-md-4 agile-blog-grid-right"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //blog -->

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

<script>

	if(${message eq "rsuccess"}){
		alert("wow register success baby !");
	}
	if(${message eq "usuccess"}){
		alert("wow update success baby !");
	}
	if(${message eq "dsuccess"}){
		alert("wow delete success baby !");
	}
	

</script>

<script>

var pagination = $(".pagination");
var str = "";
var url = "<li><a href='/board/list?";
var bno = "";
var type = "${param.type}";
var keyword = "${param.keyword}";
var replyBtn = $(".replyBtn");
var replystr = "";

replyBtn.on("click", function (e) {
	
	var num = e.target.attributes.href.nodeValue;
	console.dir(e.target.attributes.href.nodeValue);
	var replyList = $("#"+num);
	e.preventDefault();
	
	$.getJSON("/reply/"+num, function (data) {
		$(data).each(function () {
			if(this.depth != 0){
				replystr += "&nbsp;&nbsp;<div class='agile-blog-grid'><div class='blog-left-grids'><div class='blog-left-left'><i class='fa fa-pencil' aria-hidden='true'></i></div><div class='blog-left-right'><div class='blog-left-right-top'><h5><div class='blog-left-right-top'><h5><a href='/board/view${cri.getUrl("+this.bno+")}' class='view' data-bno='"+this.bno+"'>"+this.title+"</a>	<a href='"+this.bno+"' class='replyBtn'>("+this.boardcount+")</a></h5><p>Writer &nbsp;&nbsp;"+this.writer+"&nbsp;&nbsp;"+this.regdate+"</p></div></div><div class='blog-left-right-bottom'><p>"+this.bno+"</p></div></div><div class='replyList'><div id='"+this.bno+"'></div></div></div></div>";
				
				
			}
			replyList.html(replystr);
		})
		replystr = "";
	})
	
});

$(document).ready(function () {
	
	if(type) {
		bno = $(".view").data("bno");
		param = "/board/view?bno="+bno+"&page="+${pm.page}+"&type=${param.type}&keyword=${param.keyword}";
		$(".view").attr("href", param);
	}
	paging();
});

function paging() {
	
	if(type){
		url += "type="+type+"&keyword="+keyword+"&"; 
		}
		if(${pm.prev}){
			str = url+"page="+${pm.start-1}+ "' aria-label='Previous'> <span aria-hidden='true'>◁</span></a></li>";
		}
		for(var i = ${pm.start}; i<= ${pm.end}; i++){
			str += url+"page="+i+"'>"+i+"</a></li>";
		}
		if(${pm.next}){
			str += url+"page="+${pm.end+1}+"' aria-label='Previous'> <span aria-hidden='true'>◁</span></a></li>";
		}
		pagination.html(str);
}
</script>

<%@ include file="../includes/footer.jsp"%>