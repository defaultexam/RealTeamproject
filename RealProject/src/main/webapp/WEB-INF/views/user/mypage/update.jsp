<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/update.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {

		var memberno = "<c:out value='${update.member_no}'/>";
		console.log(memberno);

		$("#updateBtn").click(function() {


			$("#email").val($("#email1").val() + "@" + $("#email2").val());
			$("#address").val(
				$("#postcode").val() + "▒" + $("#roadAddress").val() + "▒" + $("#jibunAddress").val()
			);
			if ($("#weddingdate").val() == "")
				$("#weddingdate").val("9999-12-31");


			$("#update").attr({
				"method" : "POST",
				"action" : "/mypage/update"
			});
			$("#update").submit();
		});

		$("#cancelBtn").click(function() {
			alert("d");
		});

		var marriage = "<c:out value='${update.marriage}' />";
		console.log(marriage);
		if (marriage == 1) {
			$("#mihon").attr({
				"checked" : "checked"
			});

		} else {
			$("#gihon").attr({
				"checked" : "checked"
			});
		}

		var ap = '${update.email}'.split('@');
		$("#email1").attr({
			"value" : ap[0]
		});
		$("#email2").attr({
			"value" : ap[1]
		});

		var juso = '${update.address}'.split('▒');
		$("#postcode").attr({
			"value" : juso[0]
		});
		$("#roadAddress").attr({
			"value" : juso[1]
		});
		$("#jibunAddress").attr({
			"value" : juso[2]
		});
	});

	// 비밀번호와 비밀번호 확인 일치 여부 확인 
	function passwordCheck() {
		if ($("#password").val() != $("#repassword").val()) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			$("#repassword").focus();
			$("#repassword").val("");
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<form id="update">

		<!-- 아이디 -->
		<div>
			<label>아이디</label> <label>${update.id }</label> <input type="hidden"
				value="${update.id }" name="id"> <input type="hidden"
				value="${update.member_no }" name="no">
		</div>

		<!-- 비밀번호 -->
		<div>
			<label>비밀번호</label> <input type="password" id="password"
				name="password"> <label>비밀번호 확인</label> <input
				type="password" id="repassword" onblur="passwordCheck()">
		</div>

		<!-- 이름 -->
		<div>
			<label>이름</label> <label>${update.name }</label>
		</div>

		<!-- 성별 -->
		<div>
			<label>성별</label> <label> <c:set value="${update.gender }"
					var="gender"></c:set> <c:choose>
					<c:when test="${gender == '1'}">
										남성</c:when>
					<c:otherwise>여성</c:otherwise>
				</c:choose>
			</label>
		</div>

		<!-- 생년월일 -->
		<div>
			<label>생년월일</label> <label>${update.birthday }</label>

		</div>

		<!-- 이메일 -->
		<div>
			<label>이메일</label> <input type="text" id="email1" name="email1"
				placeholder="" required="required"> <label for="email2">@</label>
			<input type="text" id="email2" name="email2" placeholder=""
				required="required">
			<button type="button" id="btnEmail" class="btn btn-default">인증번호
				받기</button>
			<p class="form-control-static error"></p>
			<input type="hidden" id="email" name="email">
		</div>

		<!-- 전화번호 -->
		<div>
			<label>전화번호</label> <input type="text" name="phone"
				value="${update.phone }">
		</div>

		<!-- 주소 -->
		<div class="input-group">
			<div class="input-group">
				<input type="text" class="form-control" name="postcode"
					id="postcode" placeholder="우편번호" required="required"
					style="z-index: 0;" readonly="readonly"> <span
					class="input-group-btn">
					<button class="btn btn-outline-secondary"
						onclick="execDaumPostcode()" type="button">
						<span class="glyphicon glyphicon-search" aria-hidden="true">
						</span>주소 검색
					</button> <br />
				</span>
			</div>
			<input type="text" class="form-control" name="roadAddress"
				id="roadAddress" placeholder="도로명주소" required="required"
				style="z-index: 0;" readonly="readonly"><br /> <input
				type="text" class="form-control" name="jibunAddress"
				id="jibunAddress" placeholder="추가 입력" required="required"
				style="z-index: 0;"> <input type="hidden" id="address"
				name="address">
			<p class="form-control-static error"></p>
		</div>

		<!-- 결혼여부 -->
		<div>
			<label>결혼여부</label> <input type="radio" value="1" id="mihon"
				name="marriage">미혼 <input type="radio" value="2"
				name="marriage" id="gihon">기혼
		</div>

		<!-- 결혼 기념일 -->
		<div>
			<label>결혼기념일</label> <input type="text" required
				pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" id="weddingdate"
				name="weddingdate"
				value="${update.weddingdate.toString().substring(0,10) }">
		</div>

		<!-- 직업 -->
		<div>
			<label>직업</label> <input type="text" name="job"
				value="${update.job }">
		</div>

		<div>
			<input type="button" id="updateBtn" value="수정"> <input
				type="button" id="updateCancel" value="취소">
		</div>

	</form>

	<div id="modalemail" class="modal fade">
		<form id="emailForm" class="form-inline">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">이메일 인증</h4>
					</div>
					<div class="modal-body emailclass">
						입력하신 이메일로 인증번호가 발송되었습니다! <br /> <br /> <label for="txtemail">인증번호*</label>
						<input type="text" class="form-control" id="txtemail"
							name="txtemail" placeholder="인증번호" required="required"> <input
							type="button" id="btnEmailCheck"
							class="btn btn-outline-secondary" value="인증번호 확인"> <br />
						<p class="form-control-static error"></p>
						<input type="hidden" id="emailsended" name="emailsended">
					</div>
					<div class="modal-footer">
						<button type="button" id="emailCheck"
							class="btn btn-outline-secondary">확인</button>
						<button type="button" class="btn btn-outline-secondary"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/resources/include/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
	
		$("#weddingdate").datepicker({
			maxDate : "+d",
			dateFormat : 'yy-mm-dd',
			dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
			monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
			defaultDate : "1990-01-01",
			prevText : "이전달",
			nextText : "다음달",
			changeMonth : true,
			changeYear : true,
			yearRange : "1900:2018",
			dateFormat : "yy-mm-dd",
			onSelect : function(dateText, inst) {}
		});
	</script>
</body>