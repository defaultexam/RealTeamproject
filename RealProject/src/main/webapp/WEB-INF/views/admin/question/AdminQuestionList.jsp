<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 관리</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript">
	$(function() {

		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var tab3 = document.getElementById("tab3");
		var tab4 = document.getElementById("tab4");
		var tab5 = document.getElementById("tab5");

		// 탭 상태 화면 표시 설정
		// sessionStorage에서 저장된 데이터 가져옴.
		if (sessionStorage.getItem("tab") == '미답변') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
			tab5.classList.add("active")
		} else if (sessionStorage.getItem("tab") == '레스토랑예약') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.add("active")
			tab5.classList.remove("active");
		} else if (sessionStorage.getItem("tab") == '홈페이지이용') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.add("active");
			tab4.classList.remove("active");
			tab5.classList.remove("active");
		} else if (sessionStorage.getItem("tab") == '레스토랑이용') {
			tab1.classList.remove("active");
			tab2.classList.add("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
			tab5.classList.remove("active");
		}

		// 선택 탭 유지하기 위한 설정
		if ("<c:out value='${data.question_type}'/>" != "") {
			$("#question_type").val("<c:out value = '${data.question_type}'/>");
		}

		/* 		if ("<c:out value='${data.question_process}'/>" != "") {
		 $("#question_process").val(
		 "<c:out value = '${data.question_process}'/>");
		 } */

		// 탭 클릭 시 이벤트
		$("#전체").click(function() {
			$("#question_type").removeAttr("value");
			$("#question_process").removeAttr("value");
			sessionStorage.removeItem("tab");
			goPage(1);

		});

		$("#레스토랑이용").click(function() {
			$("#question_type").attr({
				"value" : "레스토랑이용"
			})
			$("#question_process").removeAttr("value");
			sessionStorage.removeItem("tab", '레스토랑이용');

			goPage(1);

		});

		$("#레스토랑예약").click(function() {
			$("#question_type").attr({
				"value" : "레스토랑예약"
			})
			$("#question_process").removeAttr("value");
			sessionStorage.removeItem("tab", '레스토랑예약');
			goPage(1);

		});

		$("#홈페이지이용").click(function() {
			$("#question_type").attr({
				"value" : "홈페이지이용"
			})
			$("#question_process").removeAttr("value");
			sessionStorage.removeItem("tab", '홈페이지이용');
			goPage(1);

		});

		$("#미답변").click(function() {
			$("#question_process").attr({
				"value" : "대기중"
			})
			$("#question_type").removeAttr("value");
			sessionStorage.removeItem("tab", '미답변');
			goPage(1);

		});

		// 한페이지에 보여줄 레코드수 조회 후 선택한 값 그대로 유지하기 위한 설정
		if ("<c:out value='${data.pageSize}' />" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}' />");
		}

		// 검색 후 검색대상과 검색 단어 출력
		var word = "<c:out value = '${data.keyword}'/>";
		var value = "";

		if (word != "") {
			$("#keyword").val("<c:out value = '${data.keyword}'/>");
			$("#search").val("<c:out value = '${data.search}'/>");

			if ($("#search").val() != 'question_text') {

				//:contains()는 특정 텍스트를 포함한 요소반환   
				if ($("#search").val() == 'question_title')
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

		/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
		$(".goDetail").click(function() {

			var question_no = $(this).attr("data-num");
			$("#question_no").val(question_no);
			console.log("글번호 : " + question_no);

			//상세 페이지로 이동하기 위해 form추가   
			$("#questionDetail").attr({
				"method" : "get",
				"action" : "/adminQuestion/adminQuestionDetail.do"
			});
			$("#questionDetail").submit();
		});
	});

	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수 */
	function goPage(page) {
		$("#page").val(page);

		$("#q_search").attr({
			"method" : "get",
			"action" : "/adminQuestion"
		});
		$("#q_search").submit();
	}
</script>
<style type="text/css">
#questionTable {
	width: 1750px;
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="questionTable">
		<h2>1:1 문의 관리</h2>
		<hr>
		<div>
			<!-- 상세 페이지 이동을 위한 Form -->
			<form name="questionDetail" id="questionDetail">
				<input type="hidden" name="question_no" id="question_no">
			</form>

			<%-- <form id="pageForm">
				<input type="hidden" name="member_no" value="${data.member_no}">
				<input type="hidden" id="pageForm" name="page" value="${data.page }" />
				<input type="hidden" id="question_type" name="question_type"
					value="${question.question_type }" /> <input type="hidden"
					id="question_title" name="question_title"
					value="${question.question_title }" /> <input type="hidden"
					id="question_date" name="question_date"
					value="${question.question_date }" /> <input type="hidden"
					id="question_process" name="question_process"
					value="${question.question_process}" />
			</form> --%>

			<!-- 검색 기능 -->
			<div id="questionSearch">
				<form name="q_search" id="q_search">
					<input type="hidden" id="page" name="page" value="${data.page}" />
					<input type="hidden" id="order_by" name="order_by"
						value="${data.order_by}" /> <input type="hidden" id="order_sc"
						name="order_sc" value="${data.order_sc}" /> <input type="hidden"
						name="question_type" id="question_type" /><input type="hidden"
						name="question_process" id="question_process">
				</form>
			</div>
			<div>
				<center>
					<ul class="nav nav-tabs">
						<li class="active" id="tab1"><a id="전체">전체</a></li>
						<li class="" id="tab2"><a id="레스토랑이용">레스토랑 이용</a></li>
						<li class="" id="tab3"><a id="레스토랑예약">레스토랑 예약</a></li>
						<li class="" id="tab4"><a id="홈페이지이용">홈페이지 이용</a></li>
						<li class="" id="tab5"><a id="미답변">미답변</a></li>
					</ul>

					<!-- 문의 리스트 -->
					<div id="questionList">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th class="tac">No.</th>
									<th class="tac">유형</th>
									<th class="tac">제목</th>
									<th class="tac">등록일</th>
									<th class="tac">상태</th>
								</tr>
							</thead>
							<tbody id="list" board="1">
								<!-- 목록 출력 -->
								<c:choose>
									<c:when test="${not empty questionList}">
										<c:forEach var="question" items="${questionList}"
											varStatus="status">
											<tr class="goDetail tac" data-num="${question.question_no}">
												<td>${count - status.index}</td>
												<td>${question.question_type}</td>
												<td class="tal">${question.question_title}</td>
												<td>${question.question_date}</td>
												<td>${question.question_process}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5" class="tac">등록된 문의가 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</center>
			</div>
		</div>
		<!-- 페이징 처리 -->
		<div id="questionPage">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize}">
			</tag:paging>
		</div>
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>