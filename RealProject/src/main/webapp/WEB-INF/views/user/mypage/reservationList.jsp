<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$("#navsidebar").attr("data-side", 2);
	$(function() {
		$(".cancelBtn").click(
			function() {
				var checkedNum = $(this).parents("tr").attr("data-num");
				var cancelTrBook_date = $(this).parents("td").siblings(".memberSeatDate").attr("data-value");
				var cancelTrPayDate = $(this).parents("td").siblings(".memberPayDate").attr("data-value");
				var totalPayValue = $(this).parents("td").siblings(".memberTotalPay").attr("data-value");
				var cancelTotalPay = 0;
				var now = new Date();
				var nowString = (now.getMonth() + 1) + "-"
				+ now.getDate();
				var currDay = 24 * 60 * 60 * 1000;
				var bookdate = new Date(cancelTrBook_date);
				var paydate = new Date(cancelTrPayDate);
				/* 일주일전 날짜 */
				var sevenTerm = new Date(bookdate - 7 * currDay);
				var sevenTermString = (sevenTerm.getMonth() + 1)
				+ "-" + sevenTerm.getDate();
				/* 4일전날짜 */
				var fourTerm = new Date(bookdate - 4 * currDay);
				var fourTermString = (fourTerm.getMonth() + 1)
				+ "-" + fourTerm.getDate();
				/* 2일전날짜 */
				var twoTerm = new Date(bookdate - 2 * currDay);
				var twoTermString = (twoTerm.getMonth() + 1) + "-"
				+ twoTerm.getDate();
				/* 하루전날짜 */
				var oneTerm = new Date(bookdate - 1 * currDay);
				var oneTermString = (oneTerm.getMonth() + 1) + "-"
				+ oneTerm.getDate();
				if (((now.getMonth() + 1) + "-" + now.getDate()) == ((paydate
						.getMonth() + 1)
					+ "-" + paydate.getDate())) {
					cancelTotalPay = totalPayValue;
				} else if (sevenTermString >= nowString) {
					cancelTotalPay = totalPayValue;
				} else if (fourTermString >= nowString) {
					cancelTotalPay = totalPayValue * 0.9;
				} else if (twoTermString >= nowString) {
					cancelTotalPay = totalPayValue * 0.8;
				} else if (oneTermString == nowString) {
					cancelTotalPay = totalPayValue * 0.7;
				} else {
					cancelTotalPay = totalPayValue * 0;
				}
				$("#inputcancel_total").val(cancelTotalPay);
				$("#cancelBook_no").val(checkedNum);
				$("#cancelPayInsertModal").modal('show');
			});

		/* 모달 예약취소 버튼 클릭 이벤트 */
		$("#cancelPayInsertModalBtn").click(function() {
			var checkedNum = $('#cancelBook_no').val();
			var cancelConfirm = confirm("예약 취소 선택 시 복구할 수 없습니다. 진행하시겠습니까?");
			if (cancelConfirm) {
				$.ajax({
					url : "/mypage/reservationEdit",
					method : "post",
					data : {
						"book_no" : checkedNum,
						"book_condition" : '취소',
						"cancel_total" : $("#inputcancel_total").val(),
						"cancel_reciver" : $("#inputcancel_reciver").val(),
						"cancel_bank" : $("#inputcancel_bank").val(),
						"cancel_account" : $("#inputcancel_account").val()
					},
					error : function() {
						alert("사이트 접속 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요");
					},
					success : function(result) {
						console.log(result);
						if (result == 1) {
							alert("예약내역이 취소처리 완료되었습니다. ");
							window.history.go(0);
						} else {
							alert("예약취소처리 실패");
						}
					}
				});
			} else {
				alert("취소되었습니다.");
				return;
			}
		});
	});
</script>

</head>
<body>
	<h3 align="center" style="font-weight: 700;">예약 내역</h3>
	<hr>
	<div class="container-fluid" style="width: 1400px; padding-left: 0"
		align="center">

		<div id="table-result"
			style="width: 1200px; padding-right: 100px; float: left;">
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
						<th class="tac">예약취소</th>

					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty reservationList}">
							<c:forEach var="reservation" items="${reservationList}"
								varStatus="status">
								<tr data-num="${reservation.book_no }">
									<td>${reservation.book_condition }</td>
									<td>${reservation.book_name }</td>
									<td class="memberSeatDate"
										data-value="${reservation.seat_date.substring(0,10)}">${reservation.seat_date.substring(0,10)}</td>
									<td>${reservation.seat_time }</td>
									<td>${reservation.book_people }명</td>
									<td><c:choose>
											<c:when
												test="${reservation.menu_name1 != '' && reservation.menu_name2 == ''}">
										${reservation.menu_name1}
										</c:when>
											<c:when
												test="${reservation.menu_name2 != '' && reservation.menu_name3 == ''}">
										${reservation.menu_name1} , ${reservation.menu_name2}
										</c:when>
											<c:when
												test="${reservation.menu_name3 != '' && reservation.menu_name4 == ''}">
