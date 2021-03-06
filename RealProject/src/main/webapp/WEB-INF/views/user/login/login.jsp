<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<link rel="stylesheet" href="/resources/include/css/jquery-ui.min.css">
<script type="text/javascript"
	src="/resources/include/js/jquery-ui.min.js"></script>
<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 엔터키 작동함수
		$("#password").keydown(function(key) {
			if (key.keyCode == 13) {
				// 키가 13이면 실행(엔터키가 13)
				userLoginEnter();
			}
		});
		var errCode = "<c:out value='${errCode}' />";
		if (errCode != "") {
			// 명확한 자료형 명시를 위해 errCode의 타입을 정수형으로 변환. 
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비밀번호 일치 하지 않거나 존재하지 않는 \n회원입니다. 다시 로그인해 주세요.");
				break;
			case 3:
				alert("회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다.\n다시 시도해 주세요");
				break;
			case 6:
				alert("5번이상 로그인 시도로 30초동안 로그인 할 수 없습니다.\n잠시 후 다시 시도해 주세요");
				break;
			case 7:
				alert("비밀번호를 입력을 5회 실패하여 로그아웃 됩니다.");
				break;
			}
		}
	});
	function userLoginEnter() {
		if (!formCheck($('#id'), $('.error:eq(0)'), "아이디를")) {
			return;
		} else if (!inputVerify(0, '#id', '.error:eq(0)')) {
			return;
		} else if (!formCheck($('#password'), $('.error:eq(1)'), "비밀번호를")) {
			return;
		} else if (!inputVerify(1, '#password', '.error:eq(1)')) {
			return;
		} else {
			runEffect();
			onLogin();
		}
	}
	function runEffect() {
		$("#effect").hide('highlight', "", 1000, callback);
	}
	/* 로그인 창 숨기고 3초후에 실행 */
	function onLogin() {
		loadInterval = window.setInterval("goNext()", 200);
	}
	function callback() {
		setTimeout(function() {
			$("#effect").removeAttr("style").hide().fade();
		}, 1000);
	}
</script>
<style type="text/css">
.aligncenter {
	padding-left: 37%;
}

.sizeoff {
	width: 500px;
}
</style>

</head>
<body>
	<div class="container" id="effect">
		<c:if test="${login.id == null or login.id == ''}">
			<form id="loginForm" class="form-horizontal" method="post"
				style="padding-top: 10%">
				<div class="panel panel-default sizeoff center-block">
					<div class="panel-heading">
						<h1 class="panel-title">로그인</h1>
					</div>
					<div class="panel-body">
						<div class="form-group col-md-12">
							<br /> <label for="id">아이디</label> <input type="text"
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
								class="btn btn-default" style="width: 150px;" />
						</div>
					</div>
				</div>
			</form>
			<div class="row" style="padding-left: 25%; padding-top: 5%;">
				<div class="col-xs-5">
					<font size="20px"><span class="glyphicon glyphicon-lock"
						aria-hidden="true"></span></font> <span style="position: fixed;">아이디
						또는 비밀번호를 분실하셨나요?</span> <input type="button"
						onclick="location.href='/member/modify'" value="아이디/비밀번호 찾기"
						id="btnlost" class="btn btn-default" />
				</div>
				<div class="col-xs-5">
					<font size="20px"><span class="glyphicon glyphicon-file"
						aria-hidden="true"></span></font> <span style="position: fixed;">아직도
						회원가입을 하지 않으셨나요?</span> <input type="button" value="회원가입" id="btnregister"
						class="btn btn-default" onclick="location.href='/register/terms'" />
				</div>
			</div>
		</c:if>
		<c:if test="${login.id != null and login.id != ''}">
			<div class="container" onload="onLoading();">
				로그인 상태입니다.<br /> 3초 후 메인 페이지로 이동합니다.
			</div>
		</c:if>
	</div>

</body>