<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글 추가</title>
</head>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/* 공지사항 글쓰기 폼에서 목록으로 버튼 클릭 시 */
		$("#noticeListBtn").click(function() {
			var confirmation = confirm("정말로 취소하시겠습니까?.\n확정을 누르시면 목록으로 이동합니다.\n데이터는 복구되지 않습니다.");
			if (confirmation) {
				location.href = "/adminNotice";
			} else {
				return;
			}
		});
		/* 공지사항 글쓰기 폼에서 공지글 등록 버튼 클릭 시 */
		$("#noticeInsertBtn").click(function() {
			// 입력값 체크
			if (!chkSubmit($('#notice_title'), "공지사항 글제목을"))
				return;
			else if (!chkSubmit($('#notice_text'), "작성할 공지사항 글내용을"))
				return;
			$("#n_writeForm").attr({
				"method" : "POST",
				"action" : "/adminNotice/noticeInsert.do"
			});
			$("#n_writeForm").submit();
			alert("관리자님의 공지사항 글이 등록되었습니다.");
		});
	});
</script>
<body>
	<div class="container">
		<h3>공지글 추가</h3>
		<hr>
		<form id="n_writeForm" name="n_wirteForm">
			<table class="table table-bordered table-hover"
				style="width: 650px; height: auto;">
				<tr>
					<td class="ac"><h4 align="center">글 제목</h4></td>
				</tr>
				<tr>
					<td><input type="text" name="notice_title" id="notice_title"
						class="form-control" width="150" /></td>
				</tr>
				<tr>
					<td class="ac"><h4 align="center">글 내용</h4></td>
				</tr>
				<tr>
					<td><textarea class="form-control" cols="90" rows="15"
							name="notice_text" id="notice_text"></textarea></td>
				</tr>
			</table>
		</form>
		<br />
		<div class="contentBtn">
			<input type="button" value="등록" class="btn btn-default"
				id="noticeInsertBtn">&nbsp;&nbsp;&nbsp; <input type="button"
				value="목록으로" class="btn btn-default" id="noticeListBtn">
		</div>
	</div>
</body>