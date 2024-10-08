<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>

<div class="main">
	<c:if test="${empty param.category }">
		<c:set var="list" value="${dao.selectList() }" />
	</c:if>
	<c:if test="${not empty param.category }">
		<c:set var="list" value="${dao.selectList() }" />
	</c:if>

	<div class="box">
		<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="img">
				<a href="${cpath }/view.jsp?idx=${dto.idx }">
					<img src="${cpath }/image/${dto.imgName }"></a>
			</div>
			<div class="name">${dto.name }</div>
		</div>	
		</c:forEach>
	</div>
</div>

<jsp:include page="footer.jsp" />



