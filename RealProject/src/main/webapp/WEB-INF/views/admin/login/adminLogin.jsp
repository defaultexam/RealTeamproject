<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/adminLogin.js"></script>
<script type="text/javascript">
	function chkIdPw() {
		var checkCode = '<c:out value="${check}" />';
		if (checkCode != "") {
			alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않습니다. 다시 로그인해 주세요.");
		}
	}
</script>
<style type="text/css">
#logTol {
	border-style: solid;
	border-width: medium;
	width: 50%;
}

#logTol .ipl {
	border-top-style: solid;
	border-top-width: medium;
}
</style>
</head>
<body>
	<center>

		<label>관리자 로그인 서비스 입니다. 로그인 하시면 레스토랑 사이트관리를 하실 수 있습니다.</label>
		<div id="logTol">
			<h2>로그인</h2>
			<form id="loginForm">
				<div class="ipl">
					<label for="adminId"> 아 이 디 : </label> <input type="text"
						id="adminId" name="adminId" placeholder="ID">
					<p class="error">&nbsp;</p>
					<label for="adminPw"> 비밀번호 : </label> <input type="password"
						id="adminPw" name="adminPw" placeholder="Password">
					<p class="error">&nbsp;</p>
				</div>
				<div class="ipl">
					<input type="button" value="관리자로그인" id="loginBtn" />
				</div>
			</form>
		</div>
	</center>
</body>
</html>