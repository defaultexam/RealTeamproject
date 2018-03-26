<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방문후기 관리</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function choiceDel(comment_no) {
		if (confirm("회원의 방문후기를 삭제하시면 다시는 복구되지 않습니다.\n정말로 삭제하시겠습니까? ")) {
			location.href = "/adminComment/adminCommentDelete.do?comment_no=" + comment_no;
		}
	}
</script>
</head>
<body>
	<div class="container">
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
						<table class="table table-bordered table-hover">
							<tbody id="list">
								<tr>
									<td align="left">사용자명</td>
									<td style="width: 150px;">${comment.id}</td>
									<td style="width: 100px;">작성일자</td>
									<td>${comment.comment_date}</td>
									<td style="width: 100px;">별점</td>
									<td>${comment.comment_score}</td>
								</tr>
								<tr class="tac" data-num="${comment.comment_no}">
									<td rowspan="2" class="comment_file" align="center"
										style="width: 200px; height: 200px;"><img
										src="/uploadStorage/comment/${comment.comment_file}"
										align="middle" id="c_img" style="width: 200px; height: 200px;" /><br />
									<br /> <input type="button" value="삭제" class="btn btn-default"
										style="width: 200px;"
										onclick="choiceDel(${comment.comment_no});"></td>
									<td style="width: 50px;">제목</td>
									<td colspan="4">${comment.comment_title}
								</tr>
								<tr>
									<td style="width: 30px;">내용</td>
									<td colspan="4"><textarea rows="10" cols="50"
											class="form-control" readonly="readonly">${comment.comment_text}</textarea>
									</td>
								</tr>

							</tbody>
						</table>
						<br>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered table-hover">
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
	<div id="commentPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize }">
		</tag:paging>
	</div>
</body>