<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역관리 페이지</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<%
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String today = formatter.format(new java.util.Date());
	Calendar cal = Calendar.getInstance();
	String todayDate = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-"
			+ cal.get(Calendar.DATE);
%>

<script type="text/javascript">
	$(function() {
		$('#table-result tr').removeAttr("data-value");
		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var tab3 = document.getElementById("tab3");
		var tab4 = document.getElementById("tab4");
		// 탭 상태 화면 표시 설정
		if (sessionStorage.getItem("reservation") == '사용') {
			tab1.classList.remove("active");
			tab2.classList.add("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
		} else if (sessionStorage.getItem("reservation") == '미사용') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.add("active");
			tab4.classList.remove("active");
		} else if (sessionStorage.getItem("reservation") == '취소') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.add("active");
		} else {
			tab1.classList.add("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
		}

		/* 검색값 존재할때 유지하기 위한 설정  */
		var preSearchStart = "<c:out value='${data.searchStart}' />";

		if (preSearchStart.match("9999") != "9999") {
			$("#searchStart").val("<c:out value='${data.searchStart}' />");
		} else {

		}

		var preSearchEnd = "<c:out value='${data.searchEnd}' />";

		if (preSearchEnd.match("9999") != "9999") {
			$("#searchEnd").val("<c:out value='${data.searchEnd}' />");
		} else {

		}

		if ("<c:out value='${data.name}' />" != "") {
			$("#resSearchName").val("<c:out value='${data.name}' />");
		}

		if ("<c:out value='${data.phone}' />" != "") {
			$("#resSearchPhone").val("<c:out value='${data.phone}' />");
		}

		/* 한페이지에 보여줄 레코드수 조회후 선택한 값 그대로 유지 하기 위한 설정 */
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		// 선택 탭 유지하기 위한 설정
		if ("<c:out value='${data.book_condition}' />" != "") {
			$("#book_condition")
					.val("<c:out value='${data.book_condition}' />");
		}

		// 조회버튼 클릭시 발생 이벤트
		$("#reservationSearch").click(function() {
			var start = $("#searchStart").val();
			var end = $("#searchEnd").val();
			if (start == '' && end != '') {
				alert("조회날짜를 선택해주세요");
				return;
			} else if (start > end) {
				alert("기간을 확인해주세요");
				return;
			} else if (start != '' && end == '') {
				alert("조회날짜를 선택해주세요");
				return;
			} else {
				goPage(1);
			}
		});
		$("#searchEnd").attr("readonly", true);
		// 전체보기 버튼 클릭시 발생 이벤트
		$("#reservationSearchTotal").click(function() {
			$("#resSearchName").val("");
			$("#resSearchPhone").val("");
			$("#searchStart").val("9999-12-31");
			$("#searchEnd").val("9999-12-31");
			$("#book_condition").removeAttr("value");
			sessionStorage.removeItem("reservation");
			goPage(1);
		});
		/* n이 한자리 수가되면 앞에 0을 추가하는 함수 */
		function addzero(n) {
			return n < 10 ? "0" + n : n;
		}
		// 기간선택버튼 클릭시 발생 이벤트
		$("#searchToday").click(
				function() {
					var now = new Date();
					$("#searchStart").val(
							now.getFullYear() + '-'
									+ addzero((now.getMonth() + 1)) + '-'
									+ addzero(now.getDate()));
					$("#searchEnd").val(
							now.getFullYear() + '-'
									+ addzero((now.getMonth() + 1)) + '-'
									+ addzero(now.getDate()));
				});
		// 한페이지에 보여줄 갯수 변경될때 처리 이벤트
		$("#pageSize").change(function() {
			goPage(1);
		});

		// 탭클릭시 이벤트
		$("#전체").click(function() {
			$("#book_condition").removeAttr("value");
			sessionStorage.removeItem("reservation");
			goPage(1);
		});
		$("#사용").click(function() {
			$("#book_condition").removeAttr("value");
			$("#book_condition").attr({
				"value" : "사용"
			});
			sessionStorage.setItem("reservation", '사용');
			goPage(1);
		});
		$("#미사용").click(function() {
			$("#book_condition").removeAttr("value");
			$("#book_condition").attr({
				"value" : "미사용"
			});
			sessionStorage.setItem("reservation", '미사용');
			goPage(1);
		});
		$("#취소").click(function() {
			$("#book_condition").removeAttr("value");
			$("#book_condition").attr({
				"value" : "취소"
			});
			sessionStorage.setItem("reservation", '취소');
			goPage(1);
		});

		/* 예약 행 클릭시 라디오박스 선택처리 이벤트 */
		$(".reservationInfo").click(function() {
			var pressCheck = $(this).attr("data-value");
			if (pressCheck != null) {
				alert("수정 중일때 행이동은 불가합니다. 수정완료/취소를 진행후 다시 선택해주세요 ");
				return;
			} else {
				$(".checkResBtn").removeAttr("checked");
				$(this).children().children('.checkResBtn').attr({
					"checked" : "checked"
				});
			}
		});

		/* 예약상태수정 버튼 클릭시 이벤트 */
		$("#reservationEdit")
				.click(
						function() {
							var checked = $('.checkResBtn').is(":checked");
							var checkedTdVal = $('.checkResBtn:checked')
									.parents("td").siblings(".conditionTd")
									.attr("data-value");
							if (!checked) {
								alert("수정할 예약행을 선택 후 수정버튼을 클릭해주세요 ");
								return;
							} else if (checkedTdVal != '미사용') {
								alert("미사용상태의 예약만 수정가능합니다. 확인 후 다시 시도해주세요 ");
								return;
							} else {
								/* 선택상태인것을 제외한 다른 행을 선택불가하게 처리하기위한 방법 */
								$('.checkResBtn:checked').parents("tr")
										.siblings("tr").attr({
											"data-value" : 1
										});
								/* 콤보박스 생성 */
								$('.checkResBtn:checked').parents("td")
										.siblings(".conditionTd").empty();
								$('.checkResBtn:checked')
										.parents("td")
										.siblings(".conditionTd")
										.append(
												"<select class='form-control' id='conditionEdit'><option value='잘못선택'>미사용</option><option value='사용'>사용</option><option value='취소'>취소</option></select>");
							}
						});

		/* 수정완료 버튼 클릭 이벤트 */
		$("#reservationEditOk")
				.click(
						function() {
							var changeConditionVal = $(
									"#conditionEdit option:selected").val();
							var checkedNum = $('.checkResBtn:checked').parents(
									"tr").attr("data-num");
							var cancelTrBook_date = $('.checkResBtn:checked')
									.parents("td").siblings(".seatDateTd")
									.attr("data-value");
							var cancelTrPayDate = $('.checkResBtn:checked')
									.parents("td").siblings(".payDateTd").attr(
											"data-value");
							var totalPayValue = $('.checkResBtn:checked')
									.parents("td").siblings(".totalPayTd")
									.attr("data-value");

							if (changeConditionVal != null) {
								if (changeConditionVal == '잘못선택') {
									alert("사용/취소 혹은 수정취소 버튼을 선택하세요");
									return;
								} else if (changeConditionVal == '취소') {
									var cancelTotalPay = 0;
									var now = new Date();
									var nowString = (now.getMonth() + 1) + "-"
											+ now.getDate();
									var currDay = 24 * 60 * 60 * 1000;
									var bookdate = new Date(cancelTrBook_date);
									var paydate = new Date(cancelTrPayDate);
									/* 일주일전 날짜 */
									var sevenTerm = new Date(bookdate - 7
											* currDay);
									var sevenTermString = (sevenTerm.getMonth() + 1)
											+ "-" + sevenTerm.getDate();
									/* 4일전날짜 */
									var fourTerm = new Date(bookdate - 4
											* currDay);
									var fourTermString = (fourTerm.getMonth() + 1)
											+ "-" + fourTerm.getDate();
									/* 2일전날짜 */
									var twoTerm = new Date(bookdate - 2
											* currDay);
									var twoTermString = (twoTerm.getMonth() + 1)
											+ "-" + twoTerm.getDate();
									/* 하루전날짜 */
									var oneTerm = new Date(bookdate - 1
											* currDay);
									var oneTermString = (oneTerm.getMonth() + 1)
											+ "-" + oneTerm.getDate();

									if (((now.getMonth() + 1) + "-" + now
											.getDate()) == ((paydate.getMonth() + 1)
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
									// 환불정보 입력 모달 창 출력
									$("#cancelPayInsertModal").modal('show');
								} else {
									$
											.ajax({
												url : "/adminReservation/reservationEdit",
												type : "post",
												data : {
													"book_no" : checkedNum,
													"book_condition" : '사용'
												},
												error : function() {
													alert("사이트 접속 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요");
												},
												success : function(result) {
													if (result == 1) {
														$('#table-result tr')
																.removeAttr(
																		"data-value");
														alert("예약내역 사용처리 완료되었습니다.");
														window.history.go(0);
													} else {
														alert("예약 사용처리 실패");
													}
												}
											});
								}
							} else {
								alert("예약상태수정 버튼 클릭 후 다시 시도해주세요 ");
								return;
							}
						});

		/* 모달 수정하기 버튼 클릭 이벤트 */
		$("#cancelPayInsertModalBtn")
				.click(
						function() {
							var checkedNum = $('.checkResBtn:checked').parents(
									"tr").attr("data-num");
							var cancelConfirm = confirm("예약 취소 선택 시 복구할 수 없습니다. 진행하시겠습니까?");
							if (cancelConfirm) {
								$
										.ajax({
											url : "/adminReservation/reservationEdit",
											type : "post",
											data : {
												"book_no" : checkedNum,
												"book_condition" : '취소',
												"cancel_total" : $(
														"#inputcancel_total")
														.val(),
												"cancel_reciver" : $(
														"#inputcancel_reciver")
														.val(),
												"cancel_bank" : $(
														"#inputcancel_bank")
														.val(),
												"cancel_account" : $(
														"#inputcancel_account")
														.val()
											},
											error : function() {
												alert("사이트 접속 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요");
											},
											success : function(result) {
												if (result == 1) {
													alert("예약내역이 취소처리 완료되었습니다. 예약내역은 취소내역으로 이동되었습니다.");

													$('#table-result tr')
															.removeAttr(
																	"data-value");

													window.history.go(0);
												} else {
													alert("예약취소처리 실패");
												}
											}
										});
							} else {
								return;
							}
						});

		/* 수정취소 버튼 클릭 이벤트 */
		$("#reservationEditCancel")
				.click(
						function() {
							var checkedTdVal = $('.checkResBtn:checked')
									.parents("td").siblings(".conditionTd")
									.attr("data-value");
							var changeConditionVal = $(
									"#conditionEdit option:selected").val();
							if (changeConditionVal != null) {
								alert("예약상태수정 취소");
								$('#table-result tr').removeAttr("data-value");
								$('.checkResBtn:checked').parents("td")
										.siblings(".conditionTd").empty();
								$('.checkResBtn:checked').parents("td")
										.siblings(".conditionTd").append(
												"<label>" + checkedTdVal
														+ "</label>");
							} else {
								alert("예약상태수정 버튼 클릭 후 다시 시도해주세요 ");
								return;
							}
						});
		/* 환불버튼 클릭시 발생 이벤트 */
		$(".cancelPayBtn").click(
				function() {
					var cancelPayNo = $(this).parents("tr").attr("data-num");
					var cancelReciver = $(this).parents("td").siblings(
							".cancelreciverTd").attr("data-value");
					var cancelBank = $(this).parents("td").siblings(
							".cancelbankTd").attr("data-value");
					var cancelAccount = $(this).parents("td").siblings(
							".cancelaccountTd").attr("data-value");
					var cancelTotal = $(this).parents("td").siblings(
							".canceltotalTd").attr("data-value");

					$("#selected_Book_no").val(cancelPayNo);
					$("#cancel_reciver").val(cancelReciver);
					$("#cancel_bank").val(cancelBank);
					$("#cancel_account").val(cancelAccount);
					$("#cancel_total").val(cancelTotal);
					$("#cancelPayModal").modal('show');
				});

		/* 환불모달 환불버튼 클릭 이벤트 */
		$("#cancelPayModalBtn").click(function() {
			alert("환불처리 완료 ");
			$("#f_Form").attr({
				"method" : "get",
				"action" : "/adminReservation/cancelUpdate"
			});
			$("#f_Form").submit();
		});
		/* 환불모달 취소창 버튼 클릭시 이벤트  */
		$(".bye").click(function() {
			resetData();
		});
		/* 엑셀다운로드 버튼 클릭 시 처리 이벤트 */
		$("#excelReservationList").click(
				function() {
					if ($("#searchStart").val() == ""
							|| $("#searchStart").val() == null)
						$("#searchStart").removeAttr("name");
					if ($("#searchEnd").val() == ""
							|| $("#searchEnd").val() == null)
						$("#searchEnd").removeAttr("name");
					$("#page").val(page);
					$("#f_search").attr({
						"method" : "get",
						"action" : "/adminReservation/reservationExcel"
					});
					$("#f_search").submit();
				});
	});
	function resetData() {
		$("#f_writeForm").each(function() {
			this.reset();
		});
	}
	// 데이터피커 활성화
	function endDateOn() {
		$("#searchEnd").attr("readonly", false);
	}
	function goPage(page) {
		if ($("#searchStart").val() == "" || $("#searchStart").val() == null)
			$("#searchStart").val("9999-12-31");
		if ($("#searchEnd").val() == "" || $("#searchEnd").val() == null)
			$("#searchEnd").val("9999-12-31");
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/adminReservation/list"
		});
		$("#f_search").submit();
	}
