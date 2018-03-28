<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function update() {
		location.href = "/mypage/updatePassword"
	}

	function out() {
		location.href = "/mypage/outPassword"
	}
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
	$("body").attr("data-dep1", 4);
	$("body").attr("data-dep2", -1);
	$("#navsidebar").attr("data-side", 1);
</script>
<style type="text/css">
.div {
	width: 200px;
	height: 150px;
	float: left;
	border: 1px #e5e5e5 solid;
	padding-top: 20px;
}
</style>
</head>
<body>
	<h3 align="center" style="font-weight: 700">내 정보 관리</h3>
	<h4 align="right">${loginInfo.name }님의등급은${loginInfo.rank }입니다.</h4>
	<h5 align="right">보유 포인트 : ${loginInfo.point } point</h5>
	<hr>
	<div class="container">
		<br> <br>
		<!-- 예약내역 -->
		<div align="center" style="padding-left: 200px; width: 1000px;">
			<div class="div">
				<a href="/mypage/reservationList"><img
					src="/resources/images/mypage/resList.png" align="middle"></a>
				<h4>예약 내역</h4>
				<span>${myPageMember.bookingCnt}건</span>
			</div>
			<!-- 예약 취소 내역 -->
			<div class="div">
				<a href="/mypage/reservationCancel"><img
					src="/resources/images/mypage/resCancel.png" align="middle"></a>
				<h4>예약 취소 내역</h4>
				<span>${myPageMember.bookingCancelCnt}건</span>
			</div>
			<!-- 문의 내역 -->
			<div class="div">
				<a href="#"><img src="/resources/images/mypage/QA.png"
					align="middle"></a>
				<h4>문의 내역</h4>
				<span>${myPageMember.qnaCnt}건</span>
			</div>
			<!-- 보유 쿠폰 -->
			<div class="div">
				<a href="/mypage/coupon"><img
					src="/resources/images/mypage/coupon.png" align="middle"></a>
				<h4>보유 쿠폰</h4>
				<span>${myPageMember.couponCnt}개</span>
			</div>
		</div>
		<br /> <br /> <br /> <br /> <br /> <br />
		<div align="center"
			style="padding-left: 600px; padding-top: 50px; width: 1000px;">
			<div class="div">
				<a onclick="update()" href="#"> <span
					style="font-size: 50px; color: black;"
					class="glyphicon glyphicon-paste"></span>
				</a>
				<h4>내 정보 수정</h4>
			</div>
			<!-- 예약 취소 내역 -->
			<div class="div">
				<a onclick="out()" href="#"><span
					style="font-size: 50px; color: red;"
					class="glyphicon glyphicon-alert"></span></a>
				<h4>회원 탈퇴</h4>
			</div>
		</div>
	</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>