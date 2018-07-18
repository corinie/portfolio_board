<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- //header -->
<!-- about-heading -->

<!-- //about-heading -->
<!-- blog -->
<div>
	<div class="content">
		<form action="/admin/list">
			<div class="two-fifth column first">
				<h2>
					Search <span>keyword</span>
				</h2>
			</div>
			<div class="one-fifth column">
				<span class="selection-box"> <select name="authType"
					id="authType">
						<option>----</option>
						<option value="a">ADMIN</option>
						<option value="m">MANAGER</option>
						<option value="n">MEMBER</option>
						<option value="am">ADMIN + MANAGER</option>
						<option value="an">ADMIN + MEMBER</option>
						<option value="mn">MANAGER + MEMBER</option>
						<option value="amn">ADMIN + MANAGER + MEMBER</option>
				</select>
				</span>
			</div>
			<div class="three-fifth column first">
				<input type="text" class="text" name="keyword" id="searchKeyword"
					placeholder="Enter to search the keyword" required="">
			</div>


			<div class="col-4 col-12-small inline-right-search">
				<input type="submit" value="SEARCH" class="button primary">
			</div>
			<div class="clearfix"></div>
		</form>

	</div>

	<h4></h4>

	<div class="box">
		<div class="two-fifth column first">
			<h2>
				Auth <span>Change</span>
			</h2>
		</div>

		<div class="one-button button-right">
			<a href="/admin/list" class="ahref"><input type="submit"
				value="ALL"></a>
		</div>
		<div class="one-button button-right">
			<a href="/admin/list?authType=a&keyword" class="ahref"><input
				type="submit" value="ADMIN"></a>
		</div>
		<div class="one-button button-right">
			<a href="/admin/list?authType=m&keyword" class="ahref"><input
				type="submit" value="MANAGER"></a>
		</div>
		<div class="one-button button-right">
			<a href="/admin/list?authType=n&keyword" class="ahref"><input
				type="submit" value="MEMBER"></a>
		</div>







		<form method="post" action="/admin/authChange" class="one-second ">

			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }">

			<div class="one-button inline-left">
				<input type="submit" value="CHANGE">
			</div>
			<div class="one-button ">

				<select name="authType" id="authType">
					<option>----</option>
					<option value="amn">ADMIN</option>
					<option value="mn">MANAGER</option>
					<option value="n">MEMBER</option>
				</select> </span>



			</div>
	</div>
</div>


<div>
	<div class="agile-blog-grid">
		<c:forEach items="${list }" var="item">

			<!--mname, tbl_member.mid, email, regdate, updatedate-->
			<div class="agile-blog-grid">
				<div class="blog-left-grids">
					<div align="left">
					</div>
					<div class="blog-left-left">


						<!-- normal -->
						<div class="ih-item circle bottom_to_top">
							
							<div class="img">
								<img src="/resources/images/pic/${item.mid }.jpg" alt="img" />
							</div>

						</div>

					</div>


					<div class="blog-left-right">
						<div class="blog-left-right-top">
							<c:if test="${item.deleteyn eq 'n' }">
							<div class="col-6 col-12-small inline-left">
									<input type="checkbox" id="${item.mid }" name="mid" value="${item.mid }">
									<label for="${item.mid }"></label>
							</div>
								<h4>
									<a href="#" class="view" data-bno="${item.mname}"> &nbsp;<c:out
											value="${item.mname}"></c:out><br>
									</a>
								</h4>
							</c:if>

							<p>
								ID&nbsp; : &nbsp;
								<c:out value="${item.mid}"></c:out>
								<br> Auth: &nbsp;
								<c:out value="${item.authList[0].auth}"></c:out>

							</p>

						</div>


						<div class="blog-left-right-bottom"></div>

						<div class="replyList"></div>
						<div class="clearfix"></div>
						<hr style="border: dashed 1px gray">
					</div>


				</div>

			</div>
		</c:forEach>
		</form>

		<!--SEARCH VAR-->

	</div>
	<form method="post" enctype="multipart/form-data" action="/admin/insert">
		<div class="col-4 col-12-small inline-left">
			<span style="color: red;">* 새로운 회원 데이터는 확장자 엑셀(.xlsx) 파일만
				올려주세요 *</span>
		</div>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div class="col-4 col-12-small inline-left">
			<input type="file" name='uploadFile' style="display: inline">
		</div>
		<div class="col-4 col-12-small inline-right">
			<input type="submit" value="SEND" class="button primary">

		</div>
	</form>



	<div class="clearfix"></div>
	<!--PAGINATION-->
	<nav align="center">
		<ul class="pagination">

		</ul>
	</nav>
	<h1></h1>
	<!--PAGINATION END-->




	<div class="col-md-4 agile-blog-grid-right"></div>
	<div class="clearfix"></div>


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