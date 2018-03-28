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
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
   src="/resources/include/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		/* 공지사항 상세보기(수정/삭제)에서 목록으로 버튼 클릭 시 */
		$("#noticeListBtn").click(function() {
			location.href = "/adminNotice";
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
			// 스마트 에디터 사용설정
	         $("#notice_text").val(CKEDITOR.instances.notice_text.getData());
			// 입력값 체크
			if (!chkSubmit($('#notice_text'), "수정할 공지사항 공지글 내용을 "))
				return;
			else {
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
	<div class="container">
		<div class="contentTit">
			<h3>공지사항 수정/삭제</h3>
			<hr>
			<form id="n_data" name="n_data">
				<input type="hidden" id="notice_no" name="notice_no"
					value="${detail.notice_no}" /> <input type="hidden" name="page"
					id="page" value="${param.page}">
				<table id="noticeupdate" class="table table-bordered table-hover"
					style="width: 650px; height: auto;">
					<tr>
						<td class="ac"><h4>제목</h4></td>
					</tr>
					<tr>
						<td><input type="text" name="notice_title" id="notice_title"
							class="form-control" value="${detail.notice_title}"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="ac"><h4>작성일</h4></td>
					</tr>
					<tr>
						<td><input type="text" name="notice_date" id="notice_date"
							class="form-control" value="${detail.notice_date}"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="ac vm"><h4>내용</h4></td>
					</tr>
					<tr>
						<td><textarea class="form-control" cols="90" rows="15"
								name="notice_text" id="notice_text">${detail.notice_text}</textarea></td>
					</tr>
				</table>
			</form>
			<div class="contentBtn">
				<input type="button" value="수정" class="btn btn-default"
					id="noticeUpdateBtn">&nbsp;&nbsp;&nbsp; <input
					type="button" value="삭제" class="btn btn-default"
					id="noticeDeleteBtn">&nbsp;&nbsp;&nbsp; <input
					type="button" value="목록으로" class="btn btn-default"
					id="noticeListBtn">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		CKEDITOR.config.language = 'english';
		CKEDITOR.replace('notice_text');
		$(function() {
			CKEDITOR.replace('notice_text', {
				customConfig : "/resources/include/ckeditor/config.js"
			});
		});
	</script>
</body>
</html>