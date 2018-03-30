<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세보기 페이지</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
#memberInfoTabel {
	width: 1000px;
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
	border-radius:
}

.intbName {
	align-content: center;
}
</style>
<script type="text/javascript">
	$(function() {
		/* n이 한자리 수가되면 앞에 0을 추가하는 함수 */
		function addzero(n) {
			return n < 10 ? "0" + n : n;
		}

		// 추가쿠폰지급 쿠폰이름 콤보박스 생성 
		var list;
		$
				.ajax({
					method : "get",
					url : "/adminMember/couponNameList",
					dataType : "json",
					data : {
						"member_no" : $("#member_no").val()
					},
					error : function() {
						alert("사이트 접속 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요");
					},
					success : function(resultData) {
						console.log(resultData);
						list = resultData;
						$("#selectCouponName").empty();
						if (list.length > 0) {
							for (var i = 0; i < list.length; i++) {
								$("#selectCouponName").append(
										"<option id='option"+i+"' value='"+list[i]+"'>"
												+ list[i] + "</option>");
							}
						} else {
							$("#selectCouponName")
									.append(
											"<option value='noCoupon'>선택가능한 쿠폰이 존재하지 않습니다.</option>");
						}

					}
				});

		/* 등급이 일반일때 콤보박스 셀렉트처리 */
		if ($("#hirank").val() == "일반") {
			$("#normal").attr({
				"selected" : "selected"
			});
		} else {
			$("#VIP").attr({
				"selected" : "selected"
			});
		}

		// 쿠폰 삭제버튼 이벤트 
		$(".deleteCoupon").click(function() {
			var couponname = $(this).parents("tr").attr("data-value");
			var confirmSelect = confirm("쿠폰삭제 시 복구 불가능합니다. 삭제하시겟습니까?");
			if (confirmSelect == true) {
				$.ajax({
					method : "get",
					url : "/adminMember/couponDelete",
					data : {
						"member_no" : $("#member_no").val(),
						"coupon_name" : couponname
					},
					error : function() {
						alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해 주세요");
					},
					success : function() {
						alert("쿠폰 삭제 완료");
						window.history.go(0);
					}
				});
			} else {
			}
		});

		// 신규 쿠폰 지급 버튼 클릭 이벤트
		$("#newCouponGiveBtn")
				.click(
						function() {
							var giveDate = new Date($("#newCouponGiveDate")
									.val());
							var giveCouponName = $(
									"#selectCouponName option:selected").val();
							if (giveCouponName.length == 0
									|| giveCouponName == 'noCoupon') {
								alert("지급가능한 쿠폰명을 선택해주세요");
								return;
							} else if ($("#newCouponGiveDate").val().length == 0) {
								alert("지급날짜를 선택해주세요");
								return;
							} else {
								var giveDateString = giveDate.getFullYear()
										.toString()
										+ '-'
										+ addzero(giveDate.getMonth() + 1)
										+ '-' + addzero(giveDate.getDate());
								$
										.ajax({
											method : "post",
											url : "/adminMember/newCouponGive",
											data : {
												"member_no" : $("#member_no")
														.val(),
												"coupon_name" : $(
														"#selectCouponName option:selected")
														.val(),
												"coupon_start" : giveDateString
											},
											error : function() {
												alert("사이트 접속 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요");
											},
											success : function() {
												alert("신규쿠폰 지급완료");
												window.history.go(0);
											}
										});
							}
						});

		/* 수정완료 버튼 클릭 시 발생 함수 */
		$("#memInfoUpdate").click(function() {
			sessionStorage.removeItem("tab");
			$("#memInfoForm").attr({
				"method" : "post",
				"action" : "/adminMember/memberUpdate.do"
			});
			$("#memInfoForm").submit();
		});
	});
