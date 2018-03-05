<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<link rel="stylesheet" href="/resources/include/css/jquery-ui.min.css">
<script type="text/javascript"
	src="/resources/include/js/jquery-ui.min.js"></script>
<style>
body {
	height: 1200px;
}

.sizedown {
	width: 50px;
	height: 15px;
}

.ui-datepicker {
	font-size: 12px;
	width: 550px;
	height: 200px;
}

.ui-datepicker table {
	height: 85%;
}

.table-detail1 td {
	padding-top: 5px;
	padding-bottom: 15px;
	padding-left: 15px;
	padding-top: 15px;
}

.table-detail2 td {
	width: 45%;
	padding: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-bottom: 15px;
}

.table-detail3 td {
	width: auto;
	padding: 15px;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-bottom: 15px;
}

.telephone {
	width: 100px;
}

.memosize {
	height: 150px;
}

.email {
	width: 400px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">
					<strong>RESERVATION</strong>
				</h1>
				<br />
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div id="datepicker" class="sizeup"></div>
			</div>
			<div class="col-md-6">
				<table class="table">
					<thead>
						<tr>
							<th>이용시간</th>
							<th>잔여 좌석수</th>
							<th>좌석수 선택</th>
						</tr>
					</thead>
					<tbody>
						<tr class="active">
							<td><input type="radio" name="timetable" value="1"
								checked="checked" /> 12:00 ~ 14:00</td>
							<td>30</td>
							<td><input id="spinner1" name="spinner1" class="sizedown"
								value="1"></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="2" /> 17:30
								~ 19:20</td>
							<td>40</td>
							<td><input id="spinner2" name="spinner2" class="sizedown"
								value="1"></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="3" /> 20:00
								~ 22:00</td>
							<td>50</td>
							<td><input id="spinner3" name="spinner3" class="sizedown"
								value="1"></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="4" /> 21:15
								~ 23:15</td>
							<td>20</td>
							<td><input id="spinner4" name="spinner4" class="sizedown"
								value="1"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br /> <br />
		<div class="row">
			<div class="col-md-12">
				<div id="accordion">
					<h3>스테이크</h3>
					<div>
						<p>아앙 기모띠이</p>
					</div>
					<h3>파스타</h3>
					<div>
						<p>호옹 기모띠이</p>
					</div>
					<h3>샐러드</h3>
					<div>
						<p>히잉 기모띠이</p>
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="row">
			<div class="col-md-12 form-group container-fluid">
				<table class="table table-bordered table-hover">
					<tr class="table-detail1">
						<td><span class="glyphicon glyphicon-calendar"
							aria-hidden="true"></span>예약일 <a id="reservationdate">2018년
								03월 01일</a></td>
						<td><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
							이용시간 <a id="reservationtime">12:00 ~ 14:00</a></td>
						<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							좌석수 <a id="reservationpeople">1</a>석</td>
					</tr>
					<tr class="table-detail2">
						<td>ㆍ등심 스테이크</td>
						<td>|
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |</td>
						<td>125,000원</td>
					</tr>
					<tr class="table-detail3">
						<td colspan="3" align="right">주문 금액 | <font size="4px"><strong>125,000원</strong></font>
							(1인 / VAT포함)
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br /> <br />
		<div class="row">
			<div class="col-md-12">
				<table
					class="table table-hover table-striped table-bordered table-user">
					<tbody>
						<tr class="active">
							<td>ㆍ이름</td>
							<td><input type="text" class="form-control"></td>
							<td>ㆍ연락처</td>
							<td class="form-inline"><input type="text"
								class="form-control telephone">-<input type="text"
								class="form-control telephone">-<input type="text"
								class="form-control telephone"></td>
						</tr>
						<tr class="active">
							<td>ㆍ이메일</td>
							<td class="form-inline" colspan="3"><input type="text"
								id="one" class="form-control"> @ <input type="text"
								id="two" onchange="hey()" class="form-control"></td>
						</tr>
						<tr class="active">
							<td>ㆍ남기실 말씀</td>
							<td colspan="3" class="memosize"><input type="text"
								class="form-control memosize"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br /> <br />
	</div>
	<script type="text/javascript">
		var time = "12:00 ~ 14:00";
		var selectOption = 1;
		var spinner1 = $("#spinner1").spinner();
		var spinner2 = $("#spinner2").spinner();
		var spinner3 = $("#spinner3").spinner();
		var spinner4 = $("#spinner4").spinner();
	
		function hey() {
			var original;
			var newt;
			original = $("#one").val();
			newt = original - (original / 10 / 2);
			$("#two").val(newt);
		}
	
		$(function() {
			$('input:radio[name="timetable"]').change(function() {
				if ($(this).val() == '1') {
					selectOption = 1;
					time = "12:00 ~ 14:00";
				} else if ($(this).val() == '2') {
					selectOption = 2;
					time = "17:30 ~ 19:20"
				} else if ($(this).val() == '3') {
					selectOption = 3;
					time = "20:00 ~ 22:00";
				} else if ($(this).val() == '4') {
					selectOption = 4;
					time = "21:15 ~ 23:15";
				}
				toggleSpinners(selectOption);
				$("#reservationtime").html(time);
			});
		});
	
		$("#datepicker").datepicker({
			minDate : "-d",
			maxDate : "+14d",
			dateFormat : 'yy-mm-dd',
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			defaultDate : "+1d",
			prevText : "이전달",
			nextText : "다음달",
			dateFormat : "yy년 mm월 dd일",
			onSelect : function(dateText, inst) {
				/* alert(dateText); */
				$("#reservationdate").html(dateText);
			}
		});
		$("#accordion").accordion();
		$("#spinner1").spinner({
			min : "1",
			max : "30",
			change : function(event, ui) {
				$("#reservationpeople").html($("#spinner1").val());
			}
		});
		$("#spinner2").spinner({
			min : "1",
			max : "30",
			change : function(event, ui) {
				$("#reservationpeople").html($("#spinner2").val());
			}
		});
		$("#spinner3").spinner({
			min : "1",
			max : "30",
			change : function(event, ui) {
				$("#reservationpeople").html($("#spinner3").val());
			}
		});
		$("#spinner4").spinner({
			min : "1",
			max : "30",
			change : function(event, ui) {
				$("#reservationpeople").html($("#spinner4").val());
			}
		});
	
		function toggleSpinners(options) {
			switch (options) {
			case 1:
				spinner1.spinner("enable");
				spinner2.spinner("disable");
				spinner3.spinner("disable");
				spinner4.spinner("disable");
				break;
			case 2:
				spinner2.spinner("enable");
				spinner1.spinner("disable");
				spinner3.spinner("disable");
				spinner4.spinner("disable");
				break;
			case 3:
				spinner3.spinner("enable");
				spinner2.spinner("disable");
				spinner1.spinner("disable");
				spinner4.spinner("disable");
				break;
			case 4:
				spinner4.spinner("enable");
				spinner2.spinner("disable");
				spinner3.spinner("disable");
				spinner1.spinner("disable");
				break;
			}
		}
	</script>
</body>