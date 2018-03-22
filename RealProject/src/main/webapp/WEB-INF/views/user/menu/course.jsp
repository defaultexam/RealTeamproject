<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	var menuList = '${menulist}';
	var selectedMenu;
	$("body").attr("data-dep1", "1");
	$("body").attr("data-dep2", "1");
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
.foodImg {
	width: 500px;
	height: 400px;
}

.caption {
	padding-top: 150px;
	padding-bottom: 150px;
}

.imgDivLeft {
	float: left;
}

.insidediv {
	padding-top: 15px;
	padding-bottom: 10px;
}

.separator {
	width: 100%;
}
</style>
</head>
<body>
	<form id="getMenu"></form>
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<strong>자리가 금방 사라져요!</strong> 둘러보시고 예약해주세요! <a href="../reservation"
			class="alert-link" style="float: right;">예약하기</a>.
	</div>
	<img src="/resources/include/css/images/separator.jpg"
		class="separator">
	<div id="course">
		<br />
		<h3 align="center">코스 메뉴</h3>
		<div class="row">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'course'}">
							<div class="insidediv col-md-12 well">
								<div>
									<div class="imgDivLeft">
										<img
											src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
											data-num="${menu.menu_no }" alt="..." class="foodImg"
											id="img${menu.menu_no }">
									</div>
									<div class="caption" align="center">
										<h3>${menu.menu_name }</h3>
										<p>${menu.menu_text }</p>
										<p>
											<font size="3.5">${menu.menu_price } 원</font>
										</p>
									</div>
								</div>
								<script type="text/javascript">
									var str = '${menu.menu_menufile }';
									var result = str.split("thumbnail_");
									$("#img"+${menu.menu_no }).attr("src", "/uploadStorage/menu/" + result[1]);
								</script>
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
	<br>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>