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
						<select name="type" id="searchType">
							<option>----</option>
							<option value="t">title</option>
							<option value="c">content</option>
							<option value="w">writer</option>
							<option value="tc">title+content</option>
							<option value="tw">title+writer</option>
							<option value="cw">content+writer</option>
							<option value="tcw">title+content+writer</option>
						</select> <input type="text" name="keyword" id="searchKeyword">
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
var message = "";


/* ALERT DIVISION*/
$(document).ready(function() {
	message = "${message}";
	checkModal(message);
	history.replaceState({}, null, null);
	
	console.dir(message);
	function checkModal(message) {
		 if (message === '' || history.state) {
			return;
		}else if(parseInt(message) == 0){
			alert("create success");
		}else if(parseInt(message) == 1){
			alert("delete success");
		}else if(parseInt(message) == 2){
			alert("update success");
		}
	}

});

/* FUNCTION */
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
		str += url+"page="+${pm.end+1}+"' aria-label='Previous'> <span aria-hidden='true'>▷</span></a></li>";
	}
	pagination.html(str);
}

/*JS URI MAKER*/
function makeURI(bno){
	var getUrl = "${cri.getUrl("")}";
	var urlString = getUrl + bno;
	
	return urlString;	
};
</script>

<script>



$(document).ready(function () {
	
	$("#type").val("${param.type}");
	$("#keyword").val("${param.keyword}");
	
});


</script>

<script src="/resources/js/list.js"></script>
<%@ include file="../includes/footer.jsp"%>