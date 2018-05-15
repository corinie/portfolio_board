

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
										<a href="/board/view?bno=${item.bno}&page=${pm.page}"><c:out value="${item.title }"></c:out></a>
									</h4>
									<p>
										Writer &nbsp;&nbsp; <c:out value="${item.writer }"></c:out>
										&nbsp;&nbsp;  <c:out value="${item.regdate }"></c:out>
									</p>
								</div>
								<div class="blog-left-right-bottom">
									<p> <c:out value="${item.bno}"></c:out></p>

								</div>

							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</c:forEach>
				<nav>
					<ul class="pagination">
					<c:if test="${pm.prev}">
						<li><a href="/board/list?page=${pm.start -1}" aria-label="Previous"> 
						<span aria-hidden="true">◁</span></a></li>
					</c:if>
					
						<c:forEach begin="${pm.start}" end="${pm.end}" var="page">
							<li><a href="/board/list?page=${page}">${page}</a>
						</c:forEach>
						
						<c:if test="${pm.next}">
						<li><a href="/board/list?page=${pm.end +1}" aria-label="Next"> 
						<span aria-hidden="true">▷</span></a></li>
					</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-md-4 agile-blog-grid-right"></div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //blog -->

<%@ include file="../includes/footer.jsp"%>