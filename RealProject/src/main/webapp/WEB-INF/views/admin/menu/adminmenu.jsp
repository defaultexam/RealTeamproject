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
<!-- CSS -->
<style type="text/css">
.menuset {
	width: 400px;
	padding: 0px;
}

.container-fluid {
	width: 90%;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<ul class="nav nav-tabs">
			<!-- 메뉴 목록 -->
			<li class="active"><a href="#" class="menu" id="menuAll"
				onclick="divChange('all');tabChange('All');">전체</a></li>
			<li class=""><a href="#" class="menu" id="menuSteak"
				onclick="divChange('steak');tabChange('Steak');">스테이크</a></li>
			<li class=""><a href="#" class="menu" id="menuPasta"
				onclick="divChange('pasta');tabChange('Pasta');">파스타</a></li>
			<li class=""><a href="#" class="menu" id="menuSallad"
				onclick="divChange('sallad');tabChange('Sallad');">샐러드</a></li>
			<li class=""><a href="#" class="menu" id="menuCourse"
				onclick="divChange('course');tabChange('Course');">코스요리</a></li>
			<li class=""><a href="#" class="menu" id="menuWine"
				onclick="divChange('wine');tabChange('Wine');">와인</a></li>
			<li class=""><a href="#" class="menu" id="menuBeer"
				onclick="divChange('beer');tabChange('Beer');">맥주</a></li>
			<li class=""><a href="#" class="menu" id="menuLiquor"
				onclick="divChange('liquor');tabChange('Liquor');">양주</a></li>
		</ul>

		<!-- 메뉴 리스트 출력 -->
		<div class="panel-group" id="tablelist" role="tablist"
			aria-multiselectable="true"
			style="float: left; width: 74.5%; border: 1px solid #bbb;">
			<!-- 데이터 출력 -->
			<div id="alldiv" class="abc">
				<c:choose>
					<c:when test="${not empty menulist}">
						<c:forEach var="menu" items="${menulist}" varStatus="status">
							<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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
								<img class="menuclick" alt="메뉴 이미지" align="left"
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

		<div id="menusetting"
			style="float: right; width: 25%; border: 1px solid #bbb;">
			<!-- 데이터 입력 -->
			<form id="menu_form" enctype="multipart/form-data">
				<div id="menuset">
					<div style="width: auto; height: auto;">
						<!-- 이미지추가 시 출력되는 이미지 -->
						<img id="menu_img" width="auto" height="250px">
					</div>
					<br /> <input type="hidden" id="menu_no" name="menu_no"> <input
						type="hidden" id="menu_menufile" name="menu_menufile"> <input
						type="text" placeholder="메뉴이름" name="menu_name" id="menu_name"
						class="menuset form-control"> <input type="text"
						placeholder="메뉴가격" name="menu_price" id="menu_price"
						class="menuset form-control"> <input type="file"
						name="file" id="file" placeholder="이미지추가"
						class="menuset form-control" accept=".jpg, .png, .jpeg">
					<textarea name="menu_text" id="menu_text" placeholder="메뉴설명"
						class="menuset form-control"></textarea>
					<select name="menu_kind" id="menu_kind"
						class="menuset form-control">
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
				<input type="button" id="menuadd" class="btn btn-default" value="추가">
				<input type="button" id="menuedit" class="btn btn-default"
					value="수정"> <input type="button" id="menudel"
					class="btn btn-default" value="삭제"> <input type="button"
					id="menureset" class="btn btn-default" value="초기화">
			</form>
		</div>
	</div>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var sel_file;
		/* 초기화 버튼 */

		$(function() {
			$("#menureset").click(function() {
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
		});
		function tabChange(selected) {
			$(".menu").parents("li").removeClass("active");
			$("#menu" + selected).parents("li").addClass("active");
		}

		function divChange(selected) {
			let change = document.getElementById(selected + "div");
			alldiv.classList.add("hide");
			steakdiv.classList.add("hide");
			pastadiv.classList.add("hide");
			salladdiv.classList.add("hide");
			coursediv.classList.add("hide");
			winediv.classList.add("hide");
			beerdiv.classList.add("hide");
			liquordiv.classList.add("hide");
			change.classList.remove("hide");
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
					$('#file').val("");
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

			/* 메뉴 선택시 발생 이벤트*/
			$(".menuclick")
					.click(
							function() {
								var menu_no = $(this).attr("data-num");
								var result = {};
								$("#menu_no").val(menu_no);
								$
										.ajax({
											url : "/menu/menuclick",
											type : "get",
											dataType : "json",
											data : {
												"menu_no" : menu_no
											},
											error : function() {
												alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해 주세요");
											},
											success : function(data) {
												result = data;
												$("#menuedit").prop("disabled",
														false);
												$("#menudel").prop("disabled",
														false);
												$("#menuadd").prop("disabled",
														true);
												$("#menu_no").val(
														result.menu_no);
												$("#menu_menufile").val(
														result.menu_menufile);
												$("#menu_name").val(
														result.menu_name);
												$("#menu_price").val(
														result.menu_price);
												$("#menu_text").val(
														result.menu_text);
												$("#menu_img")
														.attr(
																{
																	"src" : "/uploadStorage/menu/thumbnail/"
																			+ result.menu_menufile
																});

												var seMenuKind = result.menu_kind;
												console.log(seMenuKind);
												$("option").removeAttr(
														"selected");
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
											}
										});
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
				} else {
					sel_file = f;
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#menu_img").attr("src", e.target.result);
					}
					reader.readAsDataURL(f);
				}

			});
		}
	</script>
</body>
</html>