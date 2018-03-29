<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<style type="text/css">
aside {
	display: table-cell;
}

section {
	display: table-cell;
	min-height: 500px;
}

header {
	
}

footer {
	
}

#layoutContent {
	width: 90%;
	border-left-width: medium;
	border-right-width: medium;
}
</style>
</head>
<body>
	<div align="center">
		<header>
			<tiles:insertAttribute name="header" />
		</header>

		<section>
			<tiles:insertAttribute name="main" />
		</section>

		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>