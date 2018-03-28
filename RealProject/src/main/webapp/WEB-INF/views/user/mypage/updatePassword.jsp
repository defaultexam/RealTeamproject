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
				$("#Check").attr({
					"method" : "POST",
					"action" : "/mypage/updatePassword"
				});
				$("#Check").submit();
			});
			$("#cancelBtn").click(function() {
				window.location.href = "/mypage";
			});
		});
	</script>
	<h3 align="center" style="font-weight: 700">내 정보 수정</h3>
	<hr>
	<form id="Check" method="POST">
		<div class="container">
			<div align="center" style="padding-left: 100px;">
				<br /> <br />
				<div class="well" style="width: 400px;">
					<br />
					<p><strong>본인 확인을 위해 비밀번호를 한번 더 입력 해 주세요.</strong></p>
					<br /> <br /> <input type="password" id="password"
						name="password" class="form-control"><br> <input
						type="button" id="ok" value="확인" class="btn btn-default">
					<input type="button" value="취소" id="cancelBtn"
						class="btn btn-default">
				</div>
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
				alert("비밀번호가 일치하지 않습니다. " + ${retry} + "회");
				break;
			}
		}
	});
	</script>
</body>