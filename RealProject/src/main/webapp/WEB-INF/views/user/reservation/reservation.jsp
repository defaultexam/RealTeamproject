<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<link rel="stylesheet" href="/resources/include/css/jquery-ui.min.css">
<script type="text/javascript"
	src="/resources/include/js/jquery-ui.min.js"></script>
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">
<style>
body {
	height: 900px;
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

.footer {
	position: relative;
}
</style>
<script type="text/javascript">
	var menuList = '${menulist}';
	var selectedMenu;
	$(document).ready(function() {
		toggleSpinners(1);
		if (menuList == null || menuList == '') {
			$("#getMenu").attr({
				"method" : "post",
				"action" : "/usermenu/menuSelect"
			});
			$("#getMenu").submit();
		}
	});
	function checkMenu(menu_no) {
		$.ajax({
			url : "/usermenu/checkMenu",
			type : "post",
			data : {
				"menu_no" : menu_no
			},
			error : function() {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
			},
			success : function(resultdata) {
				console.log("정보 받아오기 성공");
				alert("장바구니에 추가되었습니다 !")
				selectedMenu = resultdata;
				$("#afterhere").after("<tr id='name'>");
				$("#name").append("<td id='td1'>" + "ㆍ" + selectedMenu.menu_name + "</td>" + "<br>");
				$("#td1").after("<td id='td2'>" + selectedMenu.menu_price + " 원" + "</td>" + "<br>");
				$("#td2").after("<td>" + "1개" + "</td>" + "<br>");
				$(".table-detail3").before("</tr>");

			}
		});
	}
</script>

</head>
<body>
	<div class="container-fluid">
		<form method="get" id="getMenu">
			<input type="hidden" id="transfer_menu_id">
		</form>
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
					<div style="height: 900px">
						<div class="row">
							<c:choose>
								<c:when test="${not empty menulist}">
									<c:forEach var="menu" items="${menulist}" varStatus="status">
										<c:if test="${menu.menu_kind == 'steak'}">
											<div class="col-sm-6 col-md-4">
												<div class="thumbnail">
													<img
														src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
														data-num="${menu.menu_no }" alt="...">
													<div class="caption" style="height: 250px;">
														<h3 class="text-center">${menu.menu_name }</h3>
														<p>${menu.menu_text }</p>
														<p class="text-right"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">${menu.menu_price } 원</font>
														</p>
														<p style="padding-left: 59%">
															<input type="button" class="btn btn-primary"
																role="button" id="${menu.menu_no }"
																style="width: 130px; position: absolute; bottom: 30px;"
																value="선택" onclick="checkMenu(${menu.menu_no });">
														</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<div class="tohere"></div>
						</div>
					</div>
					<h3>파스타</h3>
					<div>
						<div class="row">
							<c:choose>
								<c:when test="${not empty menulist}">
									<c:forEach var="menu" items="${menulist}" varStatus="status">
										<c:if test="${menu.menu_kind == 'pasta'}">
											<div class="col-sm-6 col-md-4">
												<div class="thumbnail">
													<img
														src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
														data-num="${menu.menu_no }" alt="...">
													<div class="caption" style="height: 250px;">
														<h3 class="text-center">${menu.menu_name }</h3>
														<p>${menu.menu_text }</p>
														<p class="text-right"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">${menu.menu_price } 원</font>
														</p>
														<p style="padding-left: 59%">
															<input type="button" class="btn btn-primary"
																role="button" id="${menu.menu_no }"
																style="width: 130px; position: absolute; bottom: 30px;"
																value="선택" onclick="checkMenu(${menu.menu_no });">
														</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<h3>샐러드</h3>
					<div>
						<div class="row">
							<c:choose>
								<c:when test="${not empty menulist}">
									<c:forEach var="menu" items="${menulist}" varStatus="status">
										<c:if test="${menu.menu_kind == 'sallad'}">
											<div class="col-sm-6 col-md-4">
												<div class="thumbnail">
													<img
														src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
														data-num="${menu.menu_no }" alt="...">
													<div class="caption" style="height: 250px;">
														<h3 class="text-center">${menu.menu_name }</h3>
														<p>${menu.menu_text }</p>
														<p class="text-right"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">${menu.menu_price } 원</font>
														</p>
														<p style="padding-left: 59%">
															<input type="button" class="btn btn-primary"
																role="button" id="${menu.menu_no }"
																style="width: 130px; position: absolute; bottom: 30px;"
																value="선택" onclick="checkMenu(${menu.menu_no });">
														</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<h3>음료</h3>
					<div>
						<div class="row">
							<c:choose>
								<c:when test="${not empty menulist}">
									<c:forEach var="menu" items="${menulist}" varStatus="status">
										<c:if test="${menu.menu_kind == 'drink'}">
											<div class="col-sm-6 col-md-4">
												<div class="thumbnail">
													<img
														src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
														data-num="${menu.menu_no }" alt="...">
													<div class="caption" style="height: 250px;">
														<h3 class="text-center">${menu.menu_name }</h3>
														<p>${menu.menu_text }</p>
														<p class="text-right"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">${menu.menu_price } 원</font>
														</p>
														<p style="padding-left: 59%">
															<input type="button" class="btn btn-primary"
																role="button" id="${menu.menu_no }"
																style="width: 130px; position: absolute; bottom: 30px;"
																value="선택" onclick="checkMenu(${menu.menu_no });">
														</p>
													</div>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="row">
			<div class="col-md-12 form-group container-fluid">
				<table class="table table-bordered table-hover" id="selectMenuTable">
					<tr class="table-detail1">
						<td align="center"><span class="glyphicon glyphicon-calendar"
							aria-hidden="true"></span> 예약일 <a id="reservationdate">2018년
								03월 01일</a></td>
						<td align="center"><span class="glyphicon glyphicon-time"
							aria-hidden="true"></span> 이용시간 <a id="reservationtime">12:00
								~ 14:00</a></td>
						<td align="center"><span class="glyphicon glyphicon-user"
							aria-hidden="true"></span> 좌석수 <a id="reservationpeople">1</a>석</td>
					</tr>
					<tr id="afterhere">
						<td><strong>메뉴명</strong></td>
						<td><strong>가격</strong></td>
						<td><strong>갯수</strong></td>
					</tr>
					<tr class="table-detail3">
						<td colspan="3" align="right">주문 금액 | <font size="4px"><strong><span
									id="allprice">125,000</span>원</strong></font> (<span id="reservationpeople2">1</span>인
							/ VAT포함)
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br />
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
		<div class="row" align="center">
			<input type="button" value="예약하기" class="btn btn-default"
				style="width: 200px; height: 50px;" id="btn_reservation">
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
				$("#reservationdate").html(dateText);
			}
		});
		$("#accordion").accordion({
			collapsible : true,
			active : false
		});
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
				$("#reservationpeople2").html($("#spinner4").val());
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
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>