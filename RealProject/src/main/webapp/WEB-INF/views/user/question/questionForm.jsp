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

<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>


<script type="text/javascript">
	$(function() {

		/* 문의하기 버튼 클릭 시 */
		$("#questionInsertBtn").click(function() {
			var qutype = $('#question_type').val();

			alert(qutype);
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

				/* $.ajax({
					url : "/question/questionInsert.do",
					type : "post",
					data : {"question_type=" + $('#question_type').val(),
					"question_title=" + $('#question_title').val(),
					"question_file=" + $('#question_file').val()},
					error : function() {
						alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
					},
					success : function(resultData) {

					}
				}); */
			}

		});
	});
</script>

</head>

<body>
	<!-- 1:1 문의 글쓰기 -->
	<div class="contentContainer">
		<h2>1:1 문의</h2>
		<hr>
		<ul>
			<li>레스토랑의 이용 / 온라인 예약 / 홈페이지 관련 1:1 문의입니다.</li>
			<li>1:1 문의는 평일 09:00 ~ 17:00까지 이며, 문의 답변은 3일 이내 가능합니다.<br>
				<font style="text-decoration: underline">(마이 페이지에서 확인하실 수
					있습니다.)</font></li>
		</ul>

		<div class="contentTB">
			<form id="questionForm" enctype="multipart/form-data">
				<table id="questionWrite">
					<tr>
						<th scope="row" class="ac">이름</th>
						<td><input type="text" id="name" value="${login.name}"
							readonly="readonly"> <input type="hidden"
							name="member_no" value="${login.member_no }"></td>
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
						<td><select id="question_type" name="question_type">
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
			<input type="button" value="취소" class="btn btn-default"
				id="questionCancel"> <input type="button" value="문의하기"
				class="btn btn-default" id="questionInsertBtn">
		</div>

	</div>
</body>
</html>