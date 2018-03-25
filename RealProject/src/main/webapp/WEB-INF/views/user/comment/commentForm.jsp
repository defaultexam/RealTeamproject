<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방문후기 등록</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		// 홈으로 클릭 시
		$("#commentCancelBtn").click(function() {
			location.href = "/comment/commentList.do";
			alert("작성중이던 방문후기글이 취소됩니다. ");
		})

		// 방문후기 등록 폼에서 후기글 등록 버튼 클릭 시
		$("#commentInsertBtn").click(function() {

			//입력값 체크
			if (!chkSubmit($('#comment_title'), "후기글 제목을"))
				return;
			else if (!chkSubmit($('#comment_text'), "작성할 후기글 내용을"))
				return;
			else {
				if (($('#comment_file').val() != "")) {
					if (!chkFile($('#comment_file')))
						return;
				}
				$("#commentForm").attr({
					"method" : "POST",
					"action" : "/comment/commentInsert.do"
				});

				$("#commentForm").submit();
				alert("회원님의 방문후기가 등록되었습니다.");
			}

		})
	})
</script>

</head>

<body>
	<!-- 방문후기 글쓰기 -->
	<div class="contentContainer">
		<h2>방문후기 등록</h2>
		<hr>
		<h4>
			<span style="color: red;">※ 방문 후기 작성 시, 10point 적립!</span>
		</h4>

		<div class="contentTB">
			<form id="commentForm" enctype="multipart/form-data">
				<table id="commentWrite">
					<tr>
						<th scope="row" class="ac">작성자 ID</th>
						<td><input type="text" id="id" name="id" value="${login.id}"
							readonly="readonly"><input type="hidden"
							value="${login.member_no}" name="member_no"></td>
					</tr>
					<tr>
						<th scope="row" class="ac">후기글 제목</th>
						<td><input type="text" id="comment_title"
							name="comment_title"></td>
					</tr>
					<tr>
						<th scope="row" class="ac">후기글 내용</th>
						<td><textarea rows="4" cols="50" name="comment_text"
								id="comment_text"></textarea></td>
					</tr>
					<tr>
						<th scope="row" class="ac">레스토랑 평점</th>
						<td><input type="radio" class="comment_control"
							name="comment_score" id="comment_score" value="★☆☆☆☆ " />★☆☆☆☆ <input
							type="radio" class="comment_control" name="comment_score"
							id="comment_score" value="★★☆☆☆" />★★☆☆☆ <input type="radio"
							class="comment_control" name="comment_score" id="comment_score"
							value="★★★☆☆" />★★★☆☆ <input type="radio"
							class="comment_control" name="comment_score" id="comment_score"
							value="★★★★☆" />★★★★☆ <input type="radio"
							class="comment_control" name="comment_score" id="comment_score"
							value="★★★★★" checked="checked" />★★★★★</td>
					</tr>
					<tr>
						<th scope="row" class="ac">첨부 이미지</th>
						<td><input type="file" id="comment_file" name="file"></td>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<input type="button" value="방문후기 등록" class="btn btn-default"
				id="commentInsertBtn"> <input type="button" value="홈으로"
				class="btn btn-default" id="commentCancelBtn">
		</div>
	</div>
</body>
</html>