<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
table, .none, .nonev {
	border: 0;
	line-height: normal;
	background-color: white;
}

.menu {
	background-color: yellow;
	width: 200px;
	height: 200px;
	border-radius: 50px;
	border-color: black;
	border-style: solid;
	border-width: 1em;
	width: 200px;
}

a {
	text-decoration: none;
}

.none {
	width: 40px;
}

.nonev {
	height: 40px;
}
</style>
<script type="text/javascript">
	function tab() {
		sessionStorage.removeItem("tab");
	}
	function menuTab() {
		sessionStorage.removeItem("menu");
	}
	function reservationTab() {
		sessionStorage.removeItem("reservation");
	}
</script>
<title>관리자컨텐츠부분</title>
</head>
<body>
	<div id="content">
		<table border="1">
			<tr class="menu">
				<td class="menu" align="center">
					<h2>회원관리</h2> <a href="/adminMember/list.do" onclick="tab();">회원조회</a><br>
					<a href="/adminCoupon/couponList">쿠폰관리</a>
				</td>
				<td class="none"></td>
				<td class="menu" align="center">
					<h2>메뉴관리</h2> <a href="/menu/menuSelect" onclick="menuTab();">메뉴관리</a>
				</td>
				<td class="none"></td>
				<td class="menu" align="center">
					<h2>예약관리</h2> <a href="/adminReservation/list"
					onclick="reservationTab();">예약관리</a>
				</td>
			</tr>
			<tr>
				<td class="nonev" colspan="5"></td>
			</tr>
			<tr class="menu">
				<td align="center" class="menu">
					<h2>방문후기관리</h2> <a href="#">방문후기관리</a>
				</td>
				<td class="none"></td>
				<td class="menu" align="center">
					<h2>고객센터관리</h2> <a href="/adminNotice"">공지사항관리</a><br> <a
					href="/adminFaq/adminFaqList">FAQ관리</a><br> <a
					href="/adminQuestion">1:1문의관리</a>
				</td>
				<td class="none"></td>
				<td class="menu" align="center">
					<h2>통계</h2> <a href="/adminChart/reservation">예약통계</a><br> <a
					href="/adminChart/member">회원통계</a>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>