<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tile" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var sel_file;

	/* 초기화 버튼 */
	function menureset() {
		$(function() {
			$("#menu_name").val("");
			$("#menu_price").val("");
			$("#file").val("");
			$("#menu_text").val("");
			$("#menu_kind").val("");
			$("#menu_img").removeAttr("src");
			/* 수정,삭제 비활성 추가 활성 */
			$("#menuedit").prop("disabled", true);
			$("#menudel").prop("disabled", true);
			$("#menuadd").prop("disabled", false);
		});
	}

	$(function() {

		/* 추가 입력값 체크 및 submit */
		$("#menuadd").click(function() {
			//입력값체크chkMenukind
			if (!chkSubmit($('#menu_name'), "메뉴명을")) {
				return;
			} else if (!chkNumber($('#menu_price'), "가격을")) {
				return;
			} else if (!chkSubmit($('#menu_text'), "설명을")) {
				return;
			} else if (!chkSubmit($('#menu_kind'), "종류를")) {
				return;
			} else if (!chkSubmit($('#file'), "등록할 이미지를")) {
				return;
			} else if (!chkFile($('#file'))) {
				return;
			} else {

				$("#menu_no").removeAttr("name");
				$("#menu_menufile").removeAttr("name");

				$('#menu_form').attr({
					"method" : "POST",
					"action" : "/menu/menuInsert"
				});
				$("#menu_form").submit();
			}
		});
		/* 수정 삭제 버튼 비활성화 */
		$("#menuedit").prop("disabled", true);
		$("#menudel").prop("disabled", true);

		/* 파일선택 했을때 출력되는 이미지 스크립트 */
		$("#file").on("change", handleImgFileSelect);

		/* selectMenuVo 가 존재할때 각 데이터값 입력처리, 수정, 삭제 버튼 활성화, 입력버튼 비활성화 */
		var selectMenu = "<c:out value='${selectMenuVo}' />";
		if (selectMenu != "") {
			$("#menu_name").attr({
				"value" : "${selectMenuVo.menu_name}"
			});
			$("#menu_price").attr({
				"value" : "${selectMenuVo.menu_price}"
			});
			$("#menu_text").val("<c:out value='${selectMenuVo.menu_text}' />");

			var seMenuKind = "<c:out value='${selectMenuVo.menu_kind}' />";
			if (seMenuKind == "steak") {
				$("#steak").attr({
					"selected" : "selected"
				});
			} else if (seMenuKind == "pasta") {
				$("#pasta").attr({
					"selected" : "selected"
				});
			} else if (seMenuKind == "sallad") {
				$("#sallad").attr({
					"selected" : "selected"
				});
			} else if (seMenuKind == "course") {
				$("#course").attr({
					"selected" : "selected"
				});
			} else if (seMenuKind == "wine") {
				$("#wine").attr({
					"selected" : "selected"
				});
			} else if (seMenuKind == "beer") {
				$("#beer").attr({
					"selected" : "selected"
				});
			} else {
				$("#liquor").attr({
					"selected" : "selected"
				});
			}

			$("#menu_img")
				.attr(
					{
						"src" : "/uploadStorage/menu/thumbnail/${selectMenuVo.menu_menufile }"
					});
			$("#menu_no").val("<c:out value='${selectMenuVo.menu_no}' />");
			$("#menu_menufile").val(
				"<c:out value='${selectMenuVo.menu_menufile}' />");
			$("#menuedit").prop("disabled", false);
			$("#menudel").prop("disabled", false);
			$("#menuadd").prop("disabled", true);
		}

		/* 메뉴 선택시 발생 이벤트*/
		$(".menuclick").click(function() {
			var menu_no = $(this).attr("data-num");
			$("#menu_no").val(menu_no);
			$("#menu_form").attr({
				"method" : "get",
				"action" : "/menu/menuclick"
			});
			$("#menu_form").submit();
		});
		/* 메뉴 삭제 */
		$("#menudel").click(function() {

			$("#menu_form").removeAttr("method");
			$("#menu_form").removeAttr("action");
			$("#file").removeAttr("name");
			$("#menu_form").attr({
				"method" : "GET",
				"action" : "/menu/menuDelete"
			});
			$("#menu_form").submit();
		});

		/* 메뉴 수정 */
		$("#menuedit").click(function() {
			//입력값체크
			if (!chkSubmit($('#menu_name'), "수정할 메뉴명을")) {
				return;
			} else if (!chkNumber($('#menu_price'), "수정할 가격을")) {
				return;
			} else if (!chkSubmit($('#menu_text'), "수정할 설명을")) {
				return;
			} else if (!chkSubmit($('#menu_kind'), "수정할 종류를")) {
				return;
			} else {
				$("#menu_form").removeAttr("method");
				$("#menu_form").removeAttr("action");
				$("#menu_form").attr({
					"method" : "POST",
					"action" : "/menu/menuEdit"
				});
				$("#menu_form").submit();
			}
		});

	});
	/* 선택 이미지 출력 */
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능.");
				return;
			}
			sel_file = f;
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#menu_img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<!-- ------------------------------- -->
<!-- 메뉴 검색기능 -->
<script type="text/javascript">

	$(function() {
		let alldiv = document.getElementById("alldiv");
		let steakdiv = document.getElementById("steakdiv");
		let pastadiv = document.getElementById("pastadiv");
		let salladdiv = document.getElementById("salladdiv");
		let coursediv = document.getElementById("coursediv");
		let winediv = document.getElementById("winediv");
		let beerdiv = document.getElementById("beerdiv");
		let liquordiv = document.getElementById("liquordiv");
		$("#menuAll").click(function() {
			alldiv.classList.remove("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
		});
		$("#menuSteak").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.remove("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
		});
		$("#menuPasta").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.remove("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
		});

		$("#menuSallad").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.remove("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
		});
		$("#menuCourse").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.remove("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
		});
		$("#menuWine").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.remove("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
		});
		$("#menuBeer").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.remove("hide");
			liquordiv.classList.add("hide");
		});
		$("#menuLiquor").click(function() {
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.remove("hide");
		});
	});
