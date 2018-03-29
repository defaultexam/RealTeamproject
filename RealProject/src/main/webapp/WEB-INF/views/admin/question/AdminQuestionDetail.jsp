<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의 답변</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		// 첨부파일 이미지 보여주기 위한 속성
		var file = "<c:out value= '${detail.question_file}'/>";
		if (file != "") {
			$("#q_img").attr({
				src : "/uploadStorage/question/${detail.question_file}",
				width : "200px",
				height : "200px"
			});
			$("#a_img").attr({
				src : "uploadStorage/question/${detail.answer_file}",
				width : "200px",
				height : "200px"
			});
		}

		// 관리자 답변 작성 중 목록으로 클릭 시  
		$("#answerNoBtn").click(function() {
			location.href = "/adminQuestion";
			alert("작성 중인 답변이 취소됩니다.");
		});

		// 답변이 이미 완료된 상태에서 목록으로
		$("#qListGoBtn").click(function() {
			location.href = "/adminQuestion";
		});

		$("#answerOkBtn").click(function() {
			// 입력값 체크
			if (!chkSubmit($('#answer_text'), "관리자 답변을"))
				return;
			else {
				if (($("#answer_file").val() != "")) {
					if (!chkFile($('#answer_file')))
						return;
				}
				$("#q_data").attr({
					"method" : "POST",
					"action" : "/adminQuestion/adminQuestionUpdate.do"
				});

				$("#q_data").submit();
				alert("답변이 완료되었습니다.");
			}
		});
	})
</script>
<style type="text/css">
.contentContainer {
	width: 1000px;
	height: auto;
	margin-bottom: 50px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h2>1:1 문의 관리</h2>
			<hr>
			<div class="contentTB">
				<!-- 상세보기 -->
				<form id="q_data" name="q_data" enctype="multipart/form-data">
					<input type="hidden" id="question_no" name="question_no"
						value="${detail.question_no}" /> <input type="hidden" name="page"
						id="page" value="${param.page}">

					<table id="questionUpdate" class="table table-bordered table-hover">
						<tr>
							<td class="ac">회원 이름</td>
							<td><input type="text" id="name" value="${mvo.name}"
								readonly="readonly"><input type="hidden"
								value="${mvo.member_no}" name="member_no"></td>
						</tr>
						<tr>
							<td class="ac">연락처</td>
							<td><input type="text" id="phone" value="${mvo.phone}"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td class="ac">문의 제목</td>
							<td><input type="text" id="question_title"
								value="${detail.question_title}" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>문의 내용</td>
							<td><textarea rows="4" cols="40" id="question_text"
									readonly="readonly">${detail.question_text}</textarea></td>
						</tr>
						<c:if test="${detail.question_file != ''}">
							<tr>
								<td>첨부 이미지</td>
								<td><img id="q_img"></td>
							</tr>
						</c:if>
						<c:if
							test="${detail.answer_text != null or detail.answer_text != ''}">
							<tr>
								<td class="ac">관리자 답변</td>
								<td><textarea rows="4" cols="40" name="answer_text"
										id="answer_text">${detail.answer_text}</textarea></td>
							</tr>
						</c:if>
						<%-- <c:if
							test="${detail.anser_text == null and detail.anser_text == ''}">
							<tr>
								<td class="ac">관리자 답변</td>
								<td><textarea rows="4" cols="40" name="answer_text"
										id="answer_text" readonly="readonly" onclick="alert(" 이미
										답변완료되어 더이상 입력할수없습니다.")">${detail.answer_text}</textarea></td>
							</tr>
						</c:if> --%>
						<tr>
							<td class="ac">첨부 이미지</td>
							<td><input type="file" name="file" id="answer_file"
								accept=".jpg, .png, .jpeg"></td>
						</tr>
					</table>
				</form>
			</div>

			<div>
				<div></div>
				<div class="contentBtn">
					<c:if
						test="${detail.answer_text == null or detail.answer_text == ''}">
						<input type="button" value="답변완료" class="btn" id="answerOkBtn">&nbsp;&nbsp;&nbsp;
					<input type="button" value="목록으로" class="btn" id="answerNoBtn">
					</c:if>
					<c:if
						test="${detail.answer_text != null and detail.answer_text != ''}">
						<!-- <input type="button" value="답변완료" class="btn" id="answerOkBtn">&nbsp;&nbsp;&nbsp; -->
						<input type="button" value="목록으로" class="btn" id="qListGoBtn">
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>