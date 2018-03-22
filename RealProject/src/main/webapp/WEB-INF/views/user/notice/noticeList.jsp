<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
#noticeTotalDiv {
	height: auto;
}
</style>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {
		/* search = "<c:out value = '${data.search}'/>";
		keyword = "<c:out value = '${data.keyword}'/>"; */

		/* 검색 후 검색 대상과 검색 단어 출력 */
		var word = "<c:out value='${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value = '${data.keyword}'/>");
			$("#search").val("<c:out value = '${data.search}'/>");

			if ($("#search").val() != 'notice_text') {

				//:contains()는 특정 텍스트를 포함한 요소반환   
				if ($("#search").val() == 'notice_title')
					value = "#list tr td.goDetail";
				$(value + ":contains('" + word + "')").each(
					function() {
						var regex = new RegExp(word, 'gi');
						$(this).html(
							$(this).text().replace(
								regex,
								"<span class='required'>" + word
								+ "</span>"));
					});

			}
		}

		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		/* 검색 버튼 클릭 시 처리 이벤트 */
		$("#searchData").click(function() {
			if ($("#search").val() != "all") {
				if (!chkSubmit($('#keyword'), "검색어를"))
					return;
			}
			goPage(1);
		});

		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {

			var notice_no = $(this).parents("tr").attr("data-num");
			$("#notice_no").val(notice_no);
			console.log("글번호 : " + notice_no);

			//상세 페이지로 이동하기 위해 form추가   
			$("#noticeDetail").attr({
				"method" : "get",
				"action" : "/userNotice/userNoticeDetail.do"
			});
			$("#noticeDetail").submit();
		});
	});

	$(".order").click(function() {
		var order_by = $(this).attr("data-value");
		console.log("선택값 : " + order_by);
		$("#order_by").val(order_by);
		if ($("#order_sc").val() == 'DESC') {
			$("#order_sc").val('ASC');
		} else {
			$("#order_sc").val('DESC');
		}
		goPage(1);
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#n_search").attr({
			"method" : "get",
			"action" : "/userNotice"
		});
		$("#n_search").submit();
	}
</script>

</head>
<body>
	<div class="contentContainer" id="noticeTotalDiv">
		<h3 align="center">공지사항</h3>
		<hr>
		<div>

			<!-- 상세 페이지 이동을 위한 Form -->
			<form name="noticeDetail" id="noticeDetail">
				<input type="hidden" name="notice_no" id="notice_no">
			</form>

			<!-- 검색 기능 -->
			<div id="noticeSearch" style="width: 100%;">
				<form name="n_search" id="n_search">
					<input type="hidden" id="page" name="page" value="1" /> <input
						type="hidden" id="order_by" name="order_by"
						value="${data.order_by}" /> <input type="hidden" id="order_sc"
						name="order_sc" value="${data.order_sc}" />
					<table id="noticeTabel" class="table table-bordered table-hover">
						<!-- 열의 디자인(배경색을 정해줄 수 있음) -->

						<tr class="form-inline">
							<td id="ntd1"><select id="search" name="search"
								class="form-control" style="width: 100px;">
									<option value="all">전체</option>
									<option value="notice_title">제목</option>
									<option value="notice_text">내용</option>
							</select> <input type="text" name="keyword" id="keyword"
								style="width: 250px;" class="form-control"
								placeholder="검색어를 입력하시오." /> <input type="button"
								id="searchData" class="btn btn-default" value="검색" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="noticeList">
				<table class="table table-bordered table-hover">
					<colgroup>
						<col width="15%"></col>
						<col width="60%"></col>
						<col width="25%"></col>
					</colgroup>
					<thead>
						<tr>
							<th class="tac">번호</th>
							<th class="tac">제목</th>
							<th class="tac">작성일</th>
						</tr>
					</thead>
					<tbody id="list">
						<!-- 목록 출력 -->
						<c:choose>
							<c:when test="${not empty noticeList}">
								<c:forEach var="notice" items="${noticeList}" varStatus="status">
									<tr class="tac" data-num="${notice.notice_no}">
										<td>${count - status.index}</td>
										<td class="goDetail tal">${notice.notice_title}</td>
										<td>${notice.notice_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac">등록된 공지사항이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>

			<!-- 페이징 처리 -->
			<div id="noticePage" align="center">
				<tag:paging page="${param.page}" total="${total}" list_size="10">
				</tag:paging>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("body").attr("data-dep1", "4");
		$("body").attr("data-dep2", "0");
	</script>
</body>