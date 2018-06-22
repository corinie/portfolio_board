<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--imagebox-->
<div class="imagebox"></div>
<!--imagebox end-->

<div class="about-heading">
	<h2>
		Single <span>page</span>
	</h2>
</div>

<style>
h3 {
	display: inline
}
</style>
<!-- //about-heading -->
<!-- blog -->
<div class="blog">
	<div class="container">
		<form action='/board/statusupdate' method="post">
			<c:if
				test="${vo.rbno eq vo.bno and user.username eq vo.writer and vo.status ne 'pause' and vo.status ne 'completion'}">
				<input type="radio" name="status" value="pause"> 중지
			<button>설정</button>
			</c:if>
			<c:forEach items="${user.authorities}" var="auth">
				<c:if test="${vo.status eq 'choice'}">
					<input type="radio" name="status" value="refuse"> 반려
				<button>설정</button>
				</c:if>
				<c:if
					test="${vo.rbno ne vo.bno and auth eq 'ROLE_MANAGER' and rootWriter eq user.username and vo.status ne 'pause' and vo.status ne 'refuse'}">
					<input type="radio" name="status" value="refuse"> 반려
			<input type="radio" name="status" value="ongoing"> 진행
			<input type="radio" name="status" value="completion"> 최종
			<button>설정</button>
				</c:if>
			</c:forEach>
			<input type="hidden" name="bno" value="${vo.bno}"> <input
				type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">

		</form>
		<div class="agile-blog-grids">
			<div class="agile-blog-grid">
				<div class="agile-blog-grid-left-img">
					<a class="havebno" href="/board/list${cri.getUrl(param.bno)}"
						data-bno="${param.bno}"><button class="label label-danger">back</button></a>
					<a href="single.html"></a>
				</div>

				<div class="blog-left-grids">
					<div class="blog-left-left">
						<div class="ih-item circle bottom_to_top">
							<div class="img">
								<img src="/resources/images/pic/${vo.writer }.jpg" alt="img" />
							</div>
						</div>
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
						<div class="clearfix">
							<div class="blog-left-right-bottom">
								<p>${vo.content}</p>
							</div>
						</div>
					</div>
					<div align="right">

						<c:if test="${vo.writer eq pinfo.username}">
							<a href="/board/update${cri.getUrl(param.bno)}"><button
									class="label label-default">UPDATE</button></a>
							<form method="post"
								action="/board/delete?bno=${vo.bno}&pbno=${vo.pbno}">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token}">
								<button class="label label-default">DELETE</button>
							</form>
						</c:if>

						<c:if test="${vo.status eq 'ongoing'}">
							<a href="/board/replyregister${cri.getUrl(param.bno)}">
								<button class="label label-default">REPLY</button>
							</a>
						</c:if>
					</div>
					<div class="clearfix"></div>

				</div>

				<!--VIEW END-->
				<br> <br>

				<div class="fileList">
					<c:forEach items="${fileList }" var="file">
						<c:if test="${file.image eq 'n' }">
							<img src='/resources/images/attach.png'>
							<a
								href='/download?fileName=${file.datefolder }/${file.uuid}_${file.fname}'
								download>${file.fname }</a>&nbsp;
				</c:if>
						<c:if test="${file.image eq 'y' }">
							<img
								src='/display?fileName=${file.datefolder }/s_${file.uuid}_${file.fname}'
								class='file_image'
								data-fileLink='/display?fileName=${file.datefolder }/${file.uuid}_${file.fname}'>
							</a>
							<a
								href='/download?fileName=${file.datefolder }/${file.uuid}_${file.fname}'
								download>${file.fname }</a>&nbsp;
				</c:if>
					</c:forEach>
				</div>

				<br> <br>


				<!--comment REGISTER -->
				<div class="opinion">
					<h3>Leave Your Comment</h3>


					<form>
						<h1>${uinfo }</h1>
						<c:if test="${pinfo eq 'anonymousUser'}">
							<input type="text" name="commenter" placeholder="Name"
								required="" id="commenter" value="${pinfo}" readonly="readonly">
						</c:if>


						<c:if test="${pinfo ne 'anonymousUser'}">
							<input type="text" name="commenter" placeholder="Name"
								required="" id="commenter" value="${pinfo.username}"
								readonly="readonly">
						</c:if>


						<textarea name="comment" placeholder="Message" required=""
							id="comments"></textarea>



					</form>
					<br>
					<div class="file-area">
						<input id="fileInput" type="file" multiple="multiple">
						<div id="upload">
							<div class="uploadList"></div>
						</div>
					</div>
					<h4 align="right">
						<button class="label label-default" id="sendBtn">SEND</button>
					</h4>


				</div>
				<!--comment REGISTER END-->

				<!--comment LIST-->
				<div class="response">
					<h3>Responses</h3>
					<!--comment OUTER-->
					<div class="outer">
						<div class="media response-info">
							<div class="media-left response-text-left">
								<a href="#"> </a>
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

					<!--Pagination-->
					<div>
						<ul class="pagination"></ul>
					</div>

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



<script src="/resources/js/view.js"></script>

<%@ include file="../includes/footer.jsp"%>