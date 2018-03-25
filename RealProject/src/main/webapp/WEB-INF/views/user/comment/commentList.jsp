<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>방문 후기</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- 최신버전 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- jqeury ui 관련 js -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 부트스트랩 js -->
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<!-- jquery form 관련 js -->
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>

<script type="text/javascript">
	$(function() {

		/* 로그인 확인 후 비로그인시 로그인페이지로*/
		$("#commentLoginBtn").click(function() {
			alert("로그인 후 이용가능한 서비스입니다.");
			location.href = "/login";
		});

		$("#commentInsertBtn").click(function() {
			location.href = "/comment";
		});

	});
	
	function update(comment_no) {
		alert("회원님의 방문후기 수정페이지로 이동합니다.");
		location.href = "/comment/commentUpdateForm.do?comment_no="+comment_no;
	}
	
	function del(comment_no) {
		if(confirm("삭제하시면 회원님의 글이 다시 복구되지 않습니다.\n정말로 삭제하시겠습니까?")){
			location.href = "/comment/commentDelete.do?comment_no="+comment_no;
		}
	}

	/* //페이지 이동
	function goPage(page) {
		$("#page").val(page);
		$("#pageset").attr({
			"method" : "get",
			"action" : "/comment/commentList"
		});
		$("#pageset").submit();
	} */
</script>
</head>

<body>

	<!-- 방문후기 게시판 -->
	<div class="contentContainer">
		<h2>방문후기</h2>
		<hr>
		<h4>
			<span style="color: red;">※ 방문 후기 작성 시, 10point 적립!</span>
		</h4>
		<!-- 후기글 등록 구현 -->
		<p class="tar" style="float: right;">
			<c:if test="${login.id != null and login.id != '' }">
				<button type="button" class="btn_primary" id="commentInsertBtn">후기글
					작성</button>
			</c:if>
			<c:if test="${login.id == null or login.id == '' }">
				<button type="button" id="commentLoginBtn" class="btn-default">후기글
					작성</button>
			</c:if>
		</p>
		<!-- <form id="pageForm">
			<input type="hidden" name="page" id="page"> <input
				type="hidden" name="comment_type" id="type">
		</form> -->
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
						<table border="1" style="height: auto; width: 100;">
							<tbody id="list">
								<tr class="tac" data-num="${comment.comment_no}">
									<td rowspan="2" class="comment_file"><img
										src="/uploadStorage/comment/${comment.comment_file}"
										id="c_img" style="width: 200px; height: 200px;" /></td>
									<td>${comment.comment_title}${comment.comment_score}</td>
								</tr>
								<tr>
									<td>${comment.id}님<br>${comment.comment_date}<br>${comment.comment_text}<br>

										<input type="button" value="수정" class="btn btn-default"
										onclick="update(${comment.comment_no});"> <input
										type="button" value="삭제" class="btn btn-default"
										onclick="del(${comment.comment_no});"></td>
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