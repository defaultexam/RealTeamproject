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

		/* 공지사항 상세보기에서 목록으로 버튼 클릭 시 */
		$("#userNoticeBtn").click(function() {
			location.href = "/userNotice";
		});
	});
</script>

<body>
	<div class="contentContainer">
		<div class="contentTit">
			<h2>공지사항 상세보기</h2>
			<hr>
			<div class="contentTB">
				<form id="n_data" name="n_data">
					<input type="hidden" id="notice_no" name="notice_no"
						value="${detail.notice_no}" /> <input type="hidden" name="page"
						id="page" value="${param.page}">

					<table id="noticeupdate">
						<tr>
							<td class="detail_main"><strong>${detail.notice_title}</strong></td>
							<td class="detail_main">${detail.notice_date}</td>
						</tr>
						<tr>
							<td class="detail_text" colspan="2">${detail.notice_text}</td>
						</tr>

					</table>
				</form>
			</div>

			<div class="contentBtn">
				<input type="button" value="목록으로" class="btn" id="userNoticeBtn">
			</div>

		</div>
	</div>
</body>
</html>