</script>
<!-- CSS -->
<style type="text/css">
.list {
	list-style-type: none;
	margin: 1;
	padding: 1;
	overflow: hidden;
	background-color: #333;
}

 .menulist {
	width: 100px;
	height: 500px;
} 
li {
	float: left;
	border-right: 1px solid #bbb;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.all {
	background-color: #4CAF50;
}

.menuset {
	width: 160px;
	padding: 0px;
}
/* 전체 메뉴 버튼 색 */ /* 주석 풀고 사용할것 */
 li a gallery :hover :not(.active){background-color:#111;} 
.active {
	background-color: #4CAF50;
}
/* 전체 메뉴 버튼 색  끝*/
#head {
	background-color: white;
	padding: 14px 16px;
	color: black;
}

#menusetting {
	border: 1px solid #FFBB00;
	width: auto;
	top: 10px;
	left: auto;
	overflow: hidden;
}

#menulist {
	margin: 5px;
	width: auto;
	float: left;
	padding: 10px;
	width: auto;
}

#menuset {
	border: 1px solid #487BE1;
	width: 200px;
	float: right;
	padding: 10px;
	margin-left: 10px;
}

#menubt {
	float: right;
	margin: 10px;
	height: auto;
}

#menu {
	border: 1px solid red;
	box-shadow: 1px;
	margin: 10px;
	margin-right: 20px;
	height: auto;
}

#menusetting {
	float: right;
}

#tablelist {
	float: center;
	max-width: 1000px;
	
	padding-right: 270px;
}

.hr {
	clear: both;
}
</style>
</head>
<body>
	<ul class="list">
		<!-- 메뉴 목록 -->
		<li class="active"><a href="#" class="menu" id="menuAll">전체</a></li>
		<li class=""><a href="#" class="menu" id="menuSteak">스테이크</a></li>
		<li class=""><a href="#" class="menu" id="menuPasta">파스타</a></li>
		<li class=""><a href="#" class="menu" id="menuSallad">샐러드</a></li>
		<li class=""><a href="#" class="menu" id="menuCourse">코스요리</a></li>
		<li class=""><a href="#" class="menu" id="menuWine">와인</a></li>
		<li class=""><a href="#" class="menu" id="menuBeer">맥주</a></li>
		<li class=""><a href="#" class="menu" id="menuLiquor">양주</a></li>
	</ul>

	<div id="menusetting">
		<!-- 데이터 입력 -->
		<form id="menu_form" enctype="multipart/form-data">
			<div id="menuset">
				<div class="img_wrap">
					<!-- 이미지추가 시 출력되는 이미지 -->
					<img id="menu_img" width="150" height="150">
				</div>
				<input type="hidden" id="menu_no" name="menu_no"> <input
					type="hidden" id="menu_menufile" name="menu_menufile"> <input
					type="text" placeholder="메뉴이름" name="menu_name" id="menu_name"
					class="menuset"> <input type="text" placeholder="메뉴가격"
					name="menu_price" id="menu_price" class="menuset" class="menuset">
				<input type="file" name="file" id="file" placeholder="이미지추가"
					class="menuset">
				<textarea name="menu_text" id="menu_text" placeholder="메뉴설명"
					class="menuset"></textarea>
				<select name="menu_kind" id="menu_kind" class="menuset">
					<option id="noSelected" value="">메뉴종류</option>
					<option value="steak" id="steak">스테이크</option>
					<option value="pasta" id="pasta">파스타</option>
					<option value="sallad" id="sallad">샐러드</option>
					<option value="course" id="course">코스요리</option>
					<option value="wine" id="wine">와인</option>
					<option value="beer" id="beer">맥주</option>
					<option value="liquor" id="liquor">양주</option>
				</select>
			</div>
		</form>

		<!-- 추가 수정 삭제 초기화 버튼 -->
		<div id="menubt">
			<input type="button" id="menuadd" value="추가"> <input
				type="button" id="menuedit" value="수정"> <input type="button"
				id="menudel" value="삭제"> <input type="button" id="menureset"
				onclick="menureset();" value="초기화">
		</div>
	</div>

	<!-- 메뉴 리스트 출력 -->
	<div class="panel-group" id="tablelist" role="tablist"
		aria-multiselectable="true">
		<!-- 데이터 출력 -->
		<div id="alldiv" class="abc">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<img class="menuclick" alt="메뉴 이미지"
							src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
							data-num="${menu.menu_no}">
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="steakdiv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'steak'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="pastadiv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'pasta'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="salladdiv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'sallad'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="coursediv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'course'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="winediv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'wine'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="beerdiv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<c:if test="${menu.menu_kind == 'beer'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="liquordiv" class="abc hide">
			<c:choose>
				<c:when test="${not empty menulist}">
					<c:forEach var="menu" items="${menulist}" varStatus="status">
						<!-- 검색 조건 양주 -->
						<c:if test="${menu.menu_kind == 'liquor'}">
							<img class="menuclick" alt="메뉴 이미지"
								src="/uploadStorage/menu/thumbnail/${menu.menu_menufile}"
								data-num="${menu.menu_no}">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="hr"></div>
	<div class="hr"></div>
	<!-- 페이징 -->
	<%-- <div id="boardPage">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div> --%>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>