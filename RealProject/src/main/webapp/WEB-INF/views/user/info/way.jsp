<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function initMap() {
		var uluru = {
			lat : 37.562198,
			lng : 127.035133
		};
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 17,
			center : uluru
		});
		var marker = new google.maps.Marker({
			position : uluru,
			map : map
		});
	}
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 20
	});
</script>
<style type="text/css">
p {
	font-weight: 700;
	font-family: "Courier New";
}

#map {
	height: 400px;
	width: 60%;
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
	<br>
	<br>
	<div style="width: 1250px;">
		<div id="map" style="width: 550px; float: left;"></div>
		<img src="/resources/infoImage/busInfo.png" style="float: right;">
		<div style="float: left; padding-top: 5px;">
			<p>주 소 : 서울시 성동구 무학로2길 54 신방빌딩 ㆍContact: 02-441-6006</p>
		</div>
	</div>
	<!-- 구글키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpEGHuotynn0JCGBoiMnQHAElN4nfvsH8&callback=initMap">
    </script>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>