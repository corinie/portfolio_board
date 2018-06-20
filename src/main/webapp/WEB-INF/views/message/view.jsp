<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--imagebox-->
<div class="imagebox">
</div>
<!--imagebox end-->


<div class="about-heading">
	<h2>
		Message <span>content</span>
	</h2>
</div>
<!-- //about-heading -->
<!-- contact -->
<div class="contact">
	<div class="container">
		<div class="agile-contact-form">
				<div class="contact-form-top">
					<div align="right">
					<a href="/message/list?page=${param.page }"><button class="btn1">Return</button></a>
					</div>
				</div>
				<div class="agileinfo-contact-form-grid">
					<form>
						<input type="text" name="title"  required="" readonly="readonly" value="${vo.title }">
						<input type="text" name="writer"  required="" readonly="readonly" value="${vo.sender }">
						<input type="text" name="writer"  required="" readonly="readonly" value="${vo.receiver }">
						<textarea name="content" required="" readonly="readonly"><c:out value="${vo.message }"></c:out></textarea>
					</form>
				</div>			
			<div class="clearfix"></div>
		</div>


	</div>
</div>



<%@ include file="../includes/footer.jsp"%>
