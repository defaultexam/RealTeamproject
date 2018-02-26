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
	$(document).ready(function() {
		if ($("#himar") == 2) {
			$("yemarr").attr({
				selected : "selected"
			});
		} else {
			$("nomarr").attr({
				selected : "selected"
			});
		}
	});
</script>
</head>
<body>
	<div id="memberInfoTabel">
		<h3>회원관리(상세정보조회 / 수정)</h3>
		<hr>
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

				<td colspan="3"><select id="marriage">
						<option value="1" id="nomarr">미혼</option>
						<option value="2" id="yemarr">기혼</option>
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
				<td colspan="3"><select id="marriage">
						<option value="1" id="nomarr">미혼</option>
						<option value="2" id="yemarr">기혼</option>
				</select><input id="himar" type="hidden" value="${memberInfo.marriage }"></td>
			</tr>
			<tr>
				<td><label class="intbName">결혼기념일</label></td>
				<td colspan="3"><input type="date"
					value="${memberInfo.weddingdate }"></td>
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
				<td colspan="3">${memberInfo.agreement3 }</td>
			</tr>
			<tr>
				<td><label class="intbName">포인트</label></td>
				<td colspan="3"><input type="number"
					value="${memberInfo.point }"> P</td>
			</tr>
			<tr>
				<td><label class="intbName">생일쿠폰기간</label></td>
				<td><label>${memberInfo.b_coupon_start} ~
						${memberInfo.b_coupon_end }</label><input type="button" value="삭제"></td>
				<td></td>
				<td><input type="date"><input type="button" value="지급"></td>
			</tr>
			<tr>
				<td><label class="intbName">결혼기념쿠폰기간</label></td>
				<td><label>${memberInfo.m_coupon_start} ~
						${memberInfo.m_coupon_end }</label><input type="button" value="삭제"></td>
				<td></td>
				<td><input type="date"><input type="button" value="지급"></td>
			</tr>
			<tr>
				<td><label class="intbName">VIP쿠폰기간</label></td>
				<td><label>${memberInfo.v_coupon_start } ~
						${memberInfo.v_coupon_end }</label><input type="button" value="삭제"></td>
				<td></td>
				<td><input type="date"><input type="button" value="지급"></td>
			</tr>
			<tr>
				<td><label class="intbName">추가메모</label></td>
				<td colspan="3"><textarea rows="3" cols="80">${memberInfo.memo }</textarea></td>
			</tr>
		</table>
		<input type="button" value="수정완료"> <input type="button"
			value="취소">
	</div>

</body>
</html>