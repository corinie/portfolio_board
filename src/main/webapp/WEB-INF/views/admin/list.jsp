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
		
		
			
			<form method="post" enctype="multipart/form-data"
				action="/admin/insert">
				<div class="three-fifth column first">
				<span style="color: red;">* 새로운 회원 데이터는 확장자 엑셀(.xlsx) 파일만 올려주세요 *</span>
				</div>
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">
					<div class="one-fifth column">
					 <input type="file" name='uploadFile' style="display: inline">
					 </div>
					 <div class="one-fifth button-right">
					 <input type="submit" value="SEND">
		
				</div>
			</form>
			
		</div>
		<h4></h4>
		<div class="container">	
			
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
				<div class="three-fifth column first">
					<input type="text" class="text" name="keyword" id="searchKeyword"
						placeholder="Enter to search the keyword" required="">
				</div>


				<div class="one-fifth column button-right">
					<input type="submit" value="Search">
				</div>
				<div class="clearfix"></div>
			</form>
			

		
			<h4></h4>
			<div class="two-fifth column first">
					<h2>
						Auth <span>Change</span>
					</h2>
				</div>
			
			<div class="one-fifth button-right">
				<a href="/admin/list"><input type="submit" value="ALL"></a>
			</div>
			<div class="one-fifth button-right">
				<a href="/admin/list?authType=a&keyword"><input type="submit"
					value="ADMIN"></a>
			</div>
			<div class="one-fifth button-right">
				<a href="/admin/list?authType=m&keyword"><input type="submit"
					value="MANAGER"></a>
			</div>
			<div class="one-fifth button-right">
				<a href="/admin/list?authType=n&keyword"><input type="submit"
					value="MEMBER"></a>
			</div>


			
		
		


			<form method="post" action="/admin/authChange">
			
				<input type="hidden" name="${_csrf.parameterName }"
					value="${_csrf.token }">

				<div class="one-fifth column">
					<input type="submit" value="CHANGE">
				</div>
				<div class="one-fifth column first">

					<span class="selection-box"> <select name="authType"
						id="authType">
							<option>----</option>
							<option value="amn">ADMIN</option>
							<option value="mn">MANAGER</option>
							<option value="n">MEMBER</option>
					</select>
					</span>



				</div>
		</div>
</div>


		<div class="container">
			<div class="agile-blog-grid">
				<c:forEach items="${list }" var="item">

					<!--mname, tbl_member.mid, email, regdate, updatedate-->
					<div class="agile-blog-grid">
						<div class="blog-left-grids">
							<div align="left">
							
								<input type="checkbox" name="mid" value="${item.mid}">

							</div>
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
			</div>	
	
			
				
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
var url = "<li><a href='/admin/list?";
var authType = "${param.authType}";
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

	if(authType) {
		bno = $(".view").data("bno");
		param = "/admin/view?bno="+bno+"&page="+${pm.page}+"&type=${param.type}&keyword=${param.keyword}";
		$(".view").attr("href", param);
	}
	paging();
	
});

function paging() {
	if(authType){
		url += "authType="+authType+"&keyword="+keyword+"&"; 
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
	$("#keyword").val("${param.keyword}");
	
});


</script>

<script src="/resources/js/list.js"></script>
<%@ include file="../includes/footer.jsp"%>