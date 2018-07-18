<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
	
		<div>
			<div class="box" >
			<div class="two-fifth column first">
					<h2>
						Quick<span>Bar</span>
					</h2>
				</div>
				<div class="one-fifth button-right">
					<a href="/board/register"><button class="button primary">New Project</button></a>
				</div>

				<div class="one-fifth" >
					<a href="/board/list?status=ongoing" ><button class="button primary" name="status" value="ongoing" >ONGOING</button></a>
					<a href="/board/list?status=pause"><button class="button primary" name="status" value="pause" >PAUSE</button></a>
					<a href="/board/list?status=completion"><button class="button primary" name="status" value="completion" >COMPLETION</button></a>
				</div>
				
				
			</div>
			<h4></h4>
			<div class="block">
			<c:forEach items="${list }" var="item">
				<div class="agile-blog-grid">
					<div class="blog-left-grids">

						<div class="blog-left-left">
				
						
							<!-- normal -->
							<div class="ih-item circle bottom_to_top">
								<div class="img"><img src="/resources/images/pic/${item.writer }.jpg" alt="img" /></div>
								
							</div>
							
					
						
						</div>

						<div class="blog-left-right">
							<div class="blog-left-right-top">
								<c:if test="${item.deleteyn eq 'n' }">
									<h4>
										<span class="label ${item.status}">${item.status }</span> 
										<a href="/board/view${cri.getUrl(item.bno)}" class="view" data-bno="${item.bno}"> 
										<c:out value="${item.title}"></c:out></a>&nbsp; 
										<span><a href="${item.bno}" class="replyBtn" data-display="show">(${item.boardcount })</a></span>
									</h4>
								</c:if>
								<c:if test="${item.deleteyn eq 'm' }">
									<h4>
										<c:out value="이 글은 삭제된 글입니다."></c:out>
										&nbsp; <span><a href="${item.bno }" class="replyBtn"
											data-display="show">(${item.boardcount })</a></span>
									</h4>
								</c:if>
								
								<p>
									<h4>NAME(ID): <c:out value="${item.mname}(${item.writer})"></c:out></h4>
									<h4><c:out value="${item.regdate }"></c:out></h4>
								</p>
							</div>
							

							<div class="replyList">
								<div id="${item.bno}"></div>
							</div>
							<div class="clearfix"></div>
							<hr style="border: dashed 1px gray">
						</div>

					</div>

				</div>

			</c:forEach>
			</div>
			

			<!--SEARCH VAR-->
			
			<form action="/board/list" class="inline">
				<input type="hidden" name="status" value="${cri.status}">
				<div class="two-fifth column first">
					<h2>
						Search <span>keyword</span>
					</h2>
				</div>
				<div class="one-fifth column">
					<span class="selection-box"> <select name="type"
						id="searchType">
							<option>----</option>
							<option value="t">title</option>
							<option value="c">content</option>
							<option value="w">writer</option>
							<option value="tc">title+content</option>
							<option value="tw">title+writer</option>
							<option value="cw">content+writer</option>
							<option value="tcw">title+content+writer</option>
					</select>
					</span>
				</div>
				<div class="three-fifth column first">
					<input type="text" class="text" name="keyword" id="searchKeyword"
						placeholder="Enter to search the keyword" required="">
				</div>

				<div class="one-fifth column button-right">
					<button class="button primary" name="submit">SEARCH</button>
				</div>
				<div class="clearfix"></div>
			</form>
			
			<!--SEARCH VAR END-->
			
			<!--PAGINATION-->
			<div  align="center">
				<nav>
					<ul class="pagination">

					</ul>
				</nav>
			</div>
			<!--PAGINATION END-->

		
		</div>
		<div class="col-md-4 agile-blog-grid-right"></div>
		<div class="clearfix"></div>






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
		str = url+"page="+${pm.start-1}+ "' aria-label='Previous'><span class='button'>Prev</span></a></li>";
	}else{
		str += "<li><span class='button disabled'><h3>Prev</h3></span></li>";
	}
	for(var i = ${pm.start}; i<= ${pm.end}; i++){
		str += url+"page="+i+"'class='page active'>"+i+"</a></li>";
	}
	if(${pm.next}){
		str += url+"page="+${pm.end+1}+"' aria-label='Next'><span class='button'>Next</span></a></li>";
	}else{
		str += "<li><span class='button disabled'><h3>Next</h3></span></li>";
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
