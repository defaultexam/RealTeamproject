<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#header {
	width: 90%;
	border-width: medium;
	border-style: solid;
	align-items: center;
}

#headerMenu {
	border-top-width: medium;
	border-top-style: double;
}

#adminHello {
	float: right;
}
</style>
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
		<div id="headerMenu">
			<a href="/adminMember/list.do">회원관리</a> | <a href="#">메뉴관리</a> | <a
				href="#">예약관리</a> | <a href="#">방문후기관리</a> | <a href="#">고객센터관리</a>
			| <a href="#">통계</a>
		</div>
	</div>
</body>
</html>