</script>
</head>
<body>
	<div id="memberInfoTabel">
		<h3>회원관리(상세정보조회 / 수정)</h3>
		<hr>
		<form id="memInfoForm">
			<input type="hidden" name="member_no" id="member_no"
				value="${memberInfo.member_no }">
			<table class="table table-bordered table-hover">
				<tr>
					<td><label class="intbName">회원번호</label></td>
					<td colspan="3">${memberInfo.member_no }</td>
				</tr>
				<tr>
					<td><label class="intbName">가입일자</label></td>
					<td>${memberInfo.member_date }</td>
					<td><label class="intbName">탈퇴일자</label></td>
					<td>${memberInfo.member_outdate }</td>
				</tr>
				<tr>
					<td><label class="intbName">회원등급</label></td>

					<td colspan="3"><select name="rank" id="rank">
							<option value="일반" id="normal">일반</option>
							<option value="VIP" id="VIP">VIP</option>
					</select> <input id="hirank" type="hidden" value="${memberInfo.rank }">
					</td>
				</tr>
				<tr>
					<td><label class="intbName">회원상태</label></td>
					<td colspan="3">${memberInfo.condition }</td>
				</tr>
				<tr>
					<td><label class="intbName">아이디</label></td>
					<td colspan="3">${memberInfo.id }</td>
				</tr>
				<tr>
					<td><label class="intbName">이름</label></td>
					<td colspan="3">${memberInfo.name }</td>
				</tr>
				<tr>
					<td><label class="intbName">성별</label></td>
					<td colspan="3"><c:set value="${memberInfo.gender }"
							var="gender"></c:set> <c:choose>
							<c:when test="${gender == '1'}">
										남성</c:when>
							<c:otherwise>여성</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><label class="intbName">생년월일</label></td>
					<td colspan="3">${memberInfo.birthday }</td>
				</tr>
				<tr>
					<td><label class="intbName">이메일</label></td>
					<td colspan="3">${memberInfo.email }</td>
				</tr>
				<tr>
					<td><label class="intbName">전화번호</label></td>
					<td colspan="3">${memberInfo.phone }</td>
				</tr>
				<tr>
					<td><label class="intbName">결혼여부</label></td>
					<td colspan="3"><c:set value="${memberInfo.marriage }"
							var="marriage"></c:set> <c:choose>
							<c:when test="${marriage == '2'}">
										기혼</c:when>
							<c:otherwise>미혼</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><label class="intbName">결혼기념일</label></td>
					<td colspan="3"><c:set value="${memberInfo.weddingdate}"
							var="wedding" /> <c:choose>
							<c:when
								test="${wedding.toString().substring(0,5).contains('9999')}">
										 없음 </c:when>
							<c:otherwise>
										${memberInfo.weddingdate}
										</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><label class="intbName">직업</label></td>
					<td colspan="3">${memberInfo.job }</td>
				</tr>
				<tr>
					<td><label class="intbName">주소</label></td>
					<td colspan="3">${memberInfo.address }</td>
				</tr>
				<tr>
					<td><label class="intbName">이벤트알림동의</label></td>
					<td colspan="3"><c:set value="${memberInfo.agreement3 }"
							var="agree3"></c:set> <c:choose>
							<c:when test="${agree3 == '1'}">
										동의</c:when>
							<c:otherwise>미동의</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><label class="intbName">포인트</label></td>
					<td colspan="3"><input name="point" type="number"
						value="${memberInfo.point}"> P</td>
				</tr>

				<tr>
					<td><label class="intbName">추가쿠폰지급</label></td>
					<td><select id="selectCouponName"></select></td>
					<td><input type="date" id="newCouponGiveDate"></td>
					<td><input type="button" id="newCouponGiveBtn" value="지급"
						class="btn btn-default"></td>

				</tr>

				<c:choose>
					<c:when test="${not empty memberCouponInfo}">
						<c:forEach var="couponList" items="${memberCouponInfo}"
							varStatus="status">
							<tr data-value="${couponList.coupon_name}">
								<td><label class="intbName">쿠폰명</label></td>
								<td>${couponList.coupon_name}</td>
								<td><label class="intbName">유효기간</label></td>
								<td>${couponList.coupon_start}~${couponList.coupon_end}
									<button class="deleteCoupon btn btn-default">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">사용가능한 쿠폰이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
		<input id="memInfoUpdate" type="button" value="수정완료"
			class="btn btn-default"> <input id="memInfoCancel"
			type="button" value="취소"
			onclick="window.history.go(-1); return false;"
			class="btn btn-default">
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>