<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
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

	function drawChart() {
		

		/* 회원 성별 파이차트 */
		var manData = ${memberCnt.manCnt};
		var womanData = ${memberCnt.womanCnt};
		var now = new Date();
		var nowDate = now.getFullYear()+"-"+addzero((now.getMonth()+1))+"-"+addzero(now.getDate()) + " " +addzero(now.getHours());
		var data = google.visualization.arrayToDataTable([ [ '회원구분', '인원수' ],
				[ '남성회원', manData ], [ '여성회원', womanData ] ]);
		var options = {
			title : '회원 남/녀 성별 비율 (' + nowDate+'시) 기준'
		};
		var chart = new google.visualization.PieChart(document
				.getElementById('genderChart'));
		chart.draw(data, options);
	}

	function drowRankChart() {
		/* 회원 등급별 파이차트 */
		var normalData = ${rankCnt.normalCnt};
		var VIPData = ${rankCnt.VIPCnt};
		var totalData = ${rankCnt.totalCnt}; 
		var now = new Date();
		var nowDate = now.getFullYear()+"-"+addzero((now.getMonth()+1))+"-"+addzero(now.getDate()) + " " +addzero(now.getHours());
		var normalRate = normalData / totalData * 100;
		var VIPDataRate = VIPData / totalData * 100;

		var data = google.visualization.arrayToDataTable([ [ '등급구분', '인원수', {
			role : "style"
		}, {
			role : 'annotation'
		} ], [ '일반회원', normalData, "silver", normalRate ],
				[ 'VIP회원', VIPData, "gold", VIPDataRate ] ]);
		var options = {
			title : '회원 등급 비율 (' + nowDate+'시) 기준',
			legend : {
				position : "none"
			},
			hAxis:{
				format : 'percent'
			}
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById('rankChart'));
		chart.draw(data, options);
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#genderChart{
float: left;}
#rankChart{
float: left;}
#clear{
clear: both;}
#chartDiv{
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
	<div align="center">
		<button id="pdfBtn">PDF출력하기</button>
	</div>

	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>