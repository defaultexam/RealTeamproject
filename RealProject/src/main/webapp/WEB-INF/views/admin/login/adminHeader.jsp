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
	function tab() {
		sessionStorage.removeItem("tab");
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
			<img align="middle" alt="" src="/resources/images/logo.png" width="200"
				height="200" onclick='location.href="/afterAdminLogin.do"'>
			<div id="adminHello">
				<label>관리자님 반갑습니다.</label> <a href="/admin/logout.do">로그아웃</a>
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

				<li id="menutab2"><a href="/menu/menuSelect"><font
						color="black">메뉴관리</font></a></li>
				<li id="menutab3" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false"><font color="black">예약관리</font><span
						class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="about-us">
						<li><a href="#">예약내역관리</a></li>
						<li><a href="#">취소내역관리</a></li>
					</ul></li>
				<li id="menutab4"><a href="#"><font color="black">방문후기관리</font></a></li>
				<li id="menutab5" class="dropdown"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown" role="button"
					aria-haspopup="true" aria-expanded="false"><font color="black">고객센터관리</font><span
						class="caret"></span></a>
					<ul class="dropdown-menu" aria-labelledby="about-us">
						<li><a href="/adminNotice">공지사항관리</a></li>
						<li><a href="/adminFaq/adminFaqList">FAQ관리</a></li>
						<li><a href="#">1:1문의관리</a></li>
					</ul></li>
				<li id="menutab6"><a href="#"><font color="black">통계</font></a></li>
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