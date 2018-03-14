<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
#memberTable {
	width: 1750px;
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
}
</style>
<%
	Date today = new Date();
%>
<script type="text/javascript">
	$(function() {

		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var tab3 = document.getElementById("tab3");
		var tab4 = document.getElementById("tab4");
		// 탭 상태 화면 표시 설정
		if (sessionStorage.getItem("tab") == '탈퇴') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.add("active");
		} else if (sessionStorage.getItem("tab") == '일반') {
			tab1.classList.remove("active");
			tab2.classList.add("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
		} else if (sessionStorage.getItem("tab") == 'VIP') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.add("active");
			tab4.classList.remove("active");
		}
		// 이름클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".memberInfo").click(function() {
			var m_no = $(this).attr("data-num");
			$("#member_no").val(m_no);
			// 상세 페이지로 이동하기위한 form에 액션과 전송방식 추가
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/adminMember/memberInfo.do"
			});
			$("#detailForm").submit();
		});

		/* 한페이지에 보여줄 레코드수 조회후 선택한 값 그대로 유지 하기 위한 설정 */
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		// 검색조건이 존재할때 입력값 유지하기 위한 설정
		var preSearchBirth = "<c:out value='${data.birthday}' />";

		if (preSearchBirth.match("9999") != "9999") {
			$("#birthday").val("<c:out value='${data.birthday}' />");
			//$("#infoBirthday").val("<c:out value='${data.birthday}' />");
		} else {

		}

		var preSearchWedding = "<c:out value='${data.weddingdate}' />";

		if (preSearchWedding.match("9999") != "9999") {
			$("#weddingdate").val("<c:out value='${data.weddingdate}' />");
			//$("#infoWeddingdate").val("<c:out value='${data.weddingdate}' />");
		} else {

		}

		if ("<c:out value='${data.name}' />" != "") {
			$("#name").val("<c:out value='${data.name}' />");
			//$("#infoName").val("<c:out value='${data.name}' />");
		}

		if ("<c:out value='${data.phone}' />" != "") {
			$("#phone").val("<c:out value='${data.phone}' />");
			//$("#infoPhone").val("<c:out value='${data.phone}' />");
		}

		// 선택 탭 유지하기 위한 설정
		if ("<c:out value='${data.rank}' />" != "") {
			$("#rank").val("<c:out value='${data.rank}' />");
			//$("#infoRank").val("<c:out value='${data.rank}' />");
		}
		if ("<c:out value='${data.condition}' />" != "") {
			$("#condition").val("<c:out value='${data.condition}' />");
			//$("#infoCondition").val("<c:out value='${data.condition}' />");
		}

		// 조회버튼 클릭시 발생 이벤트
		$("#memberSearch").click(function() {
			goPage(1);
		});

		// 전체보기 버튼 클릭시 발생 이벤트
		$("#memberSearchTotal").click(function() {
			$("#name").val("");
			$("#phone").val("");
			$("#weddingdate").val("9999-12-31");
			$("#birthday").val("9999-12-31");
			$("#rank").removeAttr("value");
			$("#condition").removeAttr("value");
			sessionStorage.removeItem("tab");
			goPage(1);
		});

		// 한페이지에 보여줄 갯수 변경될때 처리 이벤트
		$("#pageSize").change(function() {
			goPage(1);
		});

		// 탭클릭시 이벤트
		$("#전체").click(function() {
			$("#rank").removeAttr("value");
			$("#condition").removeAttr("value");
			sessionStorage.removeItem("tab");
			goPage(1);
		});
		$("#일반").click(function() {
			$("#rank").attr({
				"value" : "일반"
			});
			$("#condition").removeAttr("value");
			sessionStorage.setItem("tab", '일반');
			goPage(1);
		});
		$("#VIP").click(function() {
			$("#rank").attr({
				"value" : "VIP"
			});
			$("#condition").removeAttr("value");
			sessionStorage.setItem("tab", 'VIP');
			goPage(1);
		});
		$("#탈퇴").click(function() {
			$("#condition").attr({
				"value" : "탈퇴"
			});
			$("#rank").removeAttr("value");
			sessionStorage.setItem("tab", '탈퇴');
			goPage(1);
		});

		/* 엑셀다운로드 버튼 클릭 시 처리 이벤트 */
		$("#excelMemberList").click(
				function() {
					if ($("#birthday").val() == ""
							|| $("#birthday").val() == null)
						$("#birthday").removeAttr("name");
					if ($("#weddingdate").val() == ""
							|| $("#weddingdate").val() == null)
						$("#weddingdate").removeAttr("name");
					$("#page").val(page);
					$("#f_search").attr({
						"method" : "get",
						"action" : "/adminMember/memberExcel"
					});
					$("#f_search").submit();
				});
	});

	function goPage(page) {
		if ($("#birthday").val() == "" || $("#birthday").val() == null)
			$("#birthday").val("9999-12-31");
		if ($("#weddingdate").val() == "" || $("#weddingdate").val() == null)
			$("#weddingdate").val("9999-12-31");
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/adminMember/list.do"
		});
		$("#f_search").submit();
	}
