<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var menuList = '${menulist}';
	var selectedMenu;
	$(document).ready(function() {
		if (menuList == null || menuList == '') {
			$("#getMenu").attr({
				"method" : "post",
				"action" : "/usermenu/mainMenu"
			});
			$("#getMenu").submit();
		}
	});
</script>
<style type="text/css">
.steak, .pasta, .sallad, .font2 {
	font-size: 15px;
}

.menu, .course, .drink, .font {
	font-size: 20px;
}

.menu {
	font-weight: 900;
	text-decoration: underline;
}

#div {
	width: 100%;
}
#steak #div{
    height: 500px;
}
#content {
	padding-top: 30px;
}

#name {
	font-size: 20px;
	font-weight: 700;
}

#text {
	font-size: 15px;
	padding-left: 55%;
}

#won {
	font-size: 15px;
	font-weight: 700;
	padding-left: 80%;
}

#file {
	height: 500px;
	width: 550px;
	float: left;
	padding: 5%;
	float: left;
	float: left;
}
</style>
</head>
<body>
	<form id="getMenu"></form>
	<div align="center">
		<a href="/usermenu/mainMenu"><span class="menu">단일 메뉴</span></a>&nbsp;&nbsp;<span
			class="font">l</span>&nbsp;&nbsp;<a href="/usermenu/course"><span
			class="course">코스 요리</span></a>&nbsp;&nbsp;<span class="font">l</span>&nbsp;&nbsp;<a
			href="/usermenu/drink"><span class="drink">주류</span></a>
	</div>
	<br>
	<br>
	<div align="center">
		<a href="#steak"><span class="steak">스테이크</span></a>&nbsp;&nbsp;<span
			class="font2">l</span>&nbsp;&nbsp;<a href="#pasta"><span
			class="pasta">파스타</span></a>&nbsp;&nbsp;<span class="font2">l</span>&nbsp;&nbsp;<a
			href="#sallad"><span class="sallad">샐러드</span></a>
	</div>
	<div id="steak">
		<br> <br>
		<h3>스테이크</h3>
		<div class="row">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<div id="div">
							<c:if test="${menu.menu_kind == 'steak'}">
								<div>
									<img src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
										data-num="${menu.menu_no }" alt="..." id="file">
									<div id="content">
										<br> <br>
										<h3 id="name">${menu.menu_name }</h3>
										<p id="text">${menu.menu_text }</p>
										<p id="won">
											<font size="3.5">${menu.menu_price } 원</font>
										</p>
									</div>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">메뉴 준비중 입니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="pasta">
		<br> <br>
		<h3>파스타</h3>
		<div>
			<div class="row">
				<c:choose>
					<c:when test="${not empty menulist}">
						<c:forEach var="menu" items="${menulist}" varStatus="status">
							<div id="div">
								<c:if test="${menu.menu_kind == 'pasta'}">
									<div>
										<img
											src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
											data-num="${menu.menu_no }" alt="..." id="file">
										<div id="content">
											<br> <br>
											<h3 id="name">${menu.menu_name }</h3>
											<p id="text">${menu.menu_text }</p>
											<p id="won">
												<font size="3.5">${menu.menu_price } 원</font>
											</p>
										</div>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">메뉴 준비중 입니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div id="sallad">
		<br> <br>
		<h3>샐러드</h3>
		<div>
			<div class="row">
				<c:choose>
					<c:when test="${not empty menulist}">
						<c:forEach var="menu" items="${menulist}" varStatus="status">
							<div id="div">
								<c:if test="${menu.menu_kind == 'sallad'}">
									<div>
										<img
											src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
											data-num="${menu.menu_no }" alt="..." id="file">
										<div id="content">
											<br> <br>
											<h3 id="name">${menu.menu_name }</h3>
											<p id="text">${menu.menu_text }</p>
											<p id="won">
												<font size="3.5">${menu.menu_price } 원</font>
											</p>
										</div>
									</div>
								</c:if>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="tac">메뉴 준비중 입니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<br>
	<br>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>