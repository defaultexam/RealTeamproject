<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<style>
.wrap {
	width: 1400px;
	padding-top: 100px;
}

#mainImg {
	float: left;
}

#introduce {
	float: left;
	padding-top: 50px;
	padding-left: 80px;
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
	<div class="container wrap">
		<!-- 레스토랑 이미지 -->
		<div id="mainImg">
			<img src="/resources/images/logo.png" width="300" height="300"
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

		<div style="clear: both;"></div>
		<br>
		<hr>
		<br>
		<div align="center">
			<p>총 좌석수 : 90석 / 4인용테이블 15석, 6인용 테이블 5석</p>
			<p>주소 : 서울특별시 성동구 무학로 2길 54(신방빌딩) 4,5층</p>
			<p>예약상담문의 : 02) 441 - 6006</p>
			<p>영업시간 : 월 ~ 일 (연중무휴) 11:00 ~ 24:00 </p>
		</div>
	</div>
	<script type="text/javascript">
		$("body").attr("data-dep1", 0);
		$("body").attr("data-dep2", 0);
	</script>
</body>