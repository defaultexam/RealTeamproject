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
				"action" : "/usermenu/course"
			});
			$("#getMenu").submit();
		}
	});
</script>
<style type="text/css">
.menu, .course, .drink {
	font-size: 20px;
}

.course {
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

#coursediv {
	width: 100%;
	height: 500px;
}

#content {
	padding-top: 30px;
}
</style>
</head>
<body>
	<div align="center">
		<a href="/usermenu/mainMenu" class="menu"><span class="info">단일
				메뉴</span></a>&nbsp;&nbsp;<span class="font">l</span>&nbsp;&nbsp;<a
			href="/usermenu/course" class="course"><span class="way">코스
				요리</span></a>&nbsp;&nbsp;<span class="font">l</span>&nbsp;&nbsp;<a
			href="/usermenu/drink" class="drink"><span class="way">주류</span></a>
	</div>
	<br>
	<br>
	<h3 id="course">코스 요리</h3>
	<div>
		<div class="row">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<div id="coursediv">
							<c:if test="${menu.menu_kind == 'course'}">
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
	<br>
	<br>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>