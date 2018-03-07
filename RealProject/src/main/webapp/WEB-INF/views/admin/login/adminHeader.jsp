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
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div id="header">
		<div>
			<img align="middle" alt="" src="/resources/image/1.jpg" width="200"
				height="200" onclick='location.href="/afterAdminLogin.do"'>
			<div id="adminHello">
				<label>관리자님 반갑습니다.</label> <a href="/admin/logout.do">로그아웃</a>
			</div>
		</div>
		<div id="headerMenu" class="center-block">
			<ul class="nav nav-tabs">
				<li style="padding-left: 35%"><a href="/adminMember/list.do"
					id="tab1"><font color="black">회원관리</font></a></li>
				<li id="tab2"><a href="/menu/menuSelect" onclick="setNav(2);"><font color="black">메뉴관리</font></a></li>
				<li id="tab3"><a href="#" onclick="setNav(3);"><font color="black">예약관리</font></a></li>
				<li id="tab4"><a href="#" onclick="setNav(4);"><font color="black">방문후기관리</font></a></li>
				<li id="tab5"><a href="#" onclick="setNav(5);"><font color="black">고객센터관리</font></a></li>
				<li id="tab6"><a href="#" onclick="setNav(6);"><font color="black">통계</font></a></li>
			</ul>
		</div>
		<br />
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>