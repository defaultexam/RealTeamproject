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
	var login = '${login}';
	var loginno = '${login.member_no}';
	var loginname = '${login.name}';
	var loginphone = '${login.phone}';
	var loginemail = '${login.email}';
	var alerts = 0;
	var _dep1 = $("body").attr("data-dep1", "2");
	var _dep2 = $("body").attr("data-dep2", "-1");
	$(document).ready(function() {
		toggleSpinners(1);
		if ((menuList == null || menuList == '') && login != null) {
			$("#getMenu").attr({
				"method" : "post",
				"action" : "/reservation/menus"
			});
			$("#getMenu").submit();
		} else {
			if (menuList == null || menuList == '') {
				$("#getMenu").attr({
					"method" : "post",
					"action" : "/reservation/menu"
				});
				$("#getMenu").submit();
			}
		}
		$("#memberno").val(loginno);
		var dt;
		dt = new Date();
		dt = dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + (dt.getDate() + 1);
		// 오늘 날짜 기준으로 DatePicker 업데이트 및 갱신
		$.ajax({
			url : "/reservation/date",
			type : "post",
			data : {
				"seat_date" : dt
			},
			error : function() {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
			},
			success : function(resultdata) {
				if (resultdata != null) {
					seats = resultdata;
					seat_no = resultdata[0].seat_no;
					$("#extra1").html(resultdata[0].seat_extra);
					$("#extra2").html(resultdata[1].seat_extra);
					$("#extra3").html(resultdata[2].seat_extra);
					$("#extra4").html(resultdata[3].seat_extra);
				}
			}
		});
	});
	$(document).click(function() {
		if ((login == '' || login == null) && alerts <= 1) {
			var guestConfirm = confirm("로그인 후 이용하실 수 있습니다. \n확인을 누르시면 로그인 화면으로 이동합니다.");
			if (guestConfirm) {
				window.location.href = "/login";
			} else {
			}
			alerts++;
			return;
		}
	});

	$(function() {
		$("#inputid").bind("change", function() {
			if (document.getElementById("inputid").checked == true) {
				var phonesplit = loginphone.split("-");
				var emailsplit = loginemail.split("@");
				$("#book_name").val(loginname);
				$("#phone1").val(phonesplit[0]);
				$("#phone2").val(phonesplit[1]);
				$("#phone3").val(phonesplit[2]);
				$("#email1").val(emailsplit[0]);
				$("#email2").val(emailsplit[1]);
			}
		});

	});
