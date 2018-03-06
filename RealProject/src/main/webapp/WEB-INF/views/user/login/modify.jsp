<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<style>
.list-group-size {
	padding-left: 15px;
	padding-right: 15px;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 로그인중이 아닐 경우 -->
		<input type="hidden" id="confirmnumber">
		<c:if test="${login.id == null or login.id == ''}">
			<div class="panel panel-default" style="border: 1px solid #ccc;">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<p align="center" style="font-size: 25px;">
						<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
						<strong>아이디/비밀번호 찾기</strong>
					</p>
				</div>
				<br />
				<!-- 이름+이메일 아이디찾기 -->
				<form style="width: 700px; border: 1px solid #ccc;"
					class="center-block" id="idsearchform" method="post"
					target="/member/searchID">
					<div class="row">
						<div class="panel-body">
							<p class="text-center">
								<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span><b><font
									size="4px"> 아이디 찾기</font></b> <br />이름, 가입시 등록한 이메일 인증 후 아이디를 찾을 수
								있습니다.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-inline" style="padding-left: 20px;">
								<label for="searchid_name">이름</label> <input type="text"
									class="form-control" id="searchid_name" style="width: 650px;">
								<p class="form-control-static error"></p>
								<br /> <label for="searchid_email">이메일</label> <input
									type="email" class="form-control" id="searchid_email"
									style="width: 650px;">
								<p class="form-control-static error"></p>
							</div>
							<br /> <input type="button" class="btn btn-default center-block"
								id="btn_idsearch" value="아이디 찾기"
								style="padding-left: 35px; padding-right: 35px;"><br />
						</div>
					</div>
				</form>
				<br />
				<!-- 아이디+이메일 비밀번호 재설정 -->
				<form style="width: 700px; border: 1px solid #ccc;"
					class="center-block" id="passwordsearchform" method="post"
					target="/member/passwordreset">
					<div class="row">
						<div class="panel-body">
							<p class="text-center">
								<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span><b><font
									size="4px"> 비밀번호 재설정</font></b> <br />아이디, 가입시 등록한 이메일 인증 후 비밀번호를
								재설정하실 수 있습니다.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-inline" style="padding-left: 20px;">
								<label for="searchpassword_id">아이디</label> <input type="text"
									class="form-control" id="searchpassword_id"
									style="width: 650px;">
								<p class="form-control-static error"></p>
								<br /> <label for="searchpassword_email">이메일</label> <input
									type="email" class="form-control" id="searchpassword_email"
									style="width: 650px;">
								<p class="form-control-static error"></p>
							</div>
							<br /> <input type="button" class="btn btn-default center-block"
								id="btn_passwordsearch" value="비밀번호 재설정"
								style="padding-left: 20px; padding-right: 20px;"> <br />
						</div>
						<br />
					</div>
				</form>
				<br />
				<!-- 비밀번호 재설정 -->
				<form style="width: 700px; border: 1px solid #ccc;"
					class="center-block hide" id="resetpassword" method="post"
					target="/member/passwordreset">
					<div class="row">
						<div class="panel-body">
							<p class="text-center">
								<span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span><b><font
									size="4px"> 비밀번호 재설정</font></b> <br />새롭게 변경하실 비밀번호를 입력해주세요.
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<div class="form-inline" style="padding-left: 20px;">
								<label for="searchpassword_id">비밀번호</label> <input
									type="password" class="form-control" id="reset_password1"
									style="width: 650px;">
								<p class="form-control-static error"></p>
								<br /> <label for="searchpassword_email">비밀번호 확인</label> <input
									type="password" class="form-control" id="reset_password2"
									style="width: 650px;">
								<p class="form-control-static error"></p>
							</div>
							<br /> <input type="button" class="btn btn-default center-block"
								id="btn_resetpassword" value="비밀번호 재설정"
								style="padding-left: 20px; padding-right: 20px;"> <br />
						</div>
						<br />
					</div>
				</form>
				<br />
			</div>
		</c:if>
		<!-- 로그인중일 경우-->
		<c:if test="${login.id != null and login.id != ''}">
			<div onload="onLoading();">
				잘못된 방식으로 접근하였습니다. <br /> 잠시 후 메인페이지로 이동합니다. <br /> <font size="1"><a
					href="/">여기를 눌르면 메인페이지로 바로 이동합니다.</a></font>
			</div>
		</c:if>
	</div>
	<div id="checkNumber" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">인증번호 확인</h4>
				</div>
				<div class="modal-body idclass">
					<label for="transferNumber">인증번호</label> <input type="text"
						class="form-control" id="transferNumber" name="transferNumber"
						placeholder="인증번호" required="required">
					<p class="form-control-static error"></p>
					<button type="button" id="transferButton"
						class="btn btn-outline-secondary">확인</button>
				</div>
				<div class="modal-footer">
					<button type="button" id="transferCheck"
						class="btn btn-outline-secondary">확인</button>
					<button type="button" class="btn btn-outline-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/modify.js"></script>
</body>