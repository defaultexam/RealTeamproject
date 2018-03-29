<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<head>
<meta charset="UTF-8">
<title>방문 후기</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">
<!-- JQUERY -->
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
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
		location.href = "/comment/commentUpdateForm.do?comment_no=" + comment_no;
	}
	function del(comment_no) {
		if (confirm("삭제하시면 회원님의 글이 다시 복구되지 않습니다.\n정말로 삭제하시겠습니까?")) {
			location.href = "/comment/commentDelete.do?comment_no=" + comment_no;
		}
	}
</script>
</head>
<body>
	<!-- 방문후기 게시판 -->
	<div class="container">
		<h3 align="center">방문후기</h3>
		<hr>
		<h5 align="right">
			<span style="color: red;">※ 방문 후기 작성 시, 10point 적립!</span>
		</h5>
		<!-- 후기글 등록 구현 -->
		<p class="tar" style="float: right;">
			<c:if test="${login.id != null and login.id != '' }">
				<button type="button" class="btn btn-default" id="commentInsertBtn">후기글
					작성</button>
			</c:if>
			<c:if test="${login.id == null or login.id == '' }">
				<button type="button" id="commentLoginBtn" class="btn btn-default">후기글
					작성</button>
			</c:if>
		</p>
		<form id="pageForm">
			<input type="hidden" name="member_no" value="${data.member_no}">
			<input type="hidden" id="page" name="page" value="${data.page }" />
			<input type="hidden" id="pageSize" name="pageSize"
				value="${data.pageSize}" />
		</form>
		<br /> <br /> <br />
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<c:choose>
				<c:when test="${not empty commentList}">
					<c:forEach var="comment" items="${commentList}" varStatus="status">
						<!-- 아코디언-->
						<div class="panel panel-default"
							style="width: 100%; height: auto;" id="faq_list${status.index}">
							<!-- panel_heading -->
							<div class="panel-heading" role="tab" id="heading${status.index}"
								style="width: 100%; height: 70px;" class="test"
								data-toggle="collapse" data-parent="#accordion"
								data-target="#collapse${status.index}"
								aria-controls="collapse${status.index}" aria-expanded="true">
								<table class="table table-bordered table-hover"
									style="height: 50px;">
									<tr>
										<td
											style="width: 60px; background-color: rgba(196, 192, 192, 0.57)"
											align="center">작성자</td>
										<td style="width: 150px;" align="center">${comment.id}</td>
										<td
											style="width: 60px; background-color: rgba(196, 192, 192, 0.57)"
											align="center">제목</td>
										<td>${comment.comment_title}</td>
									</tr>
								</table>
							</div>
							<!-- 아코디언 내용 단-->
							<div class="panel-collapse collapse" id="collapse${status.index}"
								role="tabpanel" aria-labelledby="heading${status.index}">
								<!-- body -->
								<div class="panel-body">
									<table class="table table-bordered"
										style="height: auto; width: 100;">
										<tbody id="list">
											<tr>
												<td rowspan="3" class="comment_file" align="center"
													style="width: 200px; height: 200px;"><script
														type="text/javascript">
										var test = "<c:out value='${comment.comment_file}' />";
										console.log("file"+test);
										if(test == null || test == ''){
											document.write("<img src='/resources/images/common/noimage.png' align='middle' id='c_img' style='width: 200px; height: 200px;' />");
										}else{
											document.write("<img src='/uploadStorage/comment/${comment.comment_file}' align='middle' id='c_img' style='width: 200px; height: 200px;' />");
										}
										</script> <br /> <br /> <c:if test="${login.id == comment.id}">
														<input type="button" value="수정" class="btn btn-default"
															style="width: 70px;"
															onclick="update(${comment.comment_no});">
														<input type="button" value="삭제" class="btn btn-default"
															style="width: 70px;"
															onclick="del(${comment.comment_no});">
													</c:if> <c:if test="${login.id != comment.id}">
													</c:if></td>
												<td style="width: 100px;">작성자</td>
												<td style="width: 150px;">${comment.id}</td>
												<td style="width: 100px;">작성일자</td>
												<td>${comment.comment_date}</td>
												<td style="width: 100px;">별점</td>
												<td>${comment.comment_score}</td>
											</tr>
											<tr class="tac" data-num="${comment.comment_no}">
												<td style="width: 50px;">제목</td>
												<td colspan="5">${comment.comment_title}
											</tr>
											<tr>
												<td style="width: 30px;">내용</td>
												<td colspan="5"><textarea rows="10" cols="50"
														class="form-control" readonly="readonly">${comment.comment_text}</textarea>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="well" align="center">
						<div>등록된 방문 후기가 존재하지 않습니다.</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div id="commentPage" align="center">
			<tag:paging page="${param.page}" total="${total}"
				list_size="${data.pageSize }">
			</tag:paging>
		</div>
	</div>
	<!-- 페이징 처리 -->
	<script type="text/javascript">
		$("body").attr("data-dep1", 3);
		$("body").attr("data-dep2", 0);
	</script>
</body>