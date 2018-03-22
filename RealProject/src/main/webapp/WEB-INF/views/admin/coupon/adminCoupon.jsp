<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(function() {
		$("#couponInsertBtn").click(function() {
			$("#couponInsert").modal('show');
		});
		$("#couponInsertModalBtn")
				.click(
						function() {
							// 입력값 체크
							if (!formCheck($('#coupon_name'),
									$('.error:eq(0)'), "쿠폰명을")) {
								return;
							} else if (!formCheck($('#coupon_term'),
									$('.error:eq(1)'), "쿠폰기간을")) {
								return;
							} else if (!formCheck($('#coupon_discountrate'),
									$('.error:eq(2)'), "할인률을")) {
								return;
							} else if (!chkNumberForm($('#coupon_term'),
									$('.error:eq(1)'), "쿠폰기간을")) {
								return;
							} else {
								$
										.ajax({
											method : "post",
											url : "/adminCoupon/insertCoupon",
											data : {
												"coupon_name" : $(
														"#coupon_name").val(),
												"coupon_term" : $(
														"#coupon_term").val(),
												"coupon_discountrate" : $(
														"#coupon_discountrate")
														.val()
											},
											dataType : "text",
											error : function() {
												alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해주세요");
											},
											success : function() {
												alert("신규 쿠폰 등록 성공");
												$("#couponInsert")
														.modal('hide');
												window.history.go(0);
											}
										});
							}
						});
		$(".bye").click(function() {
			resetData();
		});
		$(".couponInfo").click(
				function() {
					var selectedCouponNo = $(this).attr("data-num");
					$.ajax({
						method : "get",
						url : "/adminCoupon/selectCoupon",
						data : {
							"cno" : selectedCouponNo
						},
						dataType : "json",
						error : function() {
							alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해주세요");
						},
						success : function(data) {
							console.log("쿠폰선택완료");
							console.log(data);
							console.log(data.coupon_no);
							console.log()
							var result = data;

							$("#selectedCoupon_no").val(data.coupon_no);
							$("#updatecoupon_name").val(result.coupon_name);
							$("#updatecoupon_term").val(result.coupon_term);
							$("#updatecoupon_discountrate").val(
									result.coupon_discountrate);

							if (result.coupon_active == "사용가능쿠폰") {
								$("#couponYes").attr({
									"selected" : "selected"
								});
							} else {
								$("#couponNo").attr({
									"selected" : "selected"
								});
							}
							$("#couponUpdate").modal('show');
						}
					});

				});
		$("#couponUpdateModalBtn")
				.click(
						function() {
							// 입력값 체크
							if (!formCheck($('#updatecoupon_term'),
									$('.error:eq(1)'), "쿠폰기간을")) {
								return;
							} else if (!formCheck(
									$('#updatecoupon_discountrate'),
									$('.error:eq(2)'), "할인률을")) {
								return;
							} else if (!chkNumberForm($('#updatecoupon_term'),
									$('.error:eq(1)'), "쿠폰기간을")) {
								return;
							} else {
								$
										.ajax({
											method : "get",
											url : "/adminCoupon/updateCoupon",
											data : {
												"coupon_no" : $(
														"#selectedCoupon_no")
														.val(),
												"coupon_name" : $(
														"#updatecoupon_name")
														.val(),
												"coupon_term" : $(
														"#updatecoupon_term")
														.val(),
												"coupon_discountrate" : $(
														"#updatecoupon_discountrate")
														.val(),
												"coupon_active" : $(
														"#updatecoupon_active option:selected")
														.val()
											},
											dataType : "text",
											error : function() {
												alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해주세요");
											},
											success : function(data) {
												if (data == 1) {
													alert("쿠폰 수정 등록 성공");
													$("#couponUpdate").modal(
															'hide');
													window.history.go(0);
												} else {
													alert("응실패");
												}

											}
										});
								//$("#f_writeForm").submit();

							}
						});

	});
	// 초기화 작업
	function resetData() {
		$("#f_writeForm").each(function() {
			this.reset();
		});
	}

	function chkNumberForm(main, item, msg) {
		var exp = /^[1-9][0-9]*$/;
		if (!main.val().replace(/\s/g, "").match(exp)) {
			item.css("color", "#000099").html(msg + " 숫자로 입력해 주세요");
			main.val("");
			return false;
		} else {
			return true;
		}
	}
