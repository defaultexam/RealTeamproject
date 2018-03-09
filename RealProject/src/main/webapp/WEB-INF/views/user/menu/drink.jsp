<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	var menuList = '${menulist}';
	var selectedMenu;
	$(document).ready(function() {
		if (menuList == null || menuList == '') {
			$("#getMenu").attr({
				"method" : "post",
				"action" : "/usermenu/drink"
			});
			$("#getMenu").submit();
		}
	});
</script>
<style type="text/css">
.wine, .beer, .liquor, .font2 {
	font-size: 15px;
}

.menu, .course, .drink, .font {
	font-size: 20px;
}

.drink {
	font-weight: 900;
	text-decoration: underline;
}

#name {
	font-size: 20px;
	font-weight: 700;
}

#text {
	font-size: 15px;
	padding-left: 35%;
}

#won {
	font-size: 15px;
	font-weight: 700;
	padding-left: 50%;
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
	<div align="center">
		<a href="/usermenu/mainMenu"><span class="menu">단일 메뉴</span></a>&nbsp;&nbsp;<span
			class="font">l</span>&nbsp;&nbsp;<a href="/usermenu/course"><span
			class="course">코스 요리</span></a>&nbsp;&nbsp;<span class="font">l</span>&nbsp;&nbsp;<a
			href="/usermenu/drink"><span class="drink">주류</span></a>
	</div>
	<br>
	<br>
	<div align="center">
		<a href="#wine"><span class="wine">와인</span></a>&nbsp;&nbsp;<span
			class="font2">l</span>&nbsp;&nbsp;<a href="#beer"><span
			class="beer">맥주</span></a>&nbsp;&nbsp;<span class="font2">l</span>&nbsp;&nbsp;<a
			href="#liquor"><span class="liquor">양주</span></a>
	</div>
	<div id="wine">
		<br> <br>
		<h3>와인</h3>
		<div>
			<div class="row">
				<c:choose>
					<c:when test="${not empty menulist}">
						<c:forEach var="menu" items="${menulist}" varStatus="status">
							<c:if test="${menu.menu_kind == 'wine'}">
								<div>
									<img src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
										data-num="${menu.menu_no }" alt="..." id="file">
									<div>
										<br> <br>
										<h3 id="name">${menu.menu_name }</h3>
										<p id="text">${menu.menu_text }</p>
										<p id="won">
											<font size="3.5">${menu.menu_price } 원</font>
										</p>
									</div>
								</div>
							</c:if>
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
	<div id="beer">
		<br> <br>
		<h3>맥주</h3>
		<div>
			<div class="row">
				<c:choose>
					<c:when test="${not empty menulist}">
						<c:forEach var="menu" items="${menulist}" varStatus="status">
							<c:if test="${menu.menu_kind == 'beer'}">
								<div>
									<img src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
										data-num="${menu.menu_no }" alt="..." id="file">
									<div>
										<br> <br>
										<h3 id="name">${menu.menu_name }</h3>
										<p id="text">${menu.menu_text }</p>
										<p id="won">
											<font size="3.5">${menu.menu_price } 원</font>
										</p>
									</div>
								</div>
							</c:if>
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
	<div id="liquor">
		<br> <br>
		<h3>양주</h3>
		<div>
			<div class="row">
				<c:choose>
					<c:when test="${not empty menulist}">
						<c:forEach var="menu" items="${menulist}" varStatus="status">
							<c:if test="${menu.menu_kind == 'liquor'}">
								<div>
									<img src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
										data-num="${menu.menu_no }" alt="..." id="file">
									<div>
										<br> <br>
										<h3 id="name">${menu.menu_name }</h3>
										<p id="text">${menu.menu_text }</p>
										<p id="won">
											<font size="3.5">${menu.menu_price } 원</font>
										</p>
									</div>
								</div>
							</c:if>
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