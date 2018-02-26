<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<style>
.aligncenter {
	padding-left: 45%;
}
</style>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}" />';
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환. 
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break; case 3:
				alert("회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다.\n다시 시도해 주세요");
				break; case 6:
				alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요");
				break;
			}
		}
	}

	/* 3초 후에 페이지 이동 */
	function onLoading() {
		oInterval = window.setInterval("afterTime()", 3000);
	}
	function afterTime() {
		window.clearInterval(oInterval);
		window.location.href = '/';
	}
</script>
</head>
<body>
	<div class="container">
		<c:if test="${login.id == null or login.id == ''}">
			<form id="loginForm" class="form-horizontal" method="post">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h1 class="panel-title">로그인</h1>
					</div>
					<div class="panel-body">
						<div class="form-group col-md-12">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="id" name="id" placeholder="아이디">
							<p class="form-control-static error"></p>
						</div>
						<div class="form-group col-md-12">
							<label for="password">비밀번호</label> <input type="password"
								class="form-control" id="password" name="password"
								placeholder="비밀번호">
							<p class="form-control-static error"></p>
						</div>
						<div class="form-group col-md-12 aligncenter">
							<input type="button" value="로그인" id="loginBtn"
								class="btn btn-default" /> <input type="button" value="취소"
								id="loginCancel" class="btn btn-default" />
						</div>
					</div>
				</div>
			</form>
		</c:if>
		<c:if test="${login.id != null and login.id != ''}">
			<div class="container" onload="onLoading();">
				로그인 상태입니다.<br /> 3초 후 메인 페이지로 이동합니다.
			</div>
		</c:if>
	</div>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/login.js"></script>

</body>