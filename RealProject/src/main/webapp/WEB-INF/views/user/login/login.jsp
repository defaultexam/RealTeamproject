<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<style>
.aligncenter {
	padding-left: 37%;
}

.sizeoff {
	width: 500px;
}
</style>
<link rel="stylesheet" href="/resources/include/css/jquery-ui.min.css">
<script type="text/javascript"
	src="/resources/include/js/jquery-ui.min.js"></script>
</head>
<body>
	<div class="container">
		<c:if test="${login.id == null or login.id == ''}">
			<form id="loginForm" class="form-horizontal" method="post"
				style="padding-top: 10%">
				<div class="panel panel-default sizeoff center-block" id="effect">
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
								class="btn btn-default" /> <input type="button" value="취소"
								id="loginCancel" class="btn btn-default" />
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
						class="btn btn-default" onclick="location.href='/register'" />
				</div>
			</div>
		</c:if>
		<c:if test="${login.id != null and login.id != ''}">
			<div class="container" onload="onLoading();">
				로그인 상태입니다.<br /> 3초 후 메인 페이지로 이동합니다.
			</div>
		</c:if>
	</div>
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	<script type="text/javascript" src="/resources/include/js/login.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>