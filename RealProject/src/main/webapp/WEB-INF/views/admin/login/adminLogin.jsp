<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/include/js/adminLogin.js"></script>
<script type="text/javascript">
	$(function() {
		// 엔터키 작동함수
		$("#adminPw").keydown(function(key) {
			if (key.keyCode == 13) {// 키가 13이면 실행(엔터키가 13)
				adminLoginEnter();
			}
		});
	});

	// 엔터키 작동 함수
	function adminLoginEnter() {
		if (!formCheck($('#adminId'), $('.error:eq(0)'), "아이디를")) {
			// $('.error:eq(1)').html("");
			return;
		} else if (!formCheck($('#adminPw'), $('.error:eq(1)'), "비밀번호를")) {
			// $('.error:eq(0)').html("");
			return;
		} else {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/admin/login.do"
			});
			$("#loginForm").submit();
		}
	}

	function chkIdPw() {
		var checkCode = '<c:out value="${check}" />';
		if (checkCode != "") {
			alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않습니다. 다시 로그인해 주세요.");
		}
	}
</script>
<style type="text/css">
.panel-default {
	width: 700px;
}

.container {
	padding-top: 10%;
}
</style>
</head>
<body>
	<div class="container">
		<form id="loginForm" method="post">
			<div class="panel panel-default center-block" id="effect">
				<div class="panel-heading">
					<h1 class="panel-title text-center">관리자 로그인</h1>
				</div>
				<div class="panel-body">
					<label>관리자 로그인 서비스 입니다. 로그인 하시면 레스토랑 사이트관리를 하실 수 있습니다.</label>
					<div class="form-group col-md-12">
						<br /> <label for="adminId"> 아 이 디 : </label> <input type="text"
							id="adminId" name="adminId" placeholder="ID" class="form-control">
						<p class="error">&nbsp;</p>
					</div>
					<div class="form-group col-md-12">
						<label for="adminPw"> 비밀번호 : </label> <input type="password"
							id="adminPw" name="adminPw" placeholder="Password"
							class="form-control">
						<p class="error">&nbsp;</p>
					</div>
					<div class="form-group col-md-12" style="padding-left: 27.5%;">
						<input type="button" value="관리자로그인" id="loginBtn"
							class="btn btn-default"
							style="width: 300px; height: 50px; background-color: silver" />
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>