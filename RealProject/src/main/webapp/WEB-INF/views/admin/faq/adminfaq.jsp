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
li a:hover {
	color: black;
}

li a:active {
	color: yellow;
	text-shadow: orange;
}

textarea {
	resize: none;
}

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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	$(function() {

		/* 닫기 버튼 */
		$(".bye").click(function() {
			resetData();
		});

		/* 추가 버튼 클릭 시 */
		$("#faqInsertBtn").click(function() {
			$("#faqInsert").modal('show');
		});

		/* 추가 창 추가버튼 */
		$("#faqInsertBtnIn")
			.click(
				function() {
					// 입력값 체크
					if (!formCheck($('#faq_title'),
							$('.error:eq(0)'), "제목을")) {
						return;
					} else if (!formCheck($('#faq_text'),
							$('.error:eq(1)'), "내용을")) {
						return;
					} else if (!formCheck($('#faq_type'),
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
									alert("신규 FAQ 등록 성공");
									$("#faqInsert")
										.modal('hide');
									window.history.go(0);
								}
							});
					}
				});
		/* 수정 버튼 */
		$("#faqUpdateBtnIn").click(
			function() {
				// 입력값 체크
				if (!formCheck($('#updatefaq_title'),
						$('.error:eq(1)'), "제목을")) {
					return;
				} else if (!formCheck(
						$('#updatefaq_text'),
						$('.error:eq(1)'), "내용을")) {
					return;
				} else if (!formCheck($('#updatefaq_type'),
						$('.error:eq(1)'), "종류를")) {
					return;
				} else {
					$.ajax({
						method : "post",
						url : "/adminFaq/faqUpdate",
						data : {
							"faq_title" : $(
								"#updatefaq_title")
								.val(),
							"faq_text" : $(
								"#updatefaq_text")
								.val(),
							"faq_type" : $(
								"#updatefaq_type")
								.val(),
							"faq_no" : $("#selectfaq_no").val()
						},
						dataType : "json",
						error : function() {
							alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해주세요");
						},
						success : function(data) {
							console.log(data);
							if (data == 1) {
								alert("FAQ 수정 등록 성공");
								$("#faqupdate").modal(
									'hide');
								window.history.go(0);
							} else {
								alert("페이지를 불러오는데 실패하였습니다.");
							}

						}
					});
				}
			});

		var tab1 = document.getElementById("전체");
		var tab2 = document.getElementById("레스토랑 이용");
		var tab3 = document.getElementById("홈페이지 이용");
		var tab4 = document.getElementById("예약 문의");
		// 탭 상태 화면 표시 설정
		if (sessionStorage.getItem("faqtab") == '레스토랑 이용') {
			tab1.classList.remove("active");
			tab2.classList.add("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
		} else if (sessionStorage.getItem("faqtab") == '홈페이지 이용') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.add("active");
			tab4.classList.remove("active");
		} else if (sessionStorage.getItem("faqtab") == '예약 문의') {
			tab1.classList.remove("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.add("active");
		} else {
			tab1.classList.add("active");
			tab2.classList.remove("active");
			tab3.classList.remove("active");
			tab4.classList.remove("active");
		}
		/* 삭제버튼 */
		$("#deleteBtn").click(
			function() {

				var select_no = $("#selectfaq_no").val();

				$("#f_Form").attr({
					"method" : "GET",
					"action" : "/adminFaq/faqDelete"
				});
				$("#f_Form").submit();
				alert("삭제처리완료");
			});
		/* 탭버튼전체 */
		$("#alllist").click(function() {
			$("#type").val("");
			console.log($("#type").val());
			sessionStorage.removeItem("faqtab");
			$("#pageset").attr({
				"method" : "get",
				"action" : "/adminFaq/adminFaqList"
			});

			$("#pageset").submit();
		});
		/* 레스토랑 이용 탭버튼 */
		$("#list1").click(function() {
			$("#type").val("레스토랑 이용");
			console.log($("#type").val());
			sessionStorage.setItem("faqtab", "레스토랑 이용");
			$("#pageset").attr({
				"method" : "get",
				"action" : "/adminFaq/adminFaqList"
			});

			$("#pageset").submit();
		});
		/* 홈페이지 이용 탭버튼 */
		$("#list2").click(function() {
			$("#type").val("홈페이지 이용");
			console.log($("#type").val());
			sessionStorage.setItem("faqtab", "홈페이지 이용");
			$("#pageset").attr({
				"method" : "get",
				"action" : "/adminFaq/adminFaqList"
			});

			$("#pageset").submit();
		});
		/* 예약 문의 탭버튼 */
		$("#list3").click(function() {
			$("#type").val("예약 문의");
			console.log($("#type").val());
			sessionStorage.setItem("faqtab", "예약 문의");
			$("#pageset").attr({
				"method" : "get",
				"action" : "/adminFaq/adminFaqList"
			});

			$("#pageset").submit();
		});
	});
	/* 페이징 */
	function goPage(page) {
		$("#page").val(page);
		$("#pageset").attr({
			"method" : "get",
			"action" : "/adminFaq/AdminFaqList"
		});
		$("#pageset").submit();
	}

	/* 수정창 */
	function update(index) {
		var select_no = $("#select_" + index).val();
		$.ajax({
			method : "get",
			url : "/adminFaq/faqDetail",
			data : {
				"faq_no" : select_no
			},
			dataType : "json",
			error : function() {
				alert("사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시후 다시 시도해주세요");
			},
			success : function(data) {
				console.log(data.faq_no);
				console.log("데이터 이동완료");
				var result = data;

				$("#selectfaq_no").val(data.faq_no);
				$("#updatefaq_title").val(result.faq_title);
				$("#updatefaq_text").val(result.faq_text);
				$("#updatefaq_type").val(result.faq_type);
				$("#faqupdate").modal('show');

			}
		});
	}
