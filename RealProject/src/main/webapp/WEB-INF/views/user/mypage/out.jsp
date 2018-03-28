<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#ok").click(function() {
			$("#outMember").attr({
				"method" : "POST",
				"action" : "/mypage/out"
			});
			$("#outMember").submit();
		});
		$("#cancelBtn").click(function() {
			window.location.href = "/mypage";
		});
	});
</script>
</head>
<body>
	<h3 align="center" style="font-weight: 700">회원 탈퇴</h3>
	<hr>
	<form id="outMember" method="POST">
		<div class="container">
			<div align="center" class="well">
				<h3>${out.name}님, 정말 회원 탈퇴를 진행하시겠습니까?</h3>
				<input type="hidden" id="no" name="no" value="${out.member_no }">
				<br>
				<p>예약중인 내역이 존재할 경우, 회원 탈퇴는 불가능 합니다.</p>

				<p>회원 탈퇴를 진행시, 회원등급과 포인트는 복구할 수 없으며</p>

				<p>확인버튼을 누르면 회원탈퇴를 진행합니다.</p>
				<br>
				<h6 align="center"><font color="red">경고!</font> 회원 탈퇴를 진행할 경우, 복구는 불가능합니다! 신중히 결정해주세요.</h6>
				<input type="button" id="ok" value="확인"
					class="btn btn-default"> &nbsp;<input type="button"
					value="취소" id="cancelBtn" class="btn btn-default">
			</div>
		</div>
	</form>
</body>
</html>