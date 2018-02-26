<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<meta http-equiv="refresh" content="3; url=/">
<!-- <script type="text/javascript">
	/* 3초 후에 페이지 이동 */
	function onLoading() {
		oInterval = window.setInterval("afterTime()", 3000);
	}
	function afterTime() {
		window.clearInterval(oInterval);
		window.location.href = '/';
	}
</script> -->
<body>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h1 class="panel-title">회원가입 성공</h1>
		</div>
		<div class="panel-body">
			<h4>
				저희 레스토랑에 가입해주신 것을 진심으로 환영합니다.<br />
			</h4>
			<h4>
				3초 후에 자동으로 메인 페이지로 이동합니다. <br />
			</h4>
			<a href="/"><font size="2">여기를 누르시면 바로 이동합니다.</font></a>
		</div>
	</div>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
</body>
</html>
