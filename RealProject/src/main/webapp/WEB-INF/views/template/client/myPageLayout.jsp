<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link rel="icon" href="/resources/images/common/icon.png"> -->
<title><tiles:getAsString name="title" /></title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">
<style>
body {
	padding-top: 20px;
}

.side {
	float: left;
	height: 600px;
	width: 150px;
}
</style>

</head>
<body>

	<div class="container">
		<tiles:insertAttribute name="menu" />
		<div class="side">
			<tiles:insertAttribute name="sidemenu" />
		</div>
		<tiles:insertAttribute name="body" />
	</div>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>

	<!-- JS 파일 -->
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>
