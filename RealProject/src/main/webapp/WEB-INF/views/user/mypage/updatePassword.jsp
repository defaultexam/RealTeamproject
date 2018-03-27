<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$("#ok").click(function() {
				$("#pwCheck").attr({
					"method" : "POST",
					"action" : "/mypage/updatePassword"
				});
				$("#pwCheck").submit();
			});
			$("#cancelBtn").click(function() {
				alert("d");
			});
		});
	</script>
	<form id="pwCheck" method="POST">
		<div class="container">
			<div align="center" class="well">
				<h3>비밀번호 확인</h3>
				<br>
				<p>본인 확인을 위해 비밀번호를</p>
				<p>한번 더 입력 해 주세요.</p>
				<br> <input type="password" id="password" name="password"><br> <br> <br>
				<input type="button" id="ok" value="확인"> <input
					type="button" value="취소" id="cancelBtn">
			</div>
		</div>
	</form>
	<script type="text/javascript">
	$(function(){
		var errCode = '${errCode}';
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환. 
			switch (parseInt(errCode)) {
			case 1:
				alert("비밀번호가 일치하지 않습니다." + ${retry} + "회");
				break;
			case 3:
				alert("비밀번호를 입력을 5회 실패하여 로그아웃 됩니다.");
				break;
			}
		}
	});
	</script>
</body>