<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script type="text/javascript">
		$("#navsidebar").attr("data-side", 3);
	</script>
	<h3 align="center" style="font-weight: 700">예약 취소 내역</h3>
	<hr>
	<div class="container-fluid" style="width: 1400px">
		<div id="table-result" style="width: 1200px; float: left;">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="tac">예약 상태</th>
						<th class="tac">예약자 이름</th>
						<th class="tac">예약 날짜</th>
						<th class="tac">예약 시간</th>
						<th class="tac">인원수</th>
						<th class="tac">메뉴</th>
						<th class="tac">사용 쿠폰</th>
						<th class="tac">할인 금액</th>
						<th class="tac">결제 방법</th>
						<th class="tac">결제 날짜</th>
						<th class="tac">결제 금액</th>
						<th class="tac">메모</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty reservationCancel}">
							<c:forEach var="reservationCancel" items="${reservationCancel}"
								varStatus="status">
								<tr data-num="${reservationCancel.book_no }">
									<td>${reservationCancel.book_condition }</td>
									<td>${reservationCancel.book_name }</td>
									<td class="memberSeatDate"
										data-value="${reservationCancel.seat_date.substring(0,10)}">${reservationCancel.seat_date.substring(0,10)}</td>
									<td>${reservationCancel.seat_time }</td>
									<td>${reservationCancel.book_people }명</td>
									<td><c:choose>
											<c:when
												test="${reservationCancel.menu_name1 != '' && reservationCancel.menu_name2 == ''}">
										${reservationCancel.menu_name1}
										</c:when>
											<c:when
												test="${reservationCancel.menu_name2 != '' && reservationCancel.menu_name3 == ''}">
										${reservationCancel.menu_name1} , ${reservationCancel.menu_name2}
										</c:when>
											<c:when
												test="${reservationCancel.menu_name3 != '' && reservationCancel.menu_name4 == ''}">
${reservationCancel.menu_name1} , ${reservationCancel.menu_name2} 외 1종
												</c:when>
											<c:when
												test="${reservationCancel.menu_name4 != '' && reservationCancel.menu_name5 == ''}">
${reservationCancel.menu_name1} , ${reservationCancel.menu_name2} 외 2종
												</c:when>
											<c:when
												test="${reservationCancel.menu_name5 != '' && reservationCancel.menu_name6 == ''}">
${reservationCancel.menu_name1} , ${reservationCancel.menu_name2} 외 3종
												</c:when>
											<c:when
												test="${reservationCancel.menu_name6 != '' && reservationCancel.menu_name7 == ''}">
${reservationCancel.menu_name1} , ${reservationCancel.menu_name2} 외 4종
												</c:when>
											<c:when
												test="${reservationCancel.menu_name7 != '' && reservationCancel.menu_name8 == ''}">
${reservationCancel.menu_name1} , ${reservationCancel.menu_name2} 외 5종
												</c:when>
											<c:when
												test="${reservationCancel.menu_name7 != '' && reservationCancel.menu_name8 != ''}">
${reservationCancel.menu_name1} , ${reservationCancel.menu_name2} 외 6종
												</c:when>
										</c:choose></td>
									<td id="insidehere${status.index}"></td>
									<td>${reservationCancel.discount }원</td>
									<td>${reservationCancel.pay_way }</td>
									<td class="memberPayDate"
										data-value="${reservationCancel.pay_date.substring(0,10) }">${reservationCancel.pay_date.substring(0,10) }</td>
									<td class="memberTotalPay"
										data-value="${reservationCancel.totalpay }">${reservationCancel.totalpay }원</td>
									<td>${reservationCancel.book_memo }</td>
								</tr>
								<script type="text/javascript">
									var discountRate = '${reservationCancel.coupon_discountrate * 100}';
									var splitRate = discountRate.split(".0");
									var tost = '${reservationCancel.coupon_name}' + " " + splitRate[0] + "%";
									$("#insidehere${status.index}").append(tost);
								</script>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="12" class="tac"><div class="well"
										align="center">예약 취소 내역이 존재하지 않습니다.</div></td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
		</div>
	</div>
</body>