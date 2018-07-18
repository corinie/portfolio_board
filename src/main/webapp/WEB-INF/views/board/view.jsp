<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



<style>
h3 {
	display: inline
}
</style>
<!-- //about-heading -->
<h2>VIEW</h2>

	<!--QUICK BAR-->
	<div class="box" >
			<div class="two-fifth column first">
					<h2>
						Quick<span>Bar</span>
					</h2>
				</div>
				
				<!--UPDATE/DELETE/REPLY button-->
				<div class="one-fifth inline-right">

						<c:if test="${vo.writer eq pinfo.username}">
							<a href="/board/update${cri.getUrl(param.bno)}" class="havebno" data-bno="${param.bno}"><button class="button primary">UPDATE</button></a>
							<form method="post" class="inline-right" action="/board/delete?bno=${vo.bno}&pbno=${vo.pbno}">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
								<button class="button primary">DELETE</button>
							</form>
						</c:if>

						<c:if test="${vo.status eq 'ongoing'}">
							<a href="/board/replyregister${cri.getUrl(param.bno)}"  class="havebno" data-bno="${param.bno}">
								<button class="button primary">REPLY</button>
							</a>
						</c:if>
					</div>
					<!--UPDATE/DELETE/REPLY button END-->
				
				<!--STATUS QUICK BAR-->	
				<div class="one-fifth" >
					<form action='/board/statusupdate' method="post" class="inline-left">
					
											
				
						
							<c:choose>
								<c:when test="${vo.rbno eq vo.bno and user.username eq vo.writer and vo.status ne 'pause' and vo.status ne 'completion'}">
									<button class="button disabled" name="status" value="ongoing" >Ongoing</button>
									<button class="button disabled" name="status" value="refuse" >REFUSE</button>
									<button class="button primary" name="status" value="completion" >COMPLETION</button>
								</c:when>
								
								<c:when test="${vo.rbno eq vo.bno and user.username eq vo.writer and vo.status ne 'pause' or vo.status eq 'refuse'}">
									<button class="button disabled" name="status" value="ongoing" >Ongoing</button>
									<button class="button disabled" name="status" value="refuse" >REFUSE</button>
									<button class="button disabled" name="status" value="completion" >COMPLETION</button>
								</c:when>
								
								<c:when test="${vo.rbno eq vo.bno and (rootWriter eq user.username) and user.username eq vo.writer and vo.status ne 'pause' or vo.status eq 'ongoing'}">
									<button class="button disabled" name="status" value="ongoing" >Ongoing</button>
									<button class="button disabled" name="status" value="refuse" >REFUSE</button>
									<button class="button primary" name="status" value="completion" >COMPLETION</button>
								</c:when>
								
								
								<c:when test="${(vo.rbno ne vo.bno) and (rootWriter eq user.username) and (vo.status ne 'pause') and (vo.status ne 'refuse')}">
									<button class="button primary" name="status" value="ongoing" >Ongoing</button>
									<button class="button primary" name="status" value="refuse" >REFUSE</button>
									<button class="button primary" name="status" value="completion" >COMPLETION</button>
								</c:when>

								<c:otherwise>
									<button class="button disabled" name="status" value="ongoing" >Ongoing</button>
									<button class="button disabled" name="status" value="refuse" >REFUSE</button>
									<button class="button disabled" name="status" value="completion" >COMPLETION</button>
								</c:otherwise>
							</c:choose>
							
							
							
							<input type="hidden" name="bno" value="${vo.bno}" >
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
					</form>
					<h4></h4>
				</div>
				<!--STATUS QUICK BAR END-->		
				
			</div>
			<!--QUICK BAR END-->
	<div>
		<h4></h4>
		<div class="agile-blog-grids">
			<div class="agile-blog-grid">
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
					
					<div class="clearfix"></div>

				</div>

				<!--VIEW END-->
				<br> <br>
				<h3>File Attament</h3>
				<div class="file-area">
				<span class="flex">
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
					</span>
				</div>

				<br> <br>


				<!--comment REGISTER -->
				<div class="opinion">
					<h3>Leave Your Comment</h3>


					<form>
						<sec:authentication property="principal" var="pinfo" />
						<input type="hidden" name="bno" value="${vo.bno}">
						<c:if test="${pinfo eq 'anonymousUser'}">
							<input type="text" name="commenter" placeholder="Name"
								required="" id="commenter"  value="${pinfo}" readonly="readonly">
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
					<div class="col-12">
							<div class="file-area">
								<div class="flex">
									<input id="fileInput" type="file" multiple>
									<div>SELECT THE FILES OR DRAG & DROP HERE</div>
									<div id="upload">
										<div class="uploadList"></div>
									</div>
								</div>
							</div>
						</div>
						<h4></h4>
					<h4 align="right">
						<button class="button primary" id="sendBtn">SEND</button>
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


<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>



<script src="/resources/js/view.js"></script>
<%@ include file="../includes/footer.jsp"%>