${reservation.menu_name1} , ${reservation.menu_name2} 외 1종
												</c:when>
											<c:when
												test="${reservation.menu_name4 != '' && reservation.menu_name5 == ''}">
${reservation.menu_name1} , ${reservation.menu_name2} 외 2종
												</c:when>
											<c:when
												test="${reservation.menu_name5 != '' && reservation.menu_name6 == ''}">
${reservation.menu_name1} , ${reservation.menu_name2} 외 3종
												</c:when>
											<c:when
												test="${reservation.menu_name6 != '' && reservation.menu_name7 == ''}">
${reservation.menu_name1} , ${reservation.menu_name2} 외 4종
												</c:when>
											<c:when
												test="${reservation.menu_name7 != '' && reservation.menu_name8 == ''}">
${reservation.menu_name1} , ${reservation.menu_name2} 외 5종
												</c:when>
											<c:when
												test="${reservation.menu_name7 != '' && reservation.menu_name8 != ''}">
${reservation.menu_name1} , ${reservation.menu_name2} 외 6종
												</c:when>
										</c:choose></td>
									<td id="insidehere${status.index}"></td>
									<td>${reservation.discount }원</td>
									<td>${reservation.pay_way }</td>
									<td class="memberPayDate"
										data-value="${reservation.pay_date.substring(0,10) }">${reservation.pay_date.substring(0,10) }</td>
									<td class="memberTotalPay"
										data-value="${reservation.totalpay }">${reservation.totalpay }원</td>
									<td>${reservation.book_memo }</td>
									<td><c:if test="${reservation.book_condition == '사용' }">
										</c:if> <c:if test="${reservation.book_condition == '미사용' }">
											<input type="button" class="cancelBtn btn btn-secondary"
												value="예약 취소">
										</c:if></td>
								</tr>
								<script type="text/javascript">
									var discountRate = '${reservation.coupon_discountrate * 100}';
									var splitRate = discountRate.split(".0");
									var tost = '${reservation.coupon_name}' + " "
										+ splitRate[0] + "%";
									$("#insidehere${status.index}").append(tost);
								</script>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="13" class="tac"><div class="well"
										align="center">예약내역이 존재하지 않습니다.</div></td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
			</table>
		</div>
		<!-- 예약취소 환불정보 입력 화면 영역(modal) -->
		<div class="modal fade" id="cancelPayInsertModal" tabindex="-1"
			role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">예약취소 환불 정보입력창</h4>
					</div>
					<div class="modal-body">
						<form id="f_Form">
							<input type="hidden" id="cancelBook_no">
							<div class="form-group">
								<label for="inputcancel_reciver" class="control-label">환불예금주</label>
								<input type="text" class="form-control" id="inputcancel_reciver"
									maxlength="50" required="required" />
							</div>
							<div class="form-group">
								<label for="inputcancel_bank" class="control-label">환불은행</label>
								<input type="text" class="form-control" id="inputcancel_bank"
									maxlength="50" required="required" />
							</div>
							<div class="form-group">
								<label for="inputcancel_account" class="control-label">환불계좌</label>
								<input type="text" class="form-control" id="inputcancel_account"
									required="required"></input>
							</div>
							<div class="form-group">
								<label for="inputcancel_total" class="control-label">환불금액(원)</label>
								<input type="text" class="form-control" id="inputcancel_total"
									readonly="readonly"></input>
							</div>
							<div align="center">
								<p>
									<strong>※ 예약 취소 환불 규정 ※</strong>
								</p>
								<p>예약일자로 부터 6 ~ 4일전 예약 취소시 결제금액 기준 10% 공제</p>
								<p>예약일자로 부터 3 ~ 2일전 예약 취소시 결제금액 기준 20% 공제</p>
								<p>예약일자로 부터 하루전 예약 취소시 결제금액 기준 30% 공제</p>
								<p>단, 결제당일 예약 취소시 전액 환불가능</p>
								<hr>
								<p>
									<font size="2.5px">* 예약취소를 하시게되면, 예약할때 지급받았던 포인트는 삭감처리
										되는점 양해 부탁드립니다.</font>
								</p>
								<p></p>

							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							id="cancelPayInsertModalBtn">예약취소</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							class="bye">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>