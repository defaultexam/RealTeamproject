<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- js pdf화관련 js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	/* n이 한자리 수가되면 앞에 0을 추가하는 함수 */
	function addzero(n) {
		return n < 10 ? "0" + n : n;
	}

	$(function() {
		$("#chartSearch").click(function() {
			drawChart();
		});
		$("#chartSearchTotal").click(function() {
			$("#chartStartDate").val("");
			$("#chartEndDate").val("");
			drawChart();
		});
		
		/* 차트 이미지 PDF화 함수 */
			$('#pdfBtn').click(
					function() {
						var doc = new jsPDF('p', 'pt', 'a4', false); // 새로운 문서 생성
						doc.setFontSize(15); //문서의 폰트사이즈
						var yAxis = 70;
						var imageTags = $("#graph-images img");
						for (var i = 0; i < imageTags.length; i++) {
							var someText = 'ReservationChart' + (i + 1);
							doc.text(240, yAxis, someText);
							yAxis = yAxis + 20;
							doc.addImage(imageTags[i], 'png', 10, yAxis, 600, 300,
									undefined, 'none');
							yAxis = yAxis + 320;
						}
						doc.save('reservationChart.pdf');
					});
	});

	/* 조회 기간별 예약통계 작성 메소드 */
	function drawChart() {
		var searchStartDate = $("#chartStartDate").val();
		var searchEndDate = $("#chartEndDate").val();
		if (searchStartDate.length == 0) {
			$("#chartStartDate").val('9999-12-31');
			$("#chartEndDate").val('9999-12-31');
		}
		/* 기간별 예약률 꺾은선차트 */
		$
				.ajax({
					url : "/adminChart/reservation",
					type : "post",
					dataType : "json",
					data : {
						"chartStartDate" : $("#chartStartDate").val(),
						"chartEndDate" : $("#chartEndDate").val()
					},
					error : function() {
						alert("사이트접속문제로 정상작동하지 못하였습니다.");
					},
					success : function(result) {
						var list = result;
						var now = new Date();
						var nowDate = now.getFullYear() + "-"
								+ addzero((now.getMonth() + 1)) + "-"
								+ addzero(now.getDate()) + " " +addzero(now.getHours());
						var dataArray = [ [ '날짜', '1타임확률', '2타임확률', '3타임확률',
								'4타임확률' ] ];
						var chartList = list;
						for (var i = 0; i < list.length; i++) {
							var plusArray = [];
							plusArray.push(list[i].seat_date.substring(0, 10),
									(30-list[i].firstSeat)/30, (40-list[i].secondSeat)/40,
									(50-list[i].thirdSeat)/50, (20-list[i].fourthSeat)/20);
							dataArray.push(plusArray);
						}
						var data = google.visualization
								.arrayToDataTable(dataArray);
						var options = {
							title : '기간별 예약률 현황 (' + nowDate + '시) 기준',
							legend : {
								position : 'bottom'
							},
							vAxis:{
								minValue : 0,
								maxValue : 1,
								format:'percent'
							},
							pointSize : 10
						};
						var chart = new google.visualization.LineChart(document
								.getElementById('reservationChart'));
						chart.draw(data, options);
						var content = '<img src="' + chart.getImageURI() + '" style="transform: rotate(90deg);">';
						$('#graph-images').append(content);
						if ($("#chartStartDate").val() === '9999-12-31') {
							$("#chartStartDate").val("");
							$("#chartEndDate").val("");
						}
					}
				});
	}
</script>
</head>
<body>
	<div>
		<label>조회 기간 설정 : </label> <input type="date" id="chartStartDate">
		~ <input type="date" id="chartEndDate"> <input type="button"
			id="chartSearch" value="조회하기" class="btn btn-default"> <input
			type="button" id="chartSearchTotal" value="전체보기"
			class="btn btn-default">
	</div>

	<div align="center" id="chartDiv">
		<div id="reservationChart" style="width: 2000px; height: 500px;"></div>
	</div>
	<div id="graph-images" hidden=""></div>
	<div align="center">
		<button id="pdfBtn" class="btn btn-default">PDF출력하기</button>
	</div>
	<img alt="" src="" style="transform: rotate(90deg);">

	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>