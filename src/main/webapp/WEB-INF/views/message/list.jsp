<%@ include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<h1>Message LIST</h1>
<div class="content">
	<c:if test="${fn:length(list) == 0}">
		<div align="center">
			<h1>No Message</h1>
			<img src="/resources/images/nomessage.png">
		</div>
	</c:if>
	<c:if test="${fn:length(list) > 0}">
		<table class="table table-hover" id="message-list">
			<thead>
				<tr>
					<td> - </td>
					<td>Title</td>
					<td>Sender</td>
					<td>Receiver</td>
					<td>Regdate</td>
					<td>Delete</td>
				</tr>
			</thead>
			
				<form action="/message/delete" method="post">
				
					<div class="content">
					<tbody>
						<c:forEach items="${list }" var="item">
						<tr>
							<td><i class="icon fa-paper-plane"></i></td>
							<c:if test="${item.status == 'n' }">
								<td><a
									href="/message/view?rmno=${item.rmno }&page=${pm.page}"
									style="text-decoration: none;"><c:out
											value="${item.title }"></c:out></a></td>
							</c:if>
							<c:if test="${item.status == 'y' }">
								<td><a
									href="/message/view?rmno=${item.rmno }&page=${pm.page}"
									style="text-decoration: none; color: gray;"><c:out
											value="${item.title }"></c:out></a></td>
							</c:if>
							<td><c:out value="${item.sender }"></c:out></td>
							<td><c:out value="${item.receiver }"></c:out></td>
							<td><fmt:formatDate value="${item.regdate}" pattern="yyyy-MM-dd" /></td>
							<td><input type="checkbox" id="${item.rmno }" name="delete" value="${item.rmno}"> <label for="${item.rmno}"></label>
							</td>
						</tr>
					</c:forEach>
					</tbody>
					</div>
					
				
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button class="button primary inline-right">Delete</button>
					
				</form>
			
		</table>
	</c:if>
	<div align="center">
		<nav>
			<ul class="pagination">
				<c:if test="${pm.prev}">
					<li><a href="/message/list?page=${pm.start - 1}"
						aria-label="Previous"> <span aria-hidden="true">Prev</span>
					</a></li>
				</c:if>
				<c:forEach begin="${pm.start }" end="${pm.end }" var="num">
					<li><a href="/message/list?page=${num }">${num }</a></li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li><a href="/message/list?page=${pm.end + 1}"
						aria-label="Next"> <span aria-hidden="true">Next</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</div>
<div class="col-md-4 agile-blog-grid-right"></div>
<div class="clearfix"></div>


<%@ include file="../includes/footer.jsp"%>