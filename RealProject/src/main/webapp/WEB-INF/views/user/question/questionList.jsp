<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1문의</title>

<style type="text/css">
.answer {
	float: right;
}

.clear {
	clear: both;
}

.question {
	float: left;
}
</style>

<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/js/lightbox.min.js"></script>

<script type="text/javascript">
	$(function() {

		// 첨부파일 이미지 보여주기 위한 속성 추가
		var file = "<c:out value='${question.question_file}'/>";
		if (file != "")
			$("#q_img").attr({
				src : "uploadStorage/question/${question.question_file}",
				width : "200px",
				height : "200px"
			});

		$(".goDetail").click(function() {

			var question_no = $(this).parents("tr").attr("data-num");
			$("#question_no").val(question_no);
			console.log("글번호 : " + question_no);

			// 나의 1:1문의 상세페이지로 이동하기 위한 form
			$("#questionDetail").attr({
				"method" : "get",
				"action" : "question/questionDetail.do"
			});
			$("#questionDetail").sumbit();
		});

		// 문의하기 버튼 클릭 시
		$("#questionInsertBtn").click(function() {
			location.href = "/question";
		});

		/* 로그인 확인 후 비로그인시 로그인페이지로*/
		$("#questionLoginBtn").click(function() {
			location.href = "/login";
		});

	});
	function goPage(page) {
		$("#page").val(page);
		$("#pageForm").attr({
			"method" : "get",
			"action" : "/question/questionList.do"
		});
		$("#pageForm").submit();
	}

	// 리스트 요청 처리
	function listData() {
		$("#accordion").html("");
		$.getJSON("")
	}
</script>


</head>

<body>
	<div class="contentContainer">
		<h2>1:1 문의</h2>
		<hr>

		<!-- 상세페이지로 이동하기 위한 form -->
		<form id="detailForm" name="detailForm">
			<input type="hidden" name="member_no" id="member_no"><input
				type="hidden" name="page" value="${data.page}"> <input
				type="hidden" name="pageSize" value="${data.pageSize}">
		</form>

		<form id="pageForm">
			<input type="hidden" name="member_no" value="${data.member_no}">
			<input type="hidden" id="page" name="page" value="${data.page }" />
			<input type="hidden" id="pageSize" name="pageSize"
				value="${data.pageSize }" />
		</form>

		<div class="contentBtn" style="text-align: right;">
			<input type="button" value="문의하기" class="btn btn-default"
				id="questionInsertBtn" />
		</div>
		<table border="1" width="100%">
			<thead>
				<tr style="width: 100%;">
					<th class="q_th" style="width: 20%; text-align: center;">No.</th>
					<th class="q_th" style="width: 20%; text-align: center;">문의유형</th>
					<th class="q_th" style="width: 20%; text-align: center;">제목</th>
					<th class="q_th" style="width: 20%; text-align: center;">등록일</th>
					<th class="q_th" style="width: 20%; text-align: center;">답변상태</th>
				</tr>
			</thead>
		</table>

		<%-- <c:choose>
						<c:when test="${not empty questionList}">
							<c:forEach var="question" items="${questionList}"
								varStatus="status">
								<tr class="tac" data-num="${question.question_no}">
									<td>${count - status.index}</td>
									<td>${question.question_type}</td>
									<td class="goDetail tal">${question.question_title}</td>
									<td>${question.question_date}</td>
									<td>${question.question_process}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac">등록된 공지사항이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose> --%>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="false">
			<c:choose>
				<c:when test="${not empty questionList}">
					<c:forEach var="question" items="${questionList}"
						varStatus="status">

						<!-- panel -->
						<div class="panel panel-default">
							<!-- panel_heading -->
							<div class="panel-heading" role="tab" id="heading${status.index}">
								<!-- panel_title -->
								<h4 class="panel-title">
									<!-- title -->
									<label id="test" data-toggle="collapse"
										data-parent="#accordion" style="width: 100%;"
										href="#collapse${status.index}"
										aria-controls="collapse${status.index}" aria-expanded="true">

										<div
											style="width: 19%; display: inline-block; text-align: center;">${count - status.index}</div>
										<div
											style="width: 20%; display: inline-block; text-align: center;">${question.question_type}</div>
										<div class=".goDetail"
											style="width: 20%; display: inline-block; text-align: center;">${question.question_title}</div>
										<div
											style="width: 20%; display: inline-block; text-align: center;">${question.question_date}</div>
										<div
											style="width: 19%; display: inline-block; text-align: center;">${question.question_process}</div>
									</label>
								</h4>
							</div>


							<!-- panel_body -->
							<div class="panel-collapse collapse" id="collapse${status.index}"
								role="tabpanel" aria-labelledby="heading${status.index}">
								<!-- body -->
								<div class="panel-body">
									<div class="col-md-2">
										<img alt=""
											src="/uploadStorage/question/${question.question_file}"
											id="q_img" class="img-thumbnail"
											style="widows: 200px; height: 200px;" />
									</div>

									<div class="question" style="float: left">
										<textarea rows="8" cols="70" id="question_text"
											readonly="readonly">${question.question_text}</textarea>
									</div>
									<div class="clear"></div>
									<c:if
										test="${question.answer_text != null and question.answer_text != ''}">
										<div class="answer">
											<textarea rows="8" cols="70" id="answer_text"
												readonly="readonly">${question.answer_text}</textarea>
										</div>
										<div class="col-md-2" style="float: right">

											<img alt=""
												src="/uploadStorage/question/${question.answer_file}"
												id="a_img" class="img-thumbnail"
												style="widows: 200px; height: 200px;">
										</div>
									</c:if>
									<c:if
										test="${question.answer_text == null or question.answer_text == ''}">
										<div class="noAnswer">
											<center>
												<h4>고객님의 문의 답변이 미완료 상태로 나중에 다시 확인해 주세요.</h4>
											</center>
										</div>
									</c:if>
								</div>
							</div>
						</div>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" class="tac">등록된 공지사항이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- 페이징 처리 -->
		<center>
			<div id="questionPage">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize }">
				</tag:paging>
			</div>
		</center>
</body>
</html>
<%-- </c:if> --%>

<%-- <c:if test="${login.id == null or login.id == ''}"> --%>
<!-- <div class="container">
				<br> <font style="text-decoration: underline">1:1 문의는
					회원만 이용할 수 있는 서비스입니다.</font><br> 로그인 후 이용하여 주세요<br> <br> <input
					type="button" value="로그인 페이지로 이동하기" class="btn btn-default"
					id="questionLoginBtn">
			</div> -->
<%-- </c:if> --%>
<%-- 		<!-- 문의 리스트 -->
		<div id="questionList">
			<table border="1">
				<thead>
					<tr>
						<th class="tac">No.</th>
						<th class="tac">유형</th>
						<th class="tac">제목</th>
						<th class="tac">등록일</th>
						<th class="tac">상태</th>
					</tr>
				</thead>
				<tbody id="list" border="1">
					<!-- 목록 출력 -->
					<c:choose>
						<c:when test="${not empty questionList}">
							<c:forEach var="question" items="${questionList}"
								varStatus="status">
								<tr class="tac" data-num="${question.question_no}">
									<td>${count - status.index}</td>
									<td>${question.question_type}</td>
									<td class="goDetail tal">${question.question_title}</td>
									<td>${question.question_date}</td>
									<td>${question.question_process}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="tac">등록된 공지사항이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div> --%>