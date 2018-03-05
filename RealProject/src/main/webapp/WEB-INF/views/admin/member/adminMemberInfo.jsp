<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세보기 페이지</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#memberInfoTable {
	height: 500px;
}

.intbName {
	align-content: center;
}
</style>
<script type="text/javascript">
	$(function() {

		/* 생일 쿠폰 기간설정 */
		$("#b_coupon_start").attr({
			"value" : "${memberInfo.b_coupon_start}"
		});

		$("#b_coupon_end").attr({
			"value" : "${memberInfo.b_coupon_end}"
		});

		/* 결혼기념 쿠폰 기간설정 */
		$("#m_coupon_start").attr({
			"value" : "${memberInfo.m_coupon_start}"
		});

		$("#m_coupon_end").attr({
			"value" : "${memberInfo.m_coupon_end}"
		});

		/* vip 쿠폰 기간설정 */
		$("#v_coupon_start").attr({
			"value" : "${memberInfo.v_coupon_start}"
		});

		$("#v_coupon_end").attr({
			"value" : "${memberInfo.v_coupon_end}"
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

		/* 취소버튼 클릭시 메소드 */
		$("#memInfoCancel").click(function() {
			location.href = "/adminMember/list.do";
		});

		/* 쿠폰 기간 초기화 */
		$("#b_coupon_clear").click(function() {
			$("#b_coupon_start").attr({
				"value" : null
			});
			$("#b_coupon_end").attr({
				"value" : null
			});
		});

		$("#v_coupon_clear").click(function() {
			$("#v_coupon_start").attr({
				"value" : null
			});
			$("#v_coupon_end").attr({
				"value" : null
			});
		});

		$("#m_coupon_clear").click(function() {
			$("#m_coupon_start").attr({
				"value" : null
			});
			$("#m_coupon_end").attr({
				"value" : null
			});
		});

		/* n이 한자리 수가되면 앞에 0을 추가하는 함수 */
		function addzero(n) {
			return n < 10 ? "0" + n : n;
		}

		/* 쿠폰 지급 버튼 클릭 시 발동 함수  */
		$("#b_coupon_give").click(
				function() {
					var giveDate = new Date($("#b_coupon_giveDate").val());

					var endDate = new Date(Date.parse(giveDate) + 180 * 1000
							* 60 * 60 * 24);
					var endDateString = endDate.getFullYear().toString() + '-'
							+ addzero(endDate.getMonth() + 1) + '-'
							+ addzero(endDate.getDate());

					$("#b_coupon_start").attr({
						"value" : $("#b_coupon_giveDate").val()
					});
					$("#b_coupon_end").attr({
						"value" : endDateString
					});
				});

		$("#v_coupon_give").click(
				function() {
					var giveDate = new Date($("#v_coupon_giveDate").val());

					var endDate = new Date(Date.parse(giveDate) + 180 * 1000
							* 60 * 60 * 24);
					var endDateString = endDate.getFullYear().toString() + '-'
							+ addzero(endDate.getMonth() + 1) + '-'
							+ addzero(endDate.getDate());

					$("#v_coupon_start").attr({
						"value" : $("#v_coupon_giveDate").val()
					});
					$("#v_coupon_end").attr({
						"value" : endDateString
					});
				});

		$("#m_coupon_give").click(
				function() {

					var giveDate = new Date($("#m_coupon_giveDate").val());

					var endDate = new Date(Date.parse(giveDate) + 180 * 1000
							* 60 * 60 * 24);
					var endDateString = endDate.getFullYear().toString() + '-'
							+ addzero(endDate.getMonth() + 1) + '-'
							+ addzero(endDate.getDate());

					$("#m_coupon_start").attr({
						"value" : $("#m_coupon_giveDate").val()
					});
					$("#m_coupon_end").attr({
						"value" : endDateString
					});

				});

		/* 수정완료 버튼 클릭 시 발생 함수 */
		$("#memInfoUpdate").click(function() {

			if (!$("#b_coupon_start").val()) {

				$("#b_coupon_start").removeAttr("value");
				$("#b_coupon_end").removeAttr("value");

			} else {

				$("#b_coupon_no").attr({
					"value" : "0001"
				});
			}

			if (!$("#v_coupon_start").val()) {

				$("#v_coupon_start").removeAttr("value");
				$("#v_coupon_end").removeAttr("value");

			} else {
				$("#v_coupon_no").attr({
					"value" : "0001"
				});
			}

			if (!$("#m_coupon_start").val()) {

				$("#m_coupon_start").removeAttr("value");
				$("#m_coupon_end").removeAttr("value");

			} else {
				$("#m_coupon_no").attr({
					"value" : "0001"
				});
			}

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
			<input type="hidden" name="member_no"
				value="${memberInfo.member_no }"> <input type="hidden"
				name="b_coupon_no" id="b_coupon_no"> <input type="hidden"
				name="v_coupon_no" id="v_coupon_no"> <input type="hidden"
				name="m_coupon_no" id="m_coupon_no">

			<table border="1">
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
					<td colspan="3">${memberInfo.gender }</td>
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
					<td colspan="3">${memberInfo.marriage }</td>
				</tr>
				<tr>
					<td><label class="intbName">결혼기념일</label></td>
					<td colspan="3">${memberInfo.weddingdate }</td>
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
					<td colspan="3">${memberInfo.agreement3}</td>
				</tr>
				<tr>
					<td><label class="intbName">포인트</label></td>
					<td colspan="3"><input name="point" type="number"
						value="${memberInfo.point}"> P</td>
				</tr>
				<tr>
					<td><label class="intbName">생일쿠폰기간</label></td>
					<td><input readonly="readonly" name="b_coupon_start"
						id="b_coupon_start" type="text"> ~ <input
						name="b_coupon_end" id="b_coupon_end" type="text"
						readonly="readonly"> <input type="button" value="삭제"
						id="b_coupon_clear"></td>
					<td></td>
					<td><input id="b_coupon_giveDate" type="date"><input
						type="button" id="b_coupon_give" value="지급"></td>
				</tr>
				<tr>
					<td><label class="intbName">결혼기념쿠폰기간</label></td>
					<td><input readonly="readonly" name="m_coupon_start"
						id="m_coupon_start" type="text"> ~ <input
						name="m_coupon_end" id="m_coupon_end" type="text"
						readonly="readonly"> <input type="button" value="삭제"
						id="m_coupon_clear"></td>
					<td></td>
					<td><input id="m_coupon_giveDate" type="date"><input
						type="button" id="m_coupon_give" value="지급"></td>
				</tr>
				<tr>
					<td><label class="intbName">VIP쿠폰기간</label></td>
					<td><input readonly="readonly" name="v_coupon_start"
						id="v_coupon_start" type="text"> ~ <input
						name="v_coupon_end" id="v_coupon_end" type="text"
						readonly="readonly"> <input type="button" value="삭제"
						id="v_coupon_clear"></td>
					<td></td>
					<td><input id="v_coupon_giveDate" type="date"><input
						type="button" id="v_coupon_give" value="지급"></td>
				</tr>
				<tr>
					<td><label class="intbName">추가메모</label></td>
					<td colspan="3">${memberInfo.memo }</td>
				</tr>
			</table>
		</form>
		<input id="memInfoUpdate" type="button" value="수정완료"> <input
			id="memInfoCancel" type="button" value="취소">
	</div>

</body>
</html>