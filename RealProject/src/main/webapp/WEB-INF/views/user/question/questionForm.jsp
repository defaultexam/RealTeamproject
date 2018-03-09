<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1:1 문의</title>

<style type="text/css">
li {
	font-size: 10pt;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>


<script type="text/javascript">
	$(function() {

		/* 로그인 확인 후 비로그인시 로그인페이지로*/
		$("#questionLoginBtn").click(function() {
			location.href = "/login";
		});

		/* 1:1 문의하기 폼에서 홈으로 클릭 시  */
		$("#questionCancelBtn").click(function() {
			alert("작성 중이던 문의글이 작성 취소됩니다");
			location.href = "/";
		});

		/* 문의하기 버튼 클릭 시 */
		$("#questionInsertBtn").click(function() {

			// 선택된 문의유형 값 확인
			//alert($('#question_type').val());

			// 입력값 체크
			if (!chkSubmit($('#question_title'), "제목을"))
				return;
			else if (!chkSubmit($('#question_text'), "작성할 문의 내용을"))
				return;
			else {
				if (($('#question_file').val() != "")) {
					if (!chkFile($('#question_file')))
						return;
				}
				$("#questionForm").attr({
					"method" : "POST",
					"action" : "/question/questionInsert.do"
				});

				$("#questionForm").submit();
				alert("회원님의 문의가 전송되었습니다.");

			}

		});

	});

	/* // 1:1 문의 글쓰기 초기화 작업
	function resetData() {
		$("#questionForm").each(function() {
			this.reset();
		});
	} */
</script>

</head>

<body>
	<!-- 1:1 문의 글쓰기 -->
	<div class="contentContainer">
		<h2>1:1 문의</h2>
		<hr>
		<c:if test="${login.id != null and login.id != ''}">
			<ul>
				<li>레스토랑의 이용 / 온라인 예약 / 홈페이지 관련 1:1 문의입니다.</li>
				<li>1:1 문의는 평일 09:00 ~ 17:00까지 이며, 문의 답변은 3일 이내 가능합니다.<br>
				</li>
			</ul>

			<div class="contentTB">
				<!-- enctype : 파일을 전송할 수 있는 타입으로 바꿔줌  -->
				<form id="questionForm" enctype="multipart/form-data">

					<table id="questionWrite" class="table table-bordered table-hover">
						<colgroup>
							<col width="15%"></col>
							<col width="85%"></col>
						</colgroup>
						<tr>
							<th scope="row" class="ac">이름</th>
							<td><input type="text" id="name" value="${login.name}"
								readonly="readonly"><input type="hidden"
								value="${login.member_no}" name="member_no"></td>
						</tr>
						<tr>
							<th scope="row" class="ac"><label>이메일</label></th>
							<td><input type="text" id="email" value="${login.email}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<th scope="row" class="ac"><label>연락처</label></th>
							<td><input type="text" id="phone" value="${login.phone}"
								readonly="readonly"></td>
						</tr>
						<tr>
							<th scope="row" class="ac"><label>문의유형</label></th>
							<td><select id="question_type" name="question_type"
								style="width: 238px">
									<option value="use">레스토랑 이용</option>
									<option value="reg">레스토랑 예약</option>
									<option value="site">홈페이지 이용</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row" class="ac"><label for="question_title">제목</label></th>
							<td><input type="text" name="question_title"
								id="question_title"></td>
						</tr>
						<tr>
							<th scope="row" class="ac"><label for="question_text">문의내용</label></th>
							<td><textarea name="question_text" id="question_text"></textarea></td>
						</tr>
						<tr>
							<th scope="row" class="ac"><label for="question_file">첨부파일</label></th>
							<td><input type="file" name="file" id="question_file"></td>
						</tr>
					</table>
				</form>
			</div>

			<div class="contentBtn">
				<input type="button" value="문의하기" class="btn btn-default"
					id="questionInsertBtn"> <input type="button" value="홈으로"
					class="btn btn-default" id="questionCancelBtn">
			</div>
		</c:if>
		<c:if test="${login.id == null or login.id == ''}">
			<div class="container">
				<br> <font style="text-decoration: underline">1:1 문의는
					회원만 이용할 수 있는 서비스입니다.</font><br> 로그인 후 이용하여 주세요<br> <br> <input
					type="button" value="로그인 페이지로 이동하기" class="btn btn-default"
					id="questionLoginBtn">
			</div>
		</c:if>

	</div>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>