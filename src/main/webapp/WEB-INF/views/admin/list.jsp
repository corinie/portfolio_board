<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- //header -->
<!-- about-heading -->
<div class="about-heading">
	<h2>
		Result <span>Board</span>
	</h2>
</div>
<!-- //about-heading -->
<!-- blog -->
<div class="blog">
	<div class="container">
		<div class="agile-blog-grids">
			<p style="color: red;">* 새로운 회원 데이터는 확장자 엑셀(.xlsx) 파일만 올려주세요 *</p>
			<form method="post" enctype="multipart/form-data"
				action="/admin/insert">
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }"> <input type="file"
					name='uploadFile' style="display: inline">
				<button class="btn1">전송</button>

			</form>

			<div class="container">
				<div class="one-fifth button-right">
					<a href="/admin/list"><input type="submit" value="ALL"></a>
				</div>
				<div class="one-fifth button-right">
					<a href="/admin/list?authType=a"><input type="submit"
						value="ADMIN"></a>
				</div>
				<div class="one-fifth button-right">
					<a href="/admin/list?authType=m"><input type="submit"
						value="MANAGER"></a>
				</div>
				<div class="one-fifth button-right">
					<a href="/admin/list?authType=n"><input type="submit"
						value="MEMBER"></a>
				</div>
				<h4>
					<hr style="border: solid 2px black">
				</h4>
			</div>

			<div class="agile-blog-grids">
				<c:forEach items="${list }" var="item">
					<!--mname, tbl_member.mid, email, regdate, updatedate-->
					<div class="agile-blog-grid">
						<div class="blog-left-grids">

							<div class="blog-left-left">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</div>

							<div class="blog-left-right">
								<div class="blog-left-right-top">
									<c:if test="${item.deleteyn eq 'n' }">
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
										<br> JOB HISTORY : &nbsp;&nbsp; &nbsp;regdate =
										<c:out value="${item.regdate }"></c:out>
										&nbsp;updatedate =
										<c:out value="${item.updatedate }"></c:out>
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

				<!--SEARCH VAR-->
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

					<div class="one-fifth column button-right">
						<input type="submit" value="Search">
					</div>
					<div class="clearfix"></div>
				</form>
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
var url = "<li><a href='/admin/list?";
var authType = "${param.authType}";


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

	if(authType) {
		bno = $(".view").data("bno");
		param = "/admin/view?bno="+bno+"&page="+${pm.page}+"&type=${param.type}&keyword=${param.keyword}";
		$(".view").attr("href", param);
	}
	paging();
	
});

function paging() {
	if(authType){
		url += "authType="+authType+"&"; 
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
	
	$("#authType").val("${param.authType}");
	
	
});


</script>

<script src="/resources/js/list.js"></script>
<%@ include file="../includes/footer.jsp"%>