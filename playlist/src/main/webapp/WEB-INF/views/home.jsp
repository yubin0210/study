<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>
	<div class="container">
		<header>
			<h1>Discover Music</h1>
		</header>

		<!-- 검색 폼 -->
		<div class="search-section">
			<form action="<c:url value='/search'/>" method="post">
				<input type="text" id="query" name="query"
					placeholder="Search for songs, artists..." required>
				<button type="submit">Search</button>
			</form>
		</div>

		<!-- 추천 곡 목록 -->
		<div class="recommendations">
			<h2>Recommended for You</h2>
			<ul>
				<c:forEach var="track" items="${recommendedTracks}">
					<li><a href="https://www.youtube.com/watch?v=${track.videoId}"
						target="_blank"> ${track.title} - ${track.artist} </a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>