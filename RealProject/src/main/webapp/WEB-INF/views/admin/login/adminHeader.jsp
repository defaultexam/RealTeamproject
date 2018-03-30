<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li < a {
	font: black;
}
</style>
<script type="text/javascript">
	//회원관리 페이지 탭 선택 세션 초기화
	function tab() {
		sessionStorage.removeItem("tab");
	}
	//메뉴관리 페이지 탭 선택 세션 초기화
	function menuTab() {
		sessionStorage.removeItem("menu");
	}
	//예약관리 페이지 탭 선택 세션 초기화
	function reservationTab() {
		sessionStorage.removeItem("reservation");
	}
	//FAQ관리 페이지 탭 선택 세션 초기화
	function faqTabClear() {
		sessionStorage.removeItem("faqtab");
	}
	//1:1문의관리 페이지 탭 선택 세션 초기화
	function questionTabClear() {
		sessionStorage.removeItem("questionTab");
	}
</script>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
	<div id="header">
		<div>
			<img align="middle" alt="" src="/resources/images/logo.png"
				width="200" height="200"
				onclick='location.href="/afterAdminLogin.do"'>
			<div id="adminHello" align="right" style="padding-right: 33%;">
				<label>관리자님 반갑습니다.</label><a href="/admin/logout.do">로그아웃</a> <label>&nbsp;</label>
			</div>
		</div>
		<div id="headerMenu" class="">
			<ul class="nav nav-tabs" style="padding-left: 35%">
				<li id="menutab1" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false"><font color="black">회원관리</font><span
						class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="about-us">
						<li><a href="/adminMember/list.do" onclick="tab();">회원조회</a></li>
						<li><a href="/adminCoupon/couponList">쿠폰관리</a></li>
					</ul></li>
				<li id="menutab2"><a href="/menu/menuSelect"
					onclick="menuTab();"><font color="black">메뉴관리</font></a></li>
				<li id="menutab3"><a href="/adminReservation/list"
					onclick="reservationTab();"><font color="black">예약관리</font></a></li>
				<li id="menutab4"><a href="/adminComment"><font
						color="black">방문후기관리</font></a></li>
				<li id="menutab5" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false"><font color="black">고객센터관리</font><span
						class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="about-us">
						<li><a href="/adminNotice">공지사항관리</a></li>
						<li><a href="/adminFaq/adminFaqList" onclick="faqTabClear();">FAQ관리</a></li>
						<li><a href="/adminQuestion" onclick="questionTabClear();">1:1문의관리</a></li>
					</ul></li>
				<li id="menutab6" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false"><font color="black">통계</font><span
						class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="about-us">
						<li><a href="/adminChart/member">회원통계</a></li>
						<li><a href="/adminChart/reservation">예약통계</a></li>
					</ul></li>
			</ul>
		</div>
		<br />
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>