</script>
<style type="text/css">
#reservationTable {
	width: 1750px;
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
}

#span {
	float: right;
}

#reservationConditionEdit {
	float: left;
}

#excelAndPageSize {
	float: right;
}

#clear {
	clear: both;
}
</style>
</head>
<body>
	<div id="reservationTable">
		<div>
			<h3>예약내역관리</h3>
			<p id="span">* 선택칸의 라디오 버튼 클릭후 예약상태 수정 버튼 클릭시 상태변경이 가능합니다..</p>
			<hr>
		</div>

		<%-- ================ 검색기능 시작 =============== --%>

		<form id="f_search">
			<div id="reservationSearchdiv">
				<input type="hidden" id="page" name="page" value="${data.page }" />
				<input type="hidden" name="book_condition" id="book_condition">
				<table summary="검색" style="width: 800px;">
					<tr>
						<td><label>조회기간 : </label></td>
						<td colspan="3" align="center" valign="middle"><input
							type="date" id="searchStart" name="searchStart"
							class="form-control" style="width: 230px; float: left;"
							onchange="endDateOn();"> ~ <input type="date"
							id="searchEnd" name="searchEnd" class="form-control"
							style="width: 230px; float: right;"></td>
						<td rowspan="3"><input type="button" value="당일"
							id="searchToday" class="btn btn-default"></td>
						<td rowspan="3"><input type="button" value="조회"
							id="reservationSearch" class="btn btn-default"></td>
						<td rowspan="3"><input type="button" value="전체보기"
							id="reservationSearchTotal" class="btn btn-default"></td>
					</tr>
					<tr>
						<td><label for="resSearchName">이름 : </label></td>
						<td><input type="text" id="resSearchName" name="name"
							class="form-control"></td>
					</tr>
					<tr>
						<td><label for="resSearchPhone">전화번호 뒷 4자리 : </label></td>
						<td><input type="text" id="resSearchPhone" name="phone"
							class="form-control"></td>
					</tr>
				</table>


			</div>

			<div id="reservationConditionEdit">
				<table>
					<tr>
						<td>
							<button type="button" id="reservationEdit"
								class="btn btn-default">예약상태수정</button>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<button type="button" id="reservationEditOk"
								class="btn btn-default">수정완료</button>
							<button type="button" id="reservationEditCancel"
								class="btn btn-default">수정취소</button>
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>

			<div id="excelAndPageSize">
				<table>
					<tr>

						<td><select id="pageSize" name="pageSize"
							class="form-control">
								<option value="10">10개씩 보기</option>
								<option value="30">30개씩 보기</option>
								<option value="50">50개씩 보기</option>
						</select></td>
						<td>&nbsp;</td>
						<td>
							<button type="button" id="excelReservationList"
								class="btn btn-default">Excel문서화</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div id="clear" hidden=""></div>
		<br> <Br>
		<%-- ================ 검색기능 종료 =============== --%>
		<div>
			<ul class="nav nav-tabs">
				<li class="active" id="tab1"><a id="전체">전체예약</a></li>
				<li class="" id="tab2"><a id="사용">사용예약</a></li>
				<li class="" id="tab3"><a id="미사용">미사용예약</a></li>
				<li class="" id="tab4"><a id="취소">취소예약</a></li>
			</ul>

			<div id="table-result">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="tac">선택</th>
							<th class="tac">NO</th>
							<th class="tac">예약상태</th>
							<th class="tac">환불상태</th>
							<th class="tac">예약날짜</th>
							<th class="tac">예약타임</th>
							<th class="tac">예약자명</th>
							<th class="tac">사용자명</th>
							<th class="tac">메뉴</th>
							<th class="tac">인원수</th>
							<th class="tac">사용쿠폰명</th>
							<th class="tac">결제방법</th>
							<th class="tac">결제날짜</th>
							<th class="tac">할인금액</th>
							<th class="tac">총결제금액</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty reservationList}">
								<c:forEach var="reservation" items="${reservationList}"
									varStatus="status">
									<tr data-num="${reservation.book_no}" class="reservationInfo">
										<td class="checkBtnTd"><c:if
												test="${reservation.book_condition == '미사용'}">
												<input type="radio" name="checkReservation" value="on"
													class="checkResBtn">
											</c:if></td>
										<td>${count - status.index}</td>
										<td class="conditionTd"
											data-value="${reservation.book_condition}"><c:choose>
												<c:when test="${reservation.book_condition == '사용'}">
													<label style="color: green;">${reservation.book_condition}</label>
												</c:when>
												<c:when test="${reservation.book_condition == '취소'}">
													<label style="color: red;">${reservation.book_condition}</label>
												</c:when>
												<c:when test="${reservation.book_condition == '기한만료'}">
													<label style="color: purple;">${reservation.book_condition}</label>
												</c:when>
												<c:otherwise>
													<label>${reservation.book_condition}</label>
												</c:otherwise>
											</c:choose></td>
										<td>${reservation.cancel_condition}<c:if
												test="${reservation.cancel_condition == '환불미완료'}">
												<button type="button" class="btn btn-default cancelPayBtn">환불하기</button>
											</c:if>
										</td>
										<td class="seatDateTd"
											data-value="${reservation.seat_date.substring(0,10)}">${reservation.seat_date.substring(0,10)}</td>
										<td>${reservation.seat_time}</td>
										<td>${reservation.name}</td>
										<td>${reservation.book_name}</td>
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
										<td>${reservation.book_people}명</td>
										<td>${reservation.coupon_name}</td>
										<td>${reservation.pay_way}</td>
										<td class="payDateTd"
											data-value="${reservation.pay_date.substring(0,10)}">${reservation.pay_date.substring(0,10)}</td>
										<td>${reservation.discount}</td>
										<td class="totalPayTd" data-value="${reservation.totalpay}">${reservation.totalpay}</td>
										<td hidden="" class="cancelreciverTd"
											data-value="${reservation.cancel_reciver }"></td>
										<td hidden="" class="cancelbankTd"
											data-value="${reservation.cancel_bank }"></td>
										<td hidden="" class="cancelaccountTd"
											data-value="${reservation.cancel_account }"></td>
										<td hidden="" class="canceltotalTd"
											data-value="${reservation.cancel_total }"></td>

									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="14" class="tac">예약이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>

		<%-- ============= 페이지 네비게이션 시작 ============ --%>
		<div id="boardPage" class="">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize }" />
		</div>
	</div>

	<!-- 환불 화면 영역(modal) -->
	<div class="modal fade" id="cancelPayModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">환불 정보</h4>
				</div>
				<div class="modal-body">
					<form id="f_Form">
						<input type="hidden" id="selected_Book_no" name="book_no">
						<div class="form-group">
							<label for="cancel_reciver" class="control-label">환불예금주</label> <input
								type="text" class="form-control" id="cancel_reciver"
								maxlength="5" readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="cancel_bank" class="control-label">환불은행</label> <input
								type="text" class="form-control" id="cancel_bank" maxlength="50"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="cancel_account" class="control-label">환불계좌</label> <input
								type="text" class="form-control" id="cancel_account"
								readonly="readonly"></input>
						</div>
						<div class="form-group">
							<label for="cancel_total" class="control-label">환불금액(원)</label> <input
								type="text" class="form-control" id="cancel_total"
								readonly="readonly"></input>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="cancelPayModalBtn">환불</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						class="bye">취소</button>
				</div>
			</div>
		</div>
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


	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>