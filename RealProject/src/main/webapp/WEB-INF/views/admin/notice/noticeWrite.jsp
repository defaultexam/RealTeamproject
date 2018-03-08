<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 글 추가</title>
</head>

<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">

	$(function() {

		/* 공지사항 글쓰기 폼에서 목록으로 버튼 클릭 시 */
		$("#noticeListBtn").click(function() {
			alert("작성 중이던 공지사항 글 등록이 취소됩니다.");
			location.href = "/adminNotice";
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
	<div class="contentContainer">
		<h2>공지글 추가</h2>
		<hr>
		<div class="contentTB">
			<form id="n_writeForm" name="n_wirteForm">
				<table id="noticeWrite">
					<tr>
						<td class="ac"><h3>글 제목</h3></td>
					</tr>
					<tr>
						<td><input type="text" name="notice_title" id="notice_title"
							width="150" /></td>
					</tr>
					<tr>
						<td class="ac"><h3>글 내용</h3></td>
					</tr>
					<tr>
						<td><textarea rows="15" name="notice_text" id="notice_text"></textarea></td>
					</tr>
				</table>
			</form>
		</div>
		<br> <br>
		<div class="contentBtn">
			<input type="button" value="등  록" class="btn" id="noticeInsertBtn">&nbsp;&nbsp;&nbsp;
			<input type="button" value="목록으로" class="btn" id="noticeListBtn">
		</div>
	</div>
</body>
</html>