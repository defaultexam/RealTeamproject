<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function go(){
	window.location.href="/manager";
}
</script>

</head>
<body>
	<div class="contentContainer">
		<h2>관리자 페이지</h2>
		<hr>
		<div class="container">
			<br> <font style="text-decoration: underline">관리자만 이용가능한
				페이지입니다.</font><br> 관리자 로그인 후 이용하여 주세요<br> <br> <input
				type="button" value="관리자 로그인 페이지로 이동하기" class="btn btn-default"
				id="questionLoginBtn" onclick="go();">
		</div>
	</div>
</body>
</html>