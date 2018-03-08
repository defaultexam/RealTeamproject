<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
</head>

<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>

<script type="text/javascript">
	$(function() {

		/* 공지사항 상세보기(수정/삭제)에서 목록으로 버튼 클릭 시 */
		$("#noticeListBtn").click(function() {
			location.href = "/adminNotice";
			alert("공지사항 글 수정/삭제가 취소되었습니다.");
		});

		/* 공지사항 상세보기(수정/삭제)에서 삭제 버튼 클릭 시 */
		$("#noticeDeleteBtn").click(function() {
			//location.href = "/adminNotice/noticeDelete.do";

			var goUrl = ""; // 이동할 경로를 저장할 변수

			goUrl = "/adminNotice/noticeDelete.do"

			$("#n_data").attr("action", goUrl);
			$("#n_data").submit();

			alert("해당 페이지의 공지글이 삭제되었습니다.");
		});

		/* 공지사항 상세보기(수정/삭제)에서 수정 버튼 클릭 시 */
		$("#noticeUpdateBtn").click(function() {

			// 입력값 체크
			if (!chkSubmit($('#notice_text'), "수정할 공지사항 공지글 내용을 "))
				return;

			else{
				$("#n_data").attr({
					"method" : "POST",
					"action" : "/adminNotice/noticeUpdate.do"
				});

				$("#n_data").submit();
				alert("관리자님의 공지글이 수정되었습니다.");
			}
		});

	})
</script>

<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h2>공지사항 수정/삭제</h2>
			<hr>
			<div class="contentTB">
				<form id="n_data" name="n_data">
					<input type="hidden" id="notice_no" name="notice_no"
						value="${detail.notice_no}" />
						<input type="hidden" name="page" id="page" value="${param.page}">
						
					<table id="noticeupdate">
						<tr>
							<td class="ac"><h3>공지글 제목</h3></td>
						</tr>
						<tr>
							<td><input type="text" name="notice_title" id="notice_title"
								value="${detail.notice_title}" readonly="readonly" /> <%-- <input type="hidden"
								value="${.notice_no}" name="notice_no"> --%></td>
						</tr>
						<tr>
							<td class="ac"><h3>작성일</h3></td>
						</tr>
						<tr>
							<td><input type="text" name="notice_date" id="notice_date"
								value="${detail.notice_date}" readonly="readonly" /></td>
						</tr>
						<tr>
							<td class="ac vm"><h3>공지글 내용</h3></td>
						</tr>
						<tr>
							<td><textarea rows="15" name="notice_text" id="notice_text">${detail.notice_text}</textarea></td>
						</tr>
					</table>
				</form>
			</div>

			<div class="contentBtn">
				<input type="button" value="수  정" class="btn" id="noticeUpdateBtn">&nbsp;&nbsp;&nbsp;
				<input type="button" value="삭  제" class="btn" id="noticeDeleteBtn">&nbsp;&nbsp;&nbsp;
				<input type="button" value="목록으로" class="btn" id="noticeListBtn">
			</div>

		</div>
	</div>
</body>
</html>