<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<h2>메뉴관리</h2> <a href="/menu/menuSelect">메뉴관리</a>
				</td>
				<td class="none"></td>
				<td class="menu" align="center">
					<h2>예약관리</h2> <a href="#">예약내역정보</a><br> <a href="#">취소내역정보</a>
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
					href="#">FAQ관리</a><br> <a href="#">1:1문의관리</a>
				</td>
				<td class="none"></td>
				<td class="menu" align="center">
					<h2>통계</h2> <a href="#">시간대별 예약현황</a><br> <a href="#">회원연령대비
						남녀비율</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>