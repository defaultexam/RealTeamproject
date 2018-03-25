<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방문후기 수정</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function() {
		/* 라디오버튼 가져오기 */
		$(
				"input:radio[name='comment_score']:input[value='${updateData.comment_score}']")
				.attr("checked", true);
		$("#commentUpdateBtn").click(function() {
			$("#commentForm").attr({
				"method" : "POST",
				"action" : "/comment/commentUpdate.do"
			});

			$("#commentForm").submit();
			alert("회원님의 방문후기 수정이 완료되었습니다.");

		});

		$("#commentNoUpdateBtn").click(function() {
			alert("회원님의 방문후기 수정이 완료되었습니다.");
			location.href = "/comment/commentList.do";
		});
	});
</script>

</head>

<body>
	<!-- 방문후기 글쓰기 -->
	<div class="contentContainer">
		<div>
			<h2>방문후기 수정</h2>
		</div>

		<div class="contentTB">
			<form id="commentForm" enctype="multipart/form-data">
				<input type="hidden" id="comment_no" name="comment_no"
					value="${updateData.comment_no}" />
				<table>
					<tr>
						<th scope="row" class="ac">작성자 ID</th>
						<td><input type="text" id="id"
							value="${updateData.id}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="row" class="ac">후기글 제목</th>
						<td><input type="text" id="comment_title"
							readonly="readonly"
							value="${updateData.comment_title}"></td>
					</tr>
					<tr>
						<th scope="row" class="ac">후기글 내용</th>
						<td><textarea rows="4" cols="50" name="comment_text"
								id="comment_text">${updateData.comment_text}</textarea></td>
					</tr>
					<tr>
						<th scope="row" class="ac">레스토랑 평점</th>
						<td><input type="radio" class="comment_control"
							name="comment_score" value="★☆☆☆☆ " />★☆☆☆☆ <input type="radio"
							class="comment_control" name="comment_score" value="★★☆☆☆" />★★☆☆☆
							<input type="radio" class="comment_control" name="comment_score"
							value="★★★☆☆" />★★★☆☆ <input type="radio"
							class="comment_control" name="comment_score" value="★★★★☆" />★★★★☆
							<input type="radio" class="comment_control" name="comment_score"
							value="★★★★★" />★★★★★</td>
					</tr>
					<tr>
						<td colspan="2"><img alt="sdf"
							src="/uploadStorage/comment/${updateData.comment_file}"
							width="200px" height="200px"></td>
					</tr>
					<tr>
						<th scope="row" class="ac">첨부 이미지</th>
						<td><input type="file" name="file"></td>
					</tr>
				</table>
			</form>
		</div>
		<div>
			<input type="button" value="방문후기 수정" class="btn btn-default"
				id="commentUpdateBtn"> <input type="button" value="취소"
				class="btn btn-default" id="commentNoUpdateBtn">
		</div>
	</div>
</body>
</html>