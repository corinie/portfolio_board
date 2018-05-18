<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
								<c:if test="${item.deleteyn eq 'n' }">
									<h4>
										<a href="/board/view${cri.getUrl(item.bno)}" class="view"
											data-bno="${item.bno}"> <c:out value="${item.title}"></c:out></a>&nbsp;
										<span><a href="${item.bno }" class="replyBtn"  data-display="show" >(${item.boardcount })</a></span>
									</h4>
									</c:if>
									<c:if test="${item.deleteyn eq 'm' }">
									<h4>
										<c:out value="이 글은 삭제된 글입니다."></c:out>&nbsp;
										<span><a href="${item.bno }" class="replyBtn"  data-display="show">(${item.boardcount })</a></span>
									</h4>
									</c:if>
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
								<div class="replyList">
									<div id="${item.bno}"></div>
								</div>
								<div class="clearfix"></div>
							</div>

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
						</select> <input type="text" name="keyword">
						<button>search</button>
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


<!--SCRPIPT START-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
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
var url = "<li><a href='/board/list?";
var type = "${param.type}";
var keyword = "${param.keyword}";

var replyBtn = $(".replyBtn");
var replystr = "";
var str = "";
var bno = "";
var num = "";
var replyList = "";
var urlbuilder = "";
var display = "";





/* FUNCTION */
$(document).ready(function () {
	
	if(type) {
		bno = $(".view").data("bno");
		param = "/board/view?bno="+bno+"&page="+${pm.page}+"&type=${param.type}&keyword=${param.keyword}";
		$(".view").attr("href", param);
	}
	paging();
	
});

$(".container").on("click", "span a", function (e) {
	getAlllist(e);
	
});

function getAllOpen(){
	$(".container span a").attr("data-display", "show");
};

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


/* LISTING*/
function getAlllist(e){
	num = e.target.attributes.href.nodeValue;
	replyList = $("#"+num);
	display = $(e.target);
	display.attr("data-display");
	
	e.stopPropagation();
	e.preventDefault();
	getJson(num);
	
	
};

function getJson(bno){
	
	if(display.attr("data-display") == "show"){
	
	$.getJSON("/reply/"+bno, function (data) {
		$(data).each(function () {
			if(this.depth != 0){
				urlbuilder =  makeURI(this.bno);
	
				replystr += "<div class='agile-blog-grid'>"
				+				"<div class='blog-left-grids'><div class='blog-left-left'>"
				+					"<i class='fa fa-pencil' aria-hidden='true'></i>"
				+				"</div>"
				+				"<div class='blog-left-right'><div class='blog-left-right-top'>"
				+						"<div class='blog-left-right-top'>";
				
				if(this.deleteyn == 'n'){
					replystr += "<h4><a href='/board/view"+urlbuilder+"' class='view' data-bno='"+this.bno+"'>"+this.title+"</a>"
					+								"<span><a href='"+this.bno+"' class='replyBtn' data-display='show'>("+this.boardcount+")</a></span>"
					+							"</h4>";
				}else if(this.deleteyn == 'm'){
					replystr += "<h4>이 글은 삭제된 글입니다. "
					+								"<span><a href='"+this.bno+"' class='replyBtn' data-display='show'>("+this.boardcount+")</a></span>"
					+							"</h4>";
				}
					
				replystr+=	 "<p>Writer &nbsp;&nbsp;"+this.writer+"&nbsp;&nbsp;"+this.regdate+"</p>"
				+						"</div>"
				+				"</div>"
				+				"<div class='blog-left-right-bottom'><p>"+this.bno+"</p></div>"
				+					"<div class='replyList'>"
				+						"<div id='"+this.bno+"'></div>"
				+					"</div>"
				+				"</div>"
				+			"</div>";
			}
			replyList.html(replystr);
			
		});
		replystr = "";
		display.attr("data-display", "hide");
	});
	}else if(display.attr("data-display") == "hide"){
		replyList.html(replystr);
		display.attr("data-display", "show");
	}
};

/*JS URI MAKER*/
function makeURI(bno){
	var getUrl = "${cri.getUrl("")}";
	var urlString = getUrl + bno;
	
	return urlString;	
}
</script>


<%@ include file="../includes/footer.jsp"%>