<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 차트 생성관련 js -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- 최신버전 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- jqeury ui 관련 js -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 부트스트랩 js -->
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<!-- jquery form 관련 js -->
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<!-- js pdf화관련 js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drowRankChart);

	/* n이 한자리 수가되면 앞에 0을 추가하는 함수 */
	function addzero(n) {
		return n < 10 ? "0" + n : n;
	}

	/* 회원 성별 파이차트 */
	function drawChart() {
		var manData = ${memberCnt.manCnt};
		var womanData = ${memberCnt.womanCnt};
		var now = new Date();
		var nowDate = now.getFullYear() + "-" + addzero((now.getMonth() + 1))
				+ "-" + addzero(now.getDate()) + " " + addzero(now.getHours());
		var data = google.visualization.arrayToDataTable([ [ '회원구분', '인원수' ],
				[ '남성회원', manData ], [ '여성회원', womanData ] ]);
		var options = {
			title : '회원 남/녀 성별 비율 (' + nowDate + '시) 기준',
			chartArea : {
				bottom : 24,
				left : 36,
				right : 12,
				top : 90,
				width : '100%',
				height : '100%'
			},
			height : 550,
			width : 550
		};
		var chart = new google.visualization.PieChart(document
				.getElementById('genderChart'));
		chart.draw(data, options);

		var content = '<img src="' + chart.getImageURI() + '">';
		$('#graph-images').append(content);
	}
	/* 회원 등급별 파이차트 */
	function drowRankChart() {
		var normalData = ${rankCnt.normalCnt};
		var VIPData = ${rankCnt.VIPCnt};
		var totalData = ${rankCnt.totalCnt};
		var now = new Date();
		var nowDate = now.getFullYear() + "-" + addzero((now.getMonth() + 1))
				+ "-" + addzero(now.getDate()) + " " + addzero(now.getHours());
		var normalRate = (normalData / totalData * 100).toFixed(1);
		var VIPDataRate = (VIPData / totalData * 100).toFixed(1);
		var normalRateString = String(normalRate)+'%';
		var VIPDataRateString = String(VIPDataRate)+'%';

		var data = google.visualization.arrayToDataTable([ [ '등급구분', '인원수', {
			role : "style"
		}, {
			role : 'annotation'
		} ], [ '일반회원', normalData, "green", normalRateString ],
				[ 'VIP회원', VIPData, "purple", VIPDataRateString ] ]);
		var options = {
			title : '회원 등급 비율 (' + nowDate + '시) 기준',
			legend : {
				position : "none"
			},
			hAxis : {
				format : 'percent'
			},
			chartArea : {
				bottom : 24,
				left : 36,
				right : 12,
				top : 48,
				width : '100%',
				height : '100%'
			},
			height : 500,
			width : 450
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById('rankChart'));
		chart.draw(data, options);

		var content = '<img src="' + chart.getImageURI() + '">';
		$('#graph-images').append(content);

	}
	/* 차트 이미지 PDF화 함수 */
	$(function() {
		$('#pdfBtn').click(
				function() {
					var doc = new jsPDF('p', 'pt', 'a4', false); // 새로운 문서 생성
					doc.setFontSize(15); //문서의 폰트사이즈
					var yAxis = 70;
					var imageTags = $("#graph-images img");
					console.log(imageTags);
					for (var i = 0; i < imageTags.length; i++) {
						var someText = 'MemberChart' + (i + 1);
						doc.text(60, yAxis, someText);
						yAxis = yAxis + 20;
						doc.addImage(imageTags[i], 'png', 40, yAxis, 300, 300,
								undefined, 'none');
						yAxis = yAxis + 320;
					}
					doc.save('memberChart.pdf');
				});
	});
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#genderChart {
	float: left;
}

#rankChart {
	float: left;
}

#clear {
	clear: both;
}

#chartDiv {
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
	margin-left: 8%;
}
</style>
</head>
<body>
	<div align="center" id="chartDiv">
		<div id="genderChart" style="width: 900px; height: 500px;"></div>
		<div id="rankChart" style="width: 600px; height: 500px;"></div>
		<div id="clear"></div>
	</div>
	<div id="graph-images" hidden=""></div>
	<div align="center">
		<button id="pdfBtn">PDF출력하기</button>
	</div>
</body>
</html>