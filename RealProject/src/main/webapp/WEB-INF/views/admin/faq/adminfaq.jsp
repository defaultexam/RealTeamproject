<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.answer {
	float: right;
}

.clear {
	clear: both;
}

.question {
	float: left;
}
</style>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("#faqInsertBtn").click(function() {
		$("#faqInsert").modal('show');
	});
	
	$("#faqInsertBtn")
			.click(
					function() {
						// 입력값 체크
						if (!formCheck($('#faq_title'),
								$('.error:eq(0)'), "제목을")) {
							return;
						} else if (!formCheck($('#faq_text'),
								$('.error:eq(1)'), "내용을")) {
							return;
						} else if (!chkNumberForm($('#faq_type'),
								$('.error:eq(1)'), "종류를")) {
							return;
						} else {
							$
									.ajax({
										method : "post",
										url : "/adminFaq/faqInsert",
										data : {
											"faq_title" : $(
													"#faq_title").val(),
											"faq_text" : $(
													"#faq_text").val(),
											"faq_type" : $(
													"#faq_type")
													.val()
										},
										dataType : "text",
										error : function() {
											alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해주세요");
										},
										success : function() {
											alert("신규 쿠폰 등록 성공");
											$("#faqInsert")
													.modal('hide');
											window.history.go(0);
										}
									});
						}
					});
	
	
	
});
</script>

</head>
<body>
	<form name="detailForm" id="detailForm">
		<input type="hidden" name="b_num" id="b_num"> <input
			type="hidden" name="page" value="${data.page}"> <input
			type="hidden" name="pageSize" value="${data.pageSize}">
	</form>
	<!-- faq 관리 -->

	<!-- faq리스트 -->
	<div id="faqlist">
		<ul class="nav nav-tabs">
			<li class="active" id="tab1">전체</li>
			<li class="" id="tab2">예약</li>
			<li class="" id="tab3">게시판</li>
			<li class="" id="tab4">예약취소</li>
		</ul>
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<c:choose>
				<c:when test="${not empty faqList}">
					<c:forEach var="faq" items="${faqList}" varStatus="status">

						<!-- panel -->
						<div class="panel panel-default" style="width: 100%;">
							<!-- panel_heading -->
							<div class="panel-heading" role="tab" id="heading${status.index}"
								style="width: 100%;" class="test" data-toggle="collapse"
								data-parent="#accordion" href="#collapse${status.index}"
								aria-controls="collapse${status.index}" aria-expanded="true">
								<!-- panel_title -->
								<label style="padding-right: 10%;"> ${faq.faq_no} </label> <label
									style="padding-right: 30%;"> ${faq.faq_type}</label> <label
									style="padding-right: 35%;"> ${faq.faq_title} </label>
								<!-- title -->
								<label>${faq.faq_date}</label>
							</div>

							<!-- panel_body -->
							<div class="panel-collapse collapse" id="collapse${status.index}"
								role="tabpanel" aria-labelledby="heading${status.index}">
								<!-- body -->
								<div class="panel-body">
									<div class="question">${faq.faq_text}</div>
									<div class="clear"></div>
									<input type="button" value="수정" id="updateFormBtn"> <input
										type="button" value="삭제" id="deleteBtn">
								</div>
							</div>
						</div>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" class="tac">등록된 FAQ가 존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- 목록끝 -->


		<!-- 쿠폰 추가 화면 영역(modal) --><!-- faq 추가 화면 영역 -->
		<div class="modal fade" id="faqInsert" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">FAQ 추가</h4>
					</div>
					<div class="modal-body">
						<form id="f_writeForm" name="f_writeForm">
							<div class="form-group">
								<label for="faq_title" class="control-label">제목</label> <input
									type="text" class="form-control" name="faq_title"
									id="faq_title" maxlength="50" />
							</div>
							<div class="form-group">
								<label for="faq_text" class="control-label">내용</label> <input
									type="text" class="form-control" name="faq_text" id="faq_text"
									maxlength="50" />
							</div>

							<div class="form-group">
								<label for="faq_type" class="control-label">종류</label> <select
									class="form-control" name="faq_type" id="faq_type">
									<option value="1번 선택" id="type1">1번선택</option>
									<option value="2번 선택" id="type2">2번선택</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="faqInsertBtn">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							class="bye">닫기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 쿠폰 수정 화면 영역(modal) -->
		<div class="modal fade" id="couponUpdate" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">FAQ 수정</h4>
					</div>
					<div class="modal-body">
						<form id="f_Form" name="f_writeForm">
							<input type="hidden" id="selectfaq_no">
							<div class="form-group">
								<label for="updatefaq_title" class="control-label">제목</label> <input
									type="text" class="form-control" name="faq_title"
									id="updatefaq_title" maxlength="5" readonly="readonly" />
							</div>
							<div class="form-group">
								<label for="updatefaq_text" class="control-label">내용</label> <input
									type="text" class="form-control" name="faq_text"
									id="updatefaq_text" maxlength="50" />
							</div>
							<div class="form-group">
								<label for="updatefaq_type" class="control-label">종류</label> <select
									class="form-control" name="faq_type" id="updatefaq_type">
									<option value="1번 선택" id="type1">1번선택</option>
									<option value="2번 선택" id="type2">2번선택</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="faqUpdateBtn">수정</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							class="bye">닫기</button>

					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- 페이징 -->
	<div id="pagingset"></div>

	<!-- 버튼 -->
	<div id="buttonset">
		<input type="button" value="추가" id="faqInsertBtn">
	</div>
</body>
</html>
