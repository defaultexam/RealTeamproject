<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function update() {
		location.href = "/mypage/updatePassword"
	}

	function out() {
		location.href = "/mypage/outPassword"
	}
</script>
<style type="text/css">
.div {
	padding-right: 5%;
	float: left;
}

.sub {
	margin-left: 30%;
}
</style>
</head>
<body>
	<h3 style="padding-left: 15%; font-weight: 700">내 정보</h3>

	<br>
	<br>
	<h4 style="padding-left: 25%">${loginInfo.name }님의등급은
		${loginInfo.rank }입니다.</h4>
	<br>
	<h5 class="text-right" style="padding-right: 20%">보유 포인트 :
		${loginInfo.point } point</h5>
	<br>
	<!-- 예약내역 -->
	<div align="center">
		<div class="sub">
			<div class="div">
				<a href="/mypage/reservationList"><img
					src="/resources/images/mypage/resList.png"></a>
				<h4>예약 내역</h4>
				<h5>${myPageMember.bookingCnt}건</h5>
			</div>
			<!-- 예약 취소 내역 -->
			<div class="div">
				<a href="/mypage/reservationCancel"><img
					src="/resources/images/mypage/resCancel.png"></a>
				<h4>예약 취소 내역</h4>
				<h5>${myPageMember.bookingCancelCnt}건</h5>
			</div>
			<!-- 문의 내역 -->
			<div class="div">
				<a href="/question/questionList.do"><img src="/resources/images/mypage/QA.png"></a>
				<h4>문의 내역</h4>
				<h5>${myPageMember.qnaCnt}건</h5>
			</div>
			<!-- 보유 쿠폰 -->
			<div class="div">
				<a href="/mypage/coupon"><img
					src="/resources/images/mypage/coupon.png"></a>
				<h4>보유 쿠폰</h4>
				<h5>${myPageMember.couponCnt}개</h5>
			</div>
			<div style="padding-top: 15%; padding-left: 170px;">
				<input type="button" value="내 정보 수정" onclick="update()"> <input
					type="button" value="회원 탈퇴" onclick="out()">
			</div>
		</div>
	</div>


	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var errCode = "<c:out value='${errCode}' />";
			if (errCode != "") {
				// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환. 
				switch (parseInt(errCode)) {
				case 1:
					alert("예약이 있으면 회원 탈퇴를 할 수 없습니다.");
					break;
				}
			}
		});
	</script>
</body>
</html>