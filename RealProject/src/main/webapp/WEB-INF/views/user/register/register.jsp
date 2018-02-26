<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="UTF-8" />
<head>
<style>
.tdsize {
	width: 120px;
	height: 40px;
}

.tdsize2 {
	width: 550px;
}

.contentalign {
	padding-top: 5%;
	padding-left: 20%;
}

.alignbutton {
	padding-top: 25px;
	padding-left: 30%;
}
</style>
<script type="text/javascript" src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/register.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<!-- 아이디 중복체크 모달창 -->
	<div id="idcheck" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">아이디 중복체크</h4>
				</div>
				<div class="modal-body idclass">
					<label for="transferid">아이디*</label> <input type="text"
						class="form-control" id="modalid" name="modalid" placeholder="아이디"
						required="required">
					<p class="form-control-static error"></p>
					<button type="button" id="transferButton"
						class="btn btn-outline-secondary">중복 확인</button>
				</div>
				<div class="modal-footer">
					<button type="button" id="transferId"
						class="btn btn-outline-secondary">확인</button>
					<button type="button" class="btn btn-outline-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid contentalign">
		<form id="registerForm" class="form-inline">
			<div class="row">
				<div class="col-md-12 form-group" id="iddiv">
					<table class="table-hover">
						<tr class="idclass">
							<td class="tdsize"><label for="id">아이디*</label></td>
							<td class="tdsize2"><input type="text" disabled="disabled"
								class="form-control" id="noid" name="noid" placeholder="아이디"
								required="required">
								<button type="button" id="idConfirmBtn" class="btn btn-default"
									data-toggle="modal" data-target="#idcheck">중복체크</button> <input
								type="hidden" class="form-control" id="id" name="id"
								placeholder="아이디" required="required">
								<p class="form-control-static error"></p></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group" id="passdiv">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="password">비밀번호*</label></td>
							<td class="tdsize2"><input type="password"
								class="form-control" id="password" name="password"
								placeholder="비밀번호" required="required">
								<p class="form-control-static error"></p></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group" id="repassdiv">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="input_repassword">비밀번호
									확인*</label></td>
							<td class="tdsize2"><input type="password"
								class="form-control" id="repassword" name="repassword"
								placeholder="비밀번호 확인" required="required"
								onchange="{passwordCheck(); idPwdCheck();}">
								<p class="form-control-static error"></p></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="input_name">이름(실명)*</label></td>
							<td class="tdsize2"><input type="text" class="form-control"
								id="name" name="name" placeholder="이름" required="required">
								<p class="form-control-static error"></p></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="gender">성별*</label></td>
							<td class="tdsize2"><input type="radio" id="gender"
								name="gender" value="1" checked="checked" /> 남자
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
								id="gender" name="gender" value="2" /> 여자</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="birthday">생년월일*</label></td>
							<td class="tdsize2"><input type="date" id="birthday"
								name="birthday" required="required" class="form-control"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="email1">이메일*</label></td>
							<td class="tdsize2"><input type="text" class="form-control"
								id="email1" name="email1" placeholder="" required="required">
								<label for="email2">@</label> <input type="text"
								class="form-control" id="email2" name="email2" placeholder=""
								required="required">
								<p class="form-control-static error"></p> <input type="hidden"
								id="email" name="email"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="phone">전화번호*</label></td>
							<td class="tdsize2"><input type="text" class="form-control"
								id="phone" name="phone" placeholder="" required="required">
								<p class="form-control-static error"></p></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="address">주소*</label></td>
							<td class="tdsize2">
								<div class="input-group">
									<div class="input-group">
										<input type="text" class="form-control" name="postcode"
											id="postcode" placeholder="우편번호" required="required"
											disabled="disabled"> <span class="input-group-btn">
											<button class="btn btn-outline-secondary"
												onclick="execDaumPostcode()" type="button">
												<span class="glyphicon glyphicon-search" aria-hidden="true">
												</span>주소 검색
											</button> <br />
										</span>
									</div>
									<input type="text" class="form-control" name="roadAddress"
										id="roadAddress" placeholder="도로명주소" required="required"
										disabled="disabled"><br /> <input type="text"
										class="form-control" name="jibunAddress" id="jibunAddress"
										placeholder="추가 입력" required="required"> <input
										type="hidden" id="address" name="address">
									<p class="form-control-static error"></p>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="marriage">결혼여부</label></td>
							<td class="tdsize2"><input type="radio" id="marriage"
								name="marriage" value="1" checked="checked" /> 미혼
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
								name="marriage" value="2" /> 기혼</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="weddingdate">결혼 기념일</label></td>
							<td class="tdsize2"><input type="date" class="form-control"
								id="weddingdate" name="weddingdate"></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<table class="table-hover">
						<tr>
							<td class="tdsize"><label for="job">직업</label></td>
							<td class="tdsize2"><input type="text" class="form-control"
								id="job" name="job" placeholder=""></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group alignbutton">
					<input type="button" value="가입" id="registerConfirm"
						class="btn btn-outline-secondary" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="취소"
						id="registerCancel" class="btn btn-outline-secondary" />
				</div>
			</div>
		</form>
	</div>

</body>