</script>
<body>

	<div class="container-fluid">
		<form method="post" id="getMenu">
			<input type="hidden" id="transfer_menu_id">
		</form>
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center" id="headerh1">
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
							<td id="extra1">0</td>
							<td class="form-inline"><input type="number" min="1"
								max="30" class="form-control"
								style="width: 100px; height: 25px;" id="numberic1"><span
								class="validity"></span></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="2" /> 17:30
								~ 19:20</td>
							<td id="extra2">0</td>
							<td class="form-inline"><input type="number" min="1"
								max="40" class="form-control"
								style="width: 100px; height: 25px;" id="numberic2"><span
								class="validity"></span></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="3" /> 20:00
								~ 22:00</td>
							<td id="extra3">0</td>
							<td class="form-inline"><input type="number" min="1"
								max="50" class="form-control"
								style="width: 100px; height: 25px;" id="numberic3"><span
								class="validity"></span></td>
						</tr>
						<tr class="active">
							<td><input type="radio" name="timetable" value="4" /> 21:15
								~ 23:15</td>
							<td id="extra4">0</td>
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
			<img src="/resources/include/css/images/reserv2.jpg" class="imgs"
				id="imgset"> <br /> <br />
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
														<p class="text-left"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">정상가 <script>
																var originalPrice = '${menu.menu_price + (menu.menu_price/10)}';
																var writePrice = originalPrice.split(".0");
																document.write(writePrice[0]);
															</script> 원
															</font><br /> <strong><font size="3">회원가
																	${menu.menu_price } 원</font></strong>
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
														<p class="text-left"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">정상가 <script>
																var originalPrice = '${menu.menu_price + (menu.menu_price/10)}';
																var writePrice = originalPrice.split(".0");
																document.write(writePrice[0]);
															</script> 원
															</font><br /> <strong><font size="3">회원가
																	${menu.menu_price } 원</font></strong>
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
														<p class="text-left"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">정상가 <script>
																var originalPrice = '${menu.menu_price + (menu.menu_price/10)}';
																var writePrice = originalPrice.split(".0");
																document.write(writePrice[0]);
															</script> 원
															</font><br /> <strong><font size="3">회원가
																	${menu.menu_price } 원</font></strong>
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
										<c:if test="${menu.menu_kind == 'beer'}">
											<div class="col-sm-6 col-md-4">
												<div class="thumbnail">
													<img
														src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
														data-num="${menu.menu_no }" alt="...">
													<div class="caption" style="height: 250px;">
														<h3 class="text-center">${menu.menu_name }</h3>
														<p>${menu.menu_text }</p>
														<p class="text-left"
															style="position: absolute; bottom: 30px;">
															<font size="3.5">정상가 <script>
																var originalPrice = '${menu.menu_price + (menu.menu_price/10)}';
																var writePrice = originalPrice.split(".0");
																document.write(writePrice[0]);
															</script> 원
															</font><br /> <strong><font size="3">회원가
																	${menu.menu_price } 원</font></strong>
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
		<br /> <br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv4.jpg" class="imgs">
			<br /> <br />
			<div class="col-md-12">
				<table class="table table-bordered table-hover">
					<c:choose>
						<c:when test="${not empty memberCouponInfo}">
							<c:forEach var="couponList" items="${memberCouponInfo}"
								varStatus="status">
								<c:if test="${couponList.coupon_status == '사용가능쿠폰'}">
									<tr data-num="${couponList.couponhistory_no}"
										id="coupon${couponList.couponhistory_no}" class="selectCoupon">
										<td><label>쿠폰명</label></td>
										<td>${couponList.coupon_name}</td>
										<td><label>할인율</label></td>
										<td id=${couponList.couponhistory_no }>${couponList.coupon_discountrate * 100}%</td>
										<td><label>유효기간</label></td>
										<td>${couponList.coupon_start}부터~${couponList.coupon_end}까지</td>
										<td style="width: 50px;" align="center"><span role="no"
											id="span${couponList.couponhistory_no }"></span></td>
									</tr>
									<script type="text/javascript">
									var rate = '${couponList.coupon_discountrate * 100}';
									var result = rate.split(".0");
									$("#"+${couponList.couponhistory_no }).html(result[0] + "%");
								</script>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:if test="${login.id == null}">
								<tr>
									<td colspan="4" align="center">로그인 후 쿠폰을 사용하실 수 있습니다.</td>
								</tr>
							</c:if>
							<c:if test="${login.id != null and login.id != ''}">
								<tr>
									<td colspan="4" align="center">사용가능한 쿠폰이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</c:otherwise>
					</c:choose>

				</table>
			</div>
		</div>
		<br /> <br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv5.jpg" class="imgs">
			<br />
			<div align="right">
				<input type="checkbox" id="inputid" value="">회원 정보와 같습니다.
			</div>
			<div class="col-md-12">
				<table
					class="table table-hover table-striped table-bordered table-user">
					<tbody>
						<tr class="active">
							<td>ㆍ예약자 성명</td>
							<td><input type="text" class="form-control" id="book_name"
								name="book_name"></td>
							<td style="padding-left: 2%; padding-right: 2%;">ㆍ연락처</td>
							<td class="form-inline"><input type="text"
								class="form-control telephone" id="phone1" style="width: 120px">-<input
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
							<td colspan="3" class="memosize"><input type="text"
								id="book_memo" name="book_memo" class="form-control memosize"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<br /> <br />
		<div class="row borderstyle">
			<img src="/resources/include/css/images/reserv6.jpg" class="imgs">
			<br /> <br />
			<div class="col-md-12">
				<table
					class="table table-hover table-striped table-bordered table-user">
					<tbody>
						<tr class="active">
							<td align="center" style="padding-top: 25px; width: 40%;"><input
								type="radio" name="payway" value="신용카드" checked="checked" />
								신용카드 &nbsp;<input type="radio" name="payway" value="계좌이체" />
								실시간 계좌이체&nbsp;</td>
							<td style="width: 59%;">
								<table style="width: 100%;">
									<tr>
										<td style="padding-left: 10px;"><strong>주문금액</strong></td>
										<td align="right" style="padding-right: 7%;"><font
											size="4px"><span id="payment_ordered">0</span></font>원</td>
									</tr>
									<tr>
										<td style="padding-left: 10px;"><strong>할인금액</strong></td>
										<td align="right" style="padding-right: 7%;"><font
											size="4px"><span id="payment_discount">0</span></font>원</td>
									</tr>
									<tr>
										<td style="padding-left: 10px;">총 결제금액</td>
										<td align="right" style="padding-right: 7%;"><font
											size="4px"><span id="payment_whole">0</span></font>원(VAT포함)</td>
									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<ul>
					<li><font size="2.5px"><strong>온라인 주문시 기본적으로
								10% 할인된 회원값이 적용됩니다.</strong></font></li>
					<li><font size="2.5px"><strong>쿠폰은 중복 사용이
								불가능하며, 최대 1개까지 사용하실 수 있습니다.</strong></font></li>
					<li><font size="2.5px"><strong>이용약관 제 16조에 의거
								이용일 당일 취소 및 환불 불가합니다.</strong></font></li>
					<li><font size="2px">이용방법 : 예약한 시간에 맞춰 레스토랑에 방문해 주세요.</font></li>
				</ul>
			</div>
		</div>
		<br /> <input type="hidden" id="email" name="email"> <input
			type="hidden" id="phone" name="phone"> <input type="hidden"
			id="couponhistory_no" value="9999"> <input type="hidden"
			id="memberno" name="memberno">
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
	<script type="text/javascript">
		var _dep1 = $("body").attr("data-dep1");
		var _dep2 = $("body").attr("data-dep2");
		$('.gnb').imGNBactive("on", gnbActiave).setBtn([ _dep1, _dep2 ]);
		function gnbActiave($index1, $index2) {
			if ($("body #wrap").hasClass("main")) {
				return;
			}
			;
			// 메인이면 실행 안함; 
			return true;
		}
		// 2뎁 보기 버튼
		$("#header a.btn-dep1").on("click", function($e) {
			$e.preventDefault();
			$("#header").removeClass("fixeds");
			gnbMotion(false);
		})
	</script>
</body>