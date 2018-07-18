<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

				

				<form method="post">
				<h2>REGISTER</h2>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="writer" id="writer"
								value="${pinfo.username}" readonly="readonly" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="email" name="email" id="email"
								value="${pinfo.authorities}" readonly="readonly" / />
						</div>
						<!-- Break -->
						<div class="col-12">
							<select name="category" id="category">
								<option value="">- Category -</option>
								<option value="1">Manufacturing</option>
								<option value="1">Shipping</option>
								<option value="1">Administration</option>
								<option value="1">Human Resources</option>
							</select>
						</div>
						<div class="col-12">
							<input type="text" name="title" placeholder="title" required="">
						</div>
						<!-- Break -->
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-low" name="demo-priority"
								checked> <label for="demo-priority-low">Low</label>
						</div>
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-normal"
								name="demo-priority"> <label for="demo-priority-normal">Normal</label>
						</div>
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-high" name="demo-priority">
							<label for="demo-priority-high">High</label>
						</div>
						
						<!-- Break -->
						<div class="col-12">
							<textarea name="content" id="content"
								placeholder="Enter your message" rows="6"></textarea>
						</div>
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
						<!-- Break -->
						<div class="col-12">
							<ul class="actions inline-right">
								<li><input type="submit" value="Send" class="primary" /></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</form>



			<script src="/resources/js/register.js"></script>
			<%@ include file="../includes/footer.jsp"%>