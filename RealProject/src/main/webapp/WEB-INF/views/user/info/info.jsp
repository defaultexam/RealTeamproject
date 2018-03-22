<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">


<style>
#wrap {
	width: 1200px auto;
	padding-top: 70px;
}

#mainImg {
	padding-top: 20px;
	width: 400px;
	height: 400px;
	float: left;
	display: block;
	padding-right: 50px;
}

#menunav .gnb a span {
	display: inline-block;
	height: 33px;
	color: #a8a9ad;
	font-size: 14px;
	letter-spacing: 1.5px;
	font-family: 'Open Sans', "Spoqa Han Sans", 'sans-serif', 'Arial';
	font-weight: 500;
	vertical-align: top;
}

#menunav .gnb a span:hover {
	zoom: 1.05;
	border-bottom-color: black;
	border-bottom: 1px solid #231f20;
}

.info {
	font-weight: 900;
	text-decoration: underline;
}

#introduce {
	padding-top: 100px;
	width: 100%;
	height: 450px;
}

h2 {
	font-family: Raleway, Georgia, serif;
}

p {
	font-family: "Courier New";
}
</style>
</head>
<body>
	<!-- Info 관련 네비게이션 -->
	<div id="menunav" align="center">
		<nav class="gnb">
			<a href="/info/info"><span>소개</span></a> &nbsp;&nbsp;<span>|</span>
			&nbsp;&nbsp;<a href="/info/way"><span>오시는 길</span></a>
		</nav>
	</div>
	<div id="wrap">
		<!-- 레스토랑 이미지 -->
		<div id="mainImg">
			<img src="/resources/images/logo.png" width="400" height="400"
				id="image">
		</div>
		<!-- 레스토랑 인사말 -->
		<div id="introduce">
			<h2>식사는 오페라나 영화처럼 예술이자 경험이어야 합니다.</h2>
			<br>
			<p>단순히 배를 채우는 것이 아닌 더 나아가 자신의 영혼을 만족시켜줘야 합니다.</p>
			<p>그동안 잠들어 있던 여러분들의 시각, 후각, 촉각을 최대한 살려 특별한 식사를 할 수 있는 곳입니다.</p>
			<p>그리고 그 신비로움을 연인, 가족, 친구, 동료들과 함께 만끽할 수 있는 곳이기도 합니다.</p>
			<p>이제까지 접해보지 못한 멋진 경험을 하게 되실 겁니다.</p>
			<p>최고의 셰프가 최고의 재료로 만든 최고의 음식을 느껴보세요!</p>
		</div>
	</div>
</body>
</html>