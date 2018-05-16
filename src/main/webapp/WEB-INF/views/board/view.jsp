<%@ include file="../includes/header.jsp"%>
	<div class="about-heading">
		<h2>Single <span>page</span></h2>
	</div>
	<!-- //about-heading -->
	<!-- blog -->
	<div class="blog">
		<div class="container">
			<div class="agile-blog-grids">
				<div class="col-md-8 agile-blog-grid-left">
					<div class="agile-blog-grid">
						<div class="agile-blog-grid-left-img">
							<a href="/board/list${cri.getUrl(param.bno)}"><button class="label label-danger">back</button></a>
							<a href="single.html"><img src="images/2a.jpg" alt="" /></a>
						</div>
						<div class="blog-left-grids">
							<div class="blog-left-left">
								<i class="fa fa-pencil" aria-hidden="true"></i>
							</div>
							<div class="blog-left-right">
								<div class="blog-left-right-top">
									<h2><c:out value="${vo.title }"></c:out></h2>
									<p>writer &nbsp;&nbsp; <c:out value="${vo.writer }"></c:out>  &nbsp;&nbsp; <c:out value=" ${vo.regdate }"></c:out></p>
								</div>
								<div class="blog-left-right-bottom">
									<p>${vo.content}</p>
								</div>
							</div>
							<div align="right">
							<a href="/board/update${cri.getUrl(param.bno)}"><button class="label label-default">UPDATE</button></a>
							<form method="post" action="/board/delete?bno=${vo.bno}"><button class="label label-default">DELETE</button></form>
							</div>
							<div class="clearfix"> </div>
						</div>
						<!--VIEW END-->
						<!--REPLY LIST-->
						<div class="response">
								<h3>Responses</h3>
								<div class="media response-info">
									<div class="media-left response-text-left">
										<a href="#">
											<img class="media-object" src="images/t1.jpg" alt="">
										</a>
										<h5><a href="#">Admin</a></h5>
									</div>
									<div class="media-body response-text-right">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
											sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										<ul>
											<li>June 21, 2016</li>
											<li><a href="single.html">Reply</a></li>
										</ul>
										<div class="media response-info">
											<div class="media-left response-text-left">
												<a href="#">
													<img class="media-object" src="images/t2.jpg" alt="">
												</a>
												<h5><a href="#">Admin</a></h5>
											</div>
											<div class="media-body response-text-right">
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
													sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
												<ul>
													<li>June 21, 2016</li>
													<li><a href="single.html">Reply</a></li>
												</ul>		
											</div>
											<div class="clearfix"> </div>
										</div>
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="media response-info">
									<div class="media-left response-text-left">
										<a href="#">
											<img class="media-object" src="images/t3.jpg" alt="">
										</a>
										<h5><a href="#">Admin</a></h5>
									</div>
									<div class="media-body response-text-right">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
											sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										<ul>
											<li>June 21, 2016</li>
											<li><a href="single.html">Reply</a></li>
										</ul>		
									</div>
									<div class="clearfix"> </div>
								</div>
								<!--REPLY LIST END-->
						</div>
						
						<!--REPLY REGISTER -->
						<div class="opinion">
							<h3>Leave Your Comment</h3>
							<form action="#" method="post">
								<input type="text" name="Name" placeholder="Name" required="">
								<input type="email" name="Email" placeholder="Email" required="">
								<textarea name="Message" placeholder="Message" required=""></textarea>
								<input type="submit" value="SEND">
							</form>
						</div>
						
						<!--REPLY REGISTER END-->
					</div>
				</div>
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	<script>
	
	
	
	</>
	<%@ include file="../includes/footer.jsp"%>