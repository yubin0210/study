<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp</title>
<style>
	body{
		margin: 0;
		padding: 0;
	}
	
	a{
		color: inherit;
		text-decoration: none;
	}
	
	a:hover {
		curser: pointer;
	}
	
	div.footer{
		width: 100%;
		height: 216px;
		background-color: #111111;
		color: #eeeeee;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-flow: column;
		font-size: 15px;
	}
	
	div.info{
		display: flex;
		margin-top: 10px;
	}

</style>
</head>
<body>

<div class="footer">
	<div>
		<span>개인정보처리방침</span>
		<span>이용약관</span>
	</div>
	<div class="info">
		<p>(주)장충동왕족발</p>
		<p>대표: 신신자</p>
		<p>대전 유성구 노은서로 75 (노은동) 청원공장 : 충청북도 청주시 서원구 현도면 선동2길 232-28</p>
		<p>고객센터: 1588-3300</p>
		<p>사업자등록번호: 314-81-39043</p>
	</div>
	<div>
		Copyright (주)장충동왕족발. All rights reserved.
	</div>
</div>

</body>
</html>