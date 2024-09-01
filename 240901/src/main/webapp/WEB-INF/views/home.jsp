<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="${cpath }/resources/script/chat.js"></script>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/style/style.css">
<script>
	// JSP에서 자바스크립트로 넘기는 변수
	const roomName = '${room.name}'
	const username = '${login}'
	const cpath = '${cpath}'
</script>
</head>
<body>

<h1><a href="${cpath }">ws03 - 전체 채팅 및 귓속말</a></h1>
	<c:if test="${not empty login }">
	<p align="right">
		<span>${login }</span>
		<input id="logout" type="button" name="logout" value="로그아웃">
	</p>
	</c:if>
<hr>

<c:if test="${empty login }">
	<form method="POST">
		<input type="text" name="username" required autofocus>
		<input type="submit" value="입장">
	</form>
</c:if>

<c:if test="${not empty login }">
	<div id="root">
		<div class="left">
			<h3>접속자 목록</h3>
			<ul class="userList"></ul>
		</div>
		<div class="right">
			<h3>채팅</h3>
			<div id="messageArea"></div>
			<p>
				<input type="text" name="msg" placeholder="내용을 입력하세요" required autofocus autocomplete="off">
				<input type="button" value="send">
			</p>
		</div>
	</div>
	<script>
		const messageArea = document.getElementById('messageArea')
		const sockJS = new SockJS(cpath + '/endpoint')
		const stomp = Stomp.over(sockJS)
		
		const sendBtn = document.querySelector('input[value="send"]')
		const msgInput = document.querySelector('input[name="msg"]')
		const logout = document.getElementById('logout')
		
		stomp.connect({}, onConnect)
		
		logout.onclick = onLogout
		sendBtn.onclick = onInput
		msgInput.onkeyup = function(e) {
			if(e.key == 'Enter') onInput()
			if(e.key == 'Escape') e.target.value = ''	// 입력창에서 ESC 누르면 내용 지움
		}
	</script>
</c:if>

</body>
</html>