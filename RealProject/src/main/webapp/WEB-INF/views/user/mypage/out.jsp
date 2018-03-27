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
			window.location.href="/mypage";
		});
	});
</script>
</head>
<body>
	<form id="outMember" method="POST">
		<div class="container">
			<div align="center" class="well">
				<h3>${out.name}님 회원탈퇴를 하시겠습니까?</h3>
				<input type="hidden" id="no" name="no" value="${out.member_no }"> <br>
				<p>회원 탈퇴를 진행하게 되면 회원등급과 포인트는 복구할 수 없으며</p>
				<p>예약중인 내역이 있다면 회원 탈퇴가 불가능 합니다.</p>
				<p>확인버튼을 누르면 회원탈퇴를 진행합니다.</p>
				<br> <br> <input type="button" id="ok" value="확인">
				<input type="button" value="취소" id="cancelBtn">
			</div>
		</div>
	</form>
</body>
</html>