<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>메일 보내기</h3>

<form method="POST">
	<p><input type="email" name="address" placeholder="받는 사람" required autofocus></p>
	<p><input type="text" name="subject" placeholder="제목" required></p>
	<p>
		<textarea name="content" placeholder="내용" required></textarea>
	</p>
	<p><input type="submit"></p>
</form>

</body>
</html>