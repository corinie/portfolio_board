<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="about-heading">
	<h2>
		Contact <span>Us</span>
	</h2>
</div>
<!-- //about-heading -->
<!-- contact -->
<div class="contact">
	<div class="container">
		<div class="agile-contact-form">

			
				<div class="contact-form-top">
					<h3>
						Update <span>content</span>
					</h3>
				</div>
				<div class="agileinfo-contact-form-grid">
					<form method="post">
						<input type="text" name="title" placeholder="title" required=""
							value="${vo.title}"> <input type="text" name="writer"
							placeholder="writer" required="" value="${vo.writer}"
							readonly="readonly">
						<textarea name="content" placeholder="content" required="">${vo.content}</textarea>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="file-area">
							<input id="fileInput" type="file" multiple><br> 파일선택
							혹은 이 곳에 파일을 드래그하세요.<br>
							<div id="upload">
								<div class="uploadList">
									<c:forEach items="${fileList}" var="file">
										<c:if test="${file.image eq 'n' }">
											<div class="imgcontent">
												<img src='/resources/images/attach.png'> <a href='/download?fileName=${file.datefolder }/${file.uuid}_${file.fname}' download>
												<br>${file.fname }</a> 
												<span data-file="${file.datefolder }/${file.uuid}_${file.fname}" data-type='file' data-uuid='${file.uuid }'>ⓧ </span> 
												<input type='hidden' name='uuid' value='${file.uuid }'>
											</div>
										</c:if>
										<c:if test="${file.image eq 'y' }">
											<div class="imgcontent">
												<a href='/display?fileName=${file.datefolder }/${file.uuid}_${file.fname}' target="_blank">
												<img src='/display?fileName=${file.datefolder }/s_${file.uuid}_${file.fname}'></a>
												<a href='/display?fileName=${file.datefolder }/${file.uuid}_${file.fname}' download>
												<br>${file.fname }</a> 
												<span data-file="${file.datefolder }/${file.uuid}_${file.fname}" data-type='file' data-uuid='${file.uuid }'>ⓧ </span> 
												<input type='hidden' name='uuid' value='${file.uuid }'>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div align="right" style="inline">
						<input type="hidden" name="page" value="${param.page}">
						<button class="btn1">Submit</button>
						
					</form>
						<a href="/board/view?bno=${vo.bno}&page=${param.page}"><button
							class="btn1">Return</button></a>
						</div>
				</div>
			
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script src="/resources/js/update.js"></script>

<%@ include file="../includes/footer.jsp"%>
