<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<style type="text/css">
p {
	font-weight: 700;
	font-family: "Courier New";
}

#map {
	height: 400px;
	width: 60%;
}
</style>
</head>
<script type="text/javascript">
	$("body").attr("data-dep1", 0);
	$("body").attr("data-dep2", 1);
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
<body>
	<div style="width: 1250px;">
		<div class="row">
			<div id="map" style="width: 550px; float: left; top: 90px;"></div>
			<img src="/resources/infoImage/busInfo.png" style="float: right;">
			<div style="float: left; padding-top: 100px; padding-left: 15px;">
				<p>주 소 : 서울시 성동구 무학로2길 54 신방빌딩 ㆍContact: 02-441-6006</p>
			</div>
		</div>
	</div>
	<!-- 구글키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpEGHuotynn0JCGBoiMnQHAElN4nfvsH8&callback=initMap">
    </script>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>