</script>
<style type="text/css">
#span {
	float: right;
}
</style>
</head>
<body>
	<div id="memberTable">
		<div>
			<h3>회원관리(기본 정보 조회)</h3>
			<p id="span">* 회원 클릭 시 정보상세보기 및 수정페이지로 이동합니다.</p>
			<hr>
		</div>
		<!-- ============== 상세 페이지 이동을 위한 form =========== -->
		<form name="datailForm" id="detailForm">
			<input type="hidden" name="member_no" id="member_no"> <input
				type="hidden" name="page" value="${data.page }"> <input
				type="hidden" name="pageSize" value="${data.pageSize }">
		</form>

		<%-- ================ 검색기능 시작 =============== --%>
		<form id="f_search">
			<div id="boardSearch">
				<input type="hidden" id="page" name="page" value="${data.page }" />
				<input type="hidden" id="order_by" name="order_by"
					value="${data.order_by}" /> <input type="hidden" id="order_sc"
					name="order_sc" value="${data.order_sc}" /> <input type="hidden"
					name="rank" id="rank"><input type="hidden" name="condition"
					id="condition">

				<table summary="검색" style="width: 800px;">
					<colgroup>
						<col width="25%"></col>
						<col width="30%"></col>
						<col width="10%"></col>
						<col width="10%"></col>
						<col width="25%"></col>
					</colgroup>
					<tr>
						<td align="right"><label>생일 :&nbsp;</label></td>
						<td align="center"><input type="date" id="birthday"
							name="birthday" class="form-control" style="width: 200px;"></td>
						<td rowspan="4" align="center"><input type="button"
							value="조회" id="memberSearch" class="btn btn-default"></td>
						<td rowspan="4" align="center"><input type="button"
							value="전체보기" id="memberSearchTotal" class="btn btn-default"></td>
						<td rowspan="4"></td>

					</tr>
					<tr>
						<td align="right"><label>결혼기념일 :&nbsp;</label></td>
						<td align="center"><input type="date" id="weddingdate"
							name="weddingdate" class="form-control" style="width: 200px;">
						</td>
					</tr>

					<tr>
						<td align="right"><label>이름 :&nbsp;</label></td>
						<td align="center"><input type="text" id="name" name="name"
							class="form-control" style="width: 200px;"></td>
					</tr>

					<tr>
						<td align="right"><label>전화번호 뒷자리 :&nbsp;</label></td>
						<td align="center"><input type="text" id="phone" name="phone"
							class="form-control" style="width: 200px;"></td>
					</tr>
				</table>
			</div>
			<div style="padding-left: 79%;">
				<table>
					<tr>
						<td><select id="pageSize" name="pageSize"
							class="form-control">
								<option value="10">10개씩 보기</option>
								<option value="30">30개씩 보기</option>
								<option value="50">50개씩 보기</option>
						</select></td>
						<td>&nbsp;</td>
						<td>
							<button type="button" id="excelMemberList"
								class="btn btn-default">Excel문서화</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<%-- ================ 검색기능 종료 =============== --%>
		<div>
			<ul class="nav nav-tabs">
				<li class="active" id="tab1"><a id="전체">전체</a></li>
				<li class="" id="tab2"><a id="일반">일반회원</a></li>
				<li class="" id="tab3"><a id="VIP">VIP회원</a></li>
				<li class="" id="tab4"><a id="탈퇴">탈퇴회원</a></li>
			</ul>
			<div id="table-result">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th class="tac">no</th>
							<th class="tac">회원번호</th>
							<th class="tac">회원상태</th>
							<th class="tac">회원등급</th>
							<th class="tac">아이디</th>
							<th class="tac">이름</th>
							<th class="tac">성별</th>
							<th class="tac">생년월일</th>
							<th class="tac">결혼기념일</th>
							<th class="tac">이메일</th>
							<th class="tac">전화번호</th>
						</tr>
					</thead>
					<tbody>
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty memberList}">
								<c:forEach var="member" items="${memberList}" varStatus="status">
									<tr data-num="${member.member_no}" class="memberInfo">
										<td>${count - status.index}</td>
										<td>${member.member_no}</td>
										<td>${member.condition}</td>
										<td>${member.rank}</td>
										<td>${member.id}</td>
										<td>${member.name}</td>
										<td><c:set value="${member.gender }" var="gender"></c:set>
											<c:choose>
												<c:when test="${gender == '1'}">
										남성</c:when>
												<c:otherwise>여성</c:otherwise>
											</c:choose></td>
										<td>${member.birthday}</td>
										<td><c:set value="${member.weddingdate}" var="wedding" />
											<c:choose>
												<c:when
													test="${wedding.toString().substring(0,5).contains('9999')}">
										 없음 </c:when>
												<c:otherwise>
										${member.weddingdate}
										</c:otherwise>
											</c:choose></td>
										<td>${member.email}</td>
										<td>${member.phone}</td>
									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="11" class="tac">등록된 회원이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>

		<%-- ============= 페이지 네비게이션 시작 ============ --%>
		<div id="boardPage" class="">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize }" />
		</div>
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>