</script>
<style type="text/css">
#span {
	float: right;
}
#couponTable {
	width: 1750px;
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="couponTable">
		<div>
			<h2>쿠폰관리</h2>
			<span id="span">* 쿠폰 클릭 시 쿠폰수정이 가능합니다.</span>
			<hr>
		</div>
		<div id="table-result">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th class="tac">쿠폰넘버</th>
						<th class="tac">쿠폰이름</th>
						<th class="tac">사용가능쿠폰기간</th>
						<th class="tac">쿠폰할인률</th>
						<th class="tac">쿠폰사용가능상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty couponList}">
							<c:forEach var="coupon" items="${couponList}" varStatus="status">
								<tr data-num="${coupon.coupon_no}" class="couponInfo">
									<td>${coupon.coupon_no}</td>
									<td>${coupon.coupon_name}</td>
									<td>${coupon.coupon_term}일</td>
									<td>${coupon.coupon_discountrate*100}%</td>
									<td><c:if test="${coupon.coupon_active == '사용가능쿠폰'}">
											<label style="color: blue;">${coupon.coupon_active}</label>
										</c:if> <c:if test="${coupon.coupon_active == '사용불가쿠폰'}">
											<label style="color: red;">${coupon.coupon_active}</label>
										</c:if></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac">등록된 쿠폰이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 추가 버튼 영역 -->
	<p class="tar">
		<button type="button" id="couponInsertBtn" class="btn btn-default">쿠폰추가</button>
	<p>

		<!-- 쿠폰 추가 화면 영역(modal) -->
	<div class="modal fade" id="couponInsert" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">쿠폰 추가</h4>
				</div>
				<div class="modal-body">
					<form id="f_writeForm" name="f_writeForm">
						<div class="form-group">
							<label for="coupon_name" class="control-label">쿠폰명</label> <input
								type="text" class="form-control" name="coupon_name"
								id="coupon_name" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="coupon_term" class="control-label">쿠폰기간(일 단위)</label>
							<input type="text" class="form-control" name="coupon_term"
								id="coupon_term" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="coupon_discountrate" class="control-label">쿠폰
								할인률(소수 단위)</label> <input type="text" class="form-control"
								name="coupon_discountrate" id="coupon_discountrate"></input>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="couponInsertModalBtn">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						class="bye">닫기</button>

				</div>
			</div>
		</div>
	</div>

	<!-- 쿠폰 수정 화면 영역(modal) -->
	<div class="modal fade" id="couponUpdate" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">쿠폰 수정</h4>
				</div>
				<div class="modal-body">
					<form id="f_Form" name="f_writeForm">
						<input type="hidden" id="selectedCoupon_no">
						<div class="form-group">
							<label for="updatecoupon_name" class="control-label">쿠폰명</label>
							<input type="text" class="form-control" name="coupon_name"
								id="updatecoupon_name" maxlength="5" readonly="readonly" />
						</div>
						<div class="form-group">
							<label for="updatecoupon_term" class="control-label">쿠폰기간(일
								단위)</label> <input type="text" class="form-control" name="coupon_term"
								id="updatecoupon_term" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="updatecoupon_discountrate" class="control-label">쿠폰
								할인률(소수 단위)</label> <input type="text" class="form-control"
								name="coupon_discountrate" id="updatecoupon_discountrate"></input>
						</div>
						<div class="form-group">
							<label for="updatecoupon_active" class="control-label">쿠폰
								할인률(소수 단위)</label> <select class="form-control"
								name="coupon_discountrate" id="updatecoupon_active">
								<option value="사용가능쿠폰" id="couponYes">사용가능쿠폰</option>
								<option value="사용불가쿠폰" id="couponNo">사용불가쿠폰</option>
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="couponUpdateModalBtn">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						class="bye">닫기</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery.form.min.js"></script>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>