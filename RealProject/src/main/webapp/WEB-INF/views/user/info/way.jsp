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
		zoom : 17
	});
</script>
<style type="text/css">
#map {
	height: 400px;
	width: 60%;
}

.way, .info, .font {
	font-size: 20px;
}

.way {
	font-weight: 900;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div align="center">
		<a href="/info/info" class="info"><span class="info">소개</span></a>&nbsp;&nbsp;<span class="font">l</span>&nbsp;&nbsp;<a
			href="/info/way" class="way"><span class="way">오시는 길</span></a>
	</div>
	<br>
	<br>
	<div align="center">
		<div id="map"></div>
		<br> <br>
		<p>주 소 : 서울시 성동구 무학로2길 54 신방빌딩</p>
		<p>전화번호 : 02-441-6006</p>
		<br>
		<hr>
		<h5 style="padding-right: 50%">
			<b>ㆍ대중교통 이용시</b>
		</h5>
		<br> <img src="/resources/infoImage/busInfo.png"> <br>
		<br>
	</div>
	<!-- 구글키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpEGHuotynn0JCGBoiMnQHAElN4nfvsH8&callback=initMap">
    </script>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>