</script>
</head>
<body>
	<!-- faq리스트 -->
	<div id="faq_all">
		<form id="faq_all_list">
			<ul class="nav nav-tabs">
				<li class="active" id="전체"><a id="alllist">전체</a></li>
				<li class="" id="레스토랑 이용"><a id="list1">레스토랑 이용</a></li>
				<li class="" id="홈페이지 이용"><a id="list2">홈페이지 이용</a></li>
				<li class="" id="예약 문의"><a id="list3">예약 문의</a></li>
			</ul>
		</form>

		<form id="pageset">
			<input type="hidden" name="page" id="page"> <input
				type="hidden" name="faq_type" id="type">
		</form>

		<!-- faq 게시판 시작 -->
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<c:choose>
				<c:when test="${not empty faqList}">
					<c:forEach var="faq" items="${faqList}" varStatus="status">

						<!-- 아코디언-->
						<div class="panel panel-default" style="width: 100%;"
							id="faq_list${status.index}">
							<!-- panel_heading -->
							<div class="panel-heading" role="tab" id="heading${status.index}"
								style="width: 100%;" class="test" data-toggle="collapse"
								data-parent="#accordion" href="#collapse${status.index}"
								aria-controls="collapse${status.index}" aria-expanded="true">
								<!-- panel_title -->
								<!-- 글번호 출력 -->
								<label style="padding-left: 5%;"> ${faq.faq_no} </label>
								<!-- 글 타입출력 -->
								<label style="padding-left: 10%;"> ${faq.faq_type}</label>
								<!-- 제목 출력 -->
								<label style="padding-right: 10%;"> ${faq.faq_title} </label>
								<!-- 날짜출력 -->
								<label style="padding-right: 5%;">${faq.faq_date}</label>
							</div>
							<!-- 아코디언 내용 단-->
							<div class="panel-collapse collapse" id="collapse${status.index}"
								role="tabpanel" aria-labelledby="heading${status.index}">
								<!-- body -->
								<div class="panel-body">
									<div class="question">${faq.faq_text}</div>
									<div class="clear"></div>
									<input type="hidden" id="select_${status.index}"
										value="${faq.faq_no}">
									<button type="button" class="btn btn-primary"
										onclick="update(${status.index});">수정/삭제</button>
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
		<!-- faq 추가 화면 영역 -->
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
								<label for="faq_text" class="control-label">내용</label>
								<textarea class="form-control" name="faq_text" id="faq_text"
									maxlength="500" rows="10" cols=""></textarea>
							</div>
							<div class="form-group">
								<label for="faq_type" class="control-label">종류</label> <select
									class="form-control" name="faq_type" id="faq_type">
									<option value="레스토랑 이용" id="typeadd1">레스토랑 이용</option>
									<option value="홈페이지 이용" id="typeadd2">홈페이지 이용</option>
									<option value="예약 문의" id="typeadd3">예약 문의</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="faqInsertBtnIn">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal"
							class="bye">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 쿠폰 수정 화면 영역(modal) -->
		<!-- FAQ 수정 화면 -->
		<div class="modal fade" id="faqupdate" tabindex="-1" role="dialog"
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
						<form id="f_Form">
							<input type="hidden" id="selectfaq_no" name="faq_no">
							<div class="form-group">
								<label for="updatefaq_title" class="control-label">제목</label> <input
									type="text" class="form-control" id="updatefaq_title"
									maxlength="5" />
							</div>
							<div class="form-group">
								<label for="updatefaq_text" class="control-label">내용</label>
								<textarea class="form-control" id="updatefaq_text"
									maxlength="500" rows="10" cols=""></textarea>
							</div>
							<div class="form-group">
								<label for="updatefaq_type" class="control-label">종류</label> <select
									class="form-control" id="updatefaq_type">
									<option value="레스토랑 이용" id="typeset1">레스토랑 이용</option>
									<option value="홈페이지 이용" id="typeset2">홈페이지 이용</option>
									<option value="예약 문의" id="typeset3">예약 문의</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="faqUpdateBtnIn">수정</button>
						<button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>
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
	<div id="tar">
		<button type="button" id="faqInsertBtn" class="btn btn-default">추가</button>

		<div id="faqPage">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div>
	</div>

</body>
</html>
