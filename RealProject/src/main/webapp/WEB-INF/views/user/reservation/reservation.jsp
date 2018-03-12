<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<link rel="stylesheet" href="/resources/include/css/jquery-ui.min.css">
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">
<link href="/resources/include/css/reservation.css" rel="stylesheet">
<!-- 03/09 - 달력 모양새 살짝 변형 , 메뉴 기능 추가 ^^ 이상훈 -->
<!-- 다음 번에는 ..... 음 .... 예약하기 .... 음 ..... 쿼리를 만들어야해 ..... 기억해야해 ...... -->
</head>
<script type="text/javascript">
	var menuList = '${menulist}';
	$(document).ready(function() {
		toggleSpinners(1);
		if (menuList == null || menuList == '') {
			$("#getMenu").attr({
				"method" : "post",
				"action" : "/reservation/menu"
			});
			$("#getMenu").submit();
		}
	});
</script>
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
			</div>
		</div>
		<br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv1.jpg" class="imgs">
			<br /> <br />
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
							<td class="form-inline"><input type="number" min="1"
								max="30" class="form-control"
								style="width: 100px; height: 25px;" id="numberic1"><span
								class="validity"></span></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="2" /> 17:30
								~ 19:20</td>
							<td>40</td>
							<td class="form-inline"><input type="number" min="1"
								max="40" class="form-control"
								style="width: 100px; height: 25px;" id="numberic2"><span
								class="validity"></span></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="3" /> 20:00
								~ 22:00</td>
							<td>50</td>
							<td class="form-inline"><input type="number" min="1"
								max="50" class="form-control"
								style="width: 100px; height: 25px;" id="numberic3"><span
								class="validity"></span></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="4" /> 21:15
								~ 23:15</td>
							<td>20</td>
							<td class="form-inline"><input type="number" min="1"
								max="20" class="form-control"
								style="width: 100px; height: 25px;" id="numberic4"><span
								class="validity"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br /> <br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv2.jpg" class="imgs" id="imgset">
			<br /> <br />
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
					<br />
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv3.jpg" class="imgs">
			<br /> <br />
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
									id="allprice">0</span>원</strong></font> (VAT포함)
						</td>
					</tr>
				</table>
			</div>
		</div>
		<br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv4.jpg" class="imgs">
			<br /> <br />
			<div class="col-md-12">
				<table
					class="table table-hover table-striped table-bordered table-user">
					<tbody>
						<tr class="active">
							<td>ㆍ예약자 성명</td>
							<td><input type="text" class="form-control"></td>
							<td style="padding-left: 2%; padding-right: 2%;">ㆍ연락처</td>
							<td class="form-inline"><input type="text"
								class="form-control telephone" id="phone1" style="width: 100px">-<input
								type="text" class="form-control telephone" id="phone2"
								style="width: 150px">-<input type="text"
								class="form-control telephone" id="phone3" style="width: 150px"></td>
						</tr>
						<tr class="active">
							<td>ㆍ이메일</td>
							<td class="form-inline" colspan="3"><input type="text"
								id="email1" class="form-control"> @ <input type="text"
								id="email2" class="form-control"></td>
						</tr>
						<tr class="active">
							<td>ㆍ남기실 말씀</td>
							<td colspan="3" class="memosize"><input type="text" id="memo"
								class="form-control memosize"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<input type="hidden" id="email"> <input type="hidden"
			id="phone">
		<div class="row" align="center">
			<input type="button" value="예약하기" class="btn btn-default"
				style="width: 200px; height: 50px;" id="btn_reservation">
		</div>
		<br /> <br />
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-ui.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/reservation.js"></script>
</body>