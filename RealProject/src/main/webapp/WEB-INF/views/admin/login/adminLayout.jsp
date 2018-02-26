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
	<center>
		<header>
			<tiles:insertAttribute name="header" />
		</header>

		<section>
			<tiles:insertAttribute name="main" />
		</section>

		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</center>


	<%-- <div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<tiles:insertAttribute name="left" />
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<tiles:insertAttribute name="sub" />
				<tiles:insertAttribute name="main" />
			</div>
		</div>
	</div> --%>


</body>
</html>