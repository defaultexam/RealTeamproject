<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
</head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
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
	<div class="container">
		<div>
			<h3 align="center">공지사항 상세보기</h3>
			<hr>
			<div>
				<form id="n_data" name="n_data">
					<input type="hidden" id="notice_no" name="notice_no"
						value="${detail.notice_no}" /> <input type="hidden" name="page"
						id="page" value="${param.page}">
					<table id="noticeupdate" class="table table-bordered">
						<tr>
							<td style="width: 100px;">제목</td>
							<td style="width: 700px;"><strong>${detail.notice_title}</strong></td>
							<td style="width: 100px;">작성일자</td>
							<td>${detail.notice_date}</td>
						</tr>
						<tr>
							<td colspan="4">${detail.notice_text}
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div align="right">
				<input type="button" value="목록으로" class="btn" id="userNoticeBtn">
			</div>

		</div>
	</div>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	
</body>