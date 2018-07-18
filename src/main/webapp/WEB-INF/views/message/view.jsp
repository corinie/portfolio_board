<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--imagebox-->
<div class="imagebox">
</div>
<!--imagebox end-->


<h1>REGISTER</h1>
<!-- //about-heading -->
<!-- contact -->

					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<div class="row gtr-uniform">
						
						
						
						<div class="col-6 col-12-xsmall">
							<input type="text" name="writer" id="writer" value="SENDER:${vo.sender }" readonly="readonly" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="writer" id="writer" value="RECEIVER:${vo.receiver }" readonly="readonly"  />
						</div>
						
						<div class="col-12">
							<input type="text" name="title" placeholder="title" required="" value="${vo.title }">
						</div>
						
						
						<!-- Break -->
						<div class="col-12">
							<textarea name="content" id="content"
								placeholder="${vo.message }" rows="6" disabled></textarea>
						</div>
						<div>
							<a href="/message/list?page=${param.page }" class="ahref"><button class="button primary inline-right">Return</button></a>
						</div>
						
					</div>
						
						




<%@ include file="../includes/footer.jsp"%>
