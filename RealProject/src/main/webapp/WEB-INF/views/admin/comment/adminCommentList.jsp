<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방문후기 관리</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
function choiceDel(comment_no) {
	if(confirm("회원의 방문후기를 삭제하시면 회원의 글이 다시 복구되지 않습니다.\n정말로 삭제하시겠습니까? ")){
		location.href = "/adminComment/adminCommentDelete.do?comment_no="+comment_no;
	}
}
</script>
</head>
<body>
	<div>
		<h2>방문후기 관리</h2>
		<hr>

		<form id="pageForm">
			<input type="hidden" name="member_no" value="${data.member_no}">
			<input type="hidden" id="page" name="page" value="${data.page }" />
			<input type="hidden" id="pageSize" name="pageSize"
				value="${data.pageSize}" />
		</form>
		<!-- 후기글 게시판리스트 영역 -->
		<div class="commentList">
			<c:choose>
				<c:when test="${not empty commentList}">
					<c:forEach var="comment" items="${commentList}" varStatus="status">
						<table border="1">
							<tbody id="list">
								<tr class="tac" data-num="${comment.comment_no}">
									<td rowspan="2" class="comment_file"><img
										src="/uploadStorage/comment/${comment.comment_file}"
										id="c_img" style="width: 200px; height: 200px;" /></td>
									<td>${comment.comment_title}${comment.comment_score}</td>
								</tr>
								<tr>
									<td>${comment.id}님<br>${comment.comment_date}<br>${comment.comment_text}<br>
										<input type="button" value="삭제" class="btn btn-default"
										onclick="choiceDel(${comment.comment_no});"></td>
								</tr>
							</tbody>
						</table>
						<br>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<table border="1">
						<tbody id="list">
							<tr>
								<td colspan="3" class="tac">등록된 방문후기가 없습니다.</td>
							</tr>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 페이징 처리 -->
	<center>
		<div id="commentPage">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize }">
			</tag:paging>
		</div>
	</center>
</body>
</html>