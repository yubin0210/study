<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="product.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="porkFeet.PorkFeetDAO" ></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
	html{
		margin: 0;
		padding: 0;
	}

	body{
		margin: 0;
		padding: 0;
	}
	
	a{
		text-decoration: none;
	}
	
	a:hover{
		cursor: pointer;
	}
	
	div.top{
		width: 100%;
		height: 470px;
		background-color: #444444;
		font size: 16px;
		color: white
	}
	
	div.header{
		position: fixed;
		width: 100%;
		height: 80px;
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid olive;
		background-color: white;
		color: #444444;
	}
	
	div.logo{
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 40px;
	}
	
	div.logo > a > img{
		width: 166px;
		height: 50px;
	}
	
	div.menu{
		display: flex;
		justify-content: center;
		align-items: center;
		flex: 5;
	}
	
	div.button{
		display: flex;
		flex: 1;
		justify-content: space-evenly;
		align-items: center;
	}
	
	div.button > a{
		width: 28px;
		height: 28px;
		position: relative;
	}
	
	div.button > input{
		background-color: white;
		display: none;
		transition-duration: 1s;
	}
	
	div.button > a:hover + input{
		display: block;
		position: absolute;
		left: 0;
		transition-duration: 1s;
		width: 100%;
		height: 100px;
	}
	
	div.banner{
		padding-top: 170px;
		text-align: center;
	}
	
	.menu > ul{
		justify-content: center;
		align-items: center;
		text-align: center;
		list-style: none;
		display: flex;
		flex: 1;
	}
	
	div.main{
		width: 80%;
		margin-left: 10%;
	}
	
	div.box{
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	
	div.item{
		box-sizing: border-box;
		width: 270px;
		margin: 30px;
		padding: 10px;
		font-size: 14px;
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
	}
	
	div.viewItem{
		box-sizing: border-box;
		width: 100%;
		margin: 30px;
		padding: 10px;
		font-size: 14px;
		display: flex;
		justify-content: center;
	}
	
	div.img > a > img{
		width: 300px;
	}
	
	.menu > ul > li{
		position: relative;
		flex: 1;
	}
	
	ul > li > ol{
		position: absolute;
		opacity: 0;
	}
	
	ul > li:hover > ol{
		opacity: 1;
		position: absolute;
		top : 50px;
		background-color:white;
		color: #444444;
		list-style: none;
        text-align: center;
        font-size: 15px;
        width: 100%;
        padding: 20px 0;
        transition-duration: 0.5s;
	}
	
	ul > li:hover > ol > li {
		padding: 10px;
	}
	
	div.category{
		margin-left: 120px;
		width: 100%;
	}
	
	div.category > ul{
		display: flex;
		list-style: none;
	}
	
	div.category > ul > li{
		margin: 0 10px;
		padding : 15px 55px;
		border : 1px solid grey;
	}

	div.category > ul > li:hover{
		background-color: #444444;
		color: white;
	}

</style>
</head>
<body>

<div class="top">
	<div class="header">
		<div class="logo">
			<a href="${cpath }"><img src="${cpath }/image/logo.png"></a>
		</div>
		<div class="menu">
			<ul>
				<li><a>장충동왕족발</a>
					<ol>
						<li>브랜드스토리</li>
						<li>CEO인사말</li>
						<li>연혁</li>
						<li>오시는길</li>
					</ol>
				</li>
				<li><a>메뉴소개</a>
					<ol>
						<li><a href="${cpath }/list.jsp">메뉴보기</a></li>
						<li>신메뉴</li>
						<li>레시피소개</li>
					</ol>
				</li>
				<li><a>매장찾기</a>
					<ol>
						<li>매장찾기</li>
					</ol>
				</li>
				<li><a>창업정보</a>
					<ol>
						<li>창업정보</li>
						<li>가맹안내</li>
						<li>창업Q&A</li>
						<li>온라인창업상담</li>
						<li>창업후기</li>
					</ol>
				</li>
				<li><a>홍보센터</a>
					<ol>
						<li>최신뉴스</li>
						<li>방송영싱</li>
						<li>사회공헌</li>
						<li>생생리뷰</li>
					</ol>
				</li>
				<li><a>이벤트</a>
					<ol>
						<li>이벤트</li>
						<li>당첨자발표</li>
					</ol>
				</li>
				<li><a>고객지원센터</a>
					<ol>
						<li>공지사항</li>
						<li>고객의소리</li>
					</ol>
				</li>
			</ul>
		</div>
		<div class="button">
			<a href="">🌝</a>
			<a href="">🔍</a>
			<input type="search" name="name" placeholder="검색">
		</div>
	</div>
	<div class="banner">
		<h1>메뉴 보기</h1>
		<p>전국 어디서나 1588-3300으로 연결되는 (주)장충동왕족발을 찾아주셔서 감사합니다.</p>
		<br>
		<span>💒</span>
		<span>></span>
		<span><b>메뉴소개</b></span>
		<span>></span>
		<span><b>메뉴보기</b></span>
	</div>
</div>

<div class="category">
	<ul>
		<li><a href="${cpath }/list.jsp">ALL</a></li>
		<li><a href="${cpath }/list.jsp?category=족발">족발</a></li>
		<li><a href="${cpath }/list.jsp?category=보쌈">보쌈</a></li>
		<li style="margin-left: 550px;"><a href="${cpath }/add-form.jsp">추가</a></li>
	</ul>
</div>


