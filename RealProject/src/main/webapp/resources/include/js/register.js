function errCodeCheck() {
	var errCode = '<c:out value="${errCode}" />';
	if (errCode != '') {
		switch (parseInt(errCode)) {
		case 1:
			alert("이미 가입된 회원입니다!");
			break;
		case 2:
			alert("회원가입 처리가 실패하였습니다.  잠시 후 다시 시도해 주십시오.");
			break;
		}
	}
}
function sendMail(email) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4) {
			if (xhttp.status == 200)
				console.log("메일 정상");
			else
				console.log("메일 비정상");
		}
	};
	var email = $("#email").val();
	$.ajax({
		url : "/register/sendMail",
		type : "post",
		data : "email=" + $("#email").val(),
		error : function() {
			alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			$("#emailsended").val(resultData);
			if (resultData >= 0) {
				console.log(email + " 인증번호 전송 성공");
			} else {
				console.log(email + " 인증번호 전송 실패");
			}
		}
	});
	return false;
}

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

// 아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var userId = $("#id").val();
	var userPw = $("#password").val();
	if (userId == "") return true;
	if (userPw.indexOf(userId) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#password").val("");
		$("#password").focus();
		return false;
	} else {
		return true;
	}
}

var idConfirm = 1;
var emailChecked = 0;

$(function() {
	errCodeCheck();
	// 사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = [
		"영문,숫자만 가능. 6 ~ 12자로 입력해 주세요", /*아이디 중복체크 모달*/
		"", /*아이디*/
		"영문,숫자,특수문자만 가능. 8 ~ 15자 입력해 주세요.", /*비밀번호*/
		"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.", /*비밀번호 확인*/
		"", /*이름*/
		"", /*생일*/
		"", /*이메일*/
		"", /*이메일*/
		"- 포함 입력해 주세요. 예시) 010-0000-0000", /*전화번호*/
		"" /*주소*/
	];
	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});
	$('#modalid, #id, #password, #repassword, #name, #birthday, #email1, #email2, #phone, #jibunAddress').bind("focus", function() {
		var idx = $("#modalid, #id, #password, #repassword, #name, #birthday, #email1, #email2, #phone, #jibunAddress").index(this);
		$(this).parents(".form-group").find(".error").html(message[idx]);
		$(this).parents(".form-group").find(".error").css("color", "#000000");
	});
	let modaldiv = document.getElementById("idcheck");
	let iddiv = document.getElementById("iddiv");
	let passdiv = document.getElementById("passdiv");
	let repassdiv = document.getElementById("repassdiv");
	let id = document.getElementById("modalid");
	$("#transferButton").click(
		function() {
			if (!formCheck($('#modalid'), $('.error:eq(0)'), "아이디를"))
				return;
			else if (!inputVerify(0, '#modalid', '.error:eq(0)'))
				return;else {
				$.ajax({
					url : "/register/userIdConfirm",
					type : "post",
					data : {
						"userId" : $("#modalid").val()
					},
					error : function() {
						alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
					},
					success : function(resultData) {
						console.log("resultData : " + resultData);
						if (resultData == "1") {
							$("#modalid").parents(
								".idclass").find(
								".error").html(
								"현재 사용 중인 아이디입니다.");
							iddiv.classList.add("form-group", "has-warning");
						} else if (resultData == "2") {
							$("#modalid").parents(
								".idclass").find(
								".error").html(
								"사용 가능한 아이디입니다.");
							$("#id").parents(
								".idclass").find(
								".error").html(
								"사용 가능한 아이디입니다.");
							$("#id").parents(
								".idclass").find(
								".error").css("color", "#2F9D27");
							idConfirm = 2;
							iddiv.classList.remove('has-error');
							iddiv.classList.remove('has-warning');
							iddiv.classList.add("form-group", "has-success");
						}
					}
				});
			}
		});

	$("#btnEmail").click(
		function() {
			$("#email").val($("#email1").val() + "@" + $("#email2").val());
			if (!formCheck($('#email1'), $('.error:eq(8)'), "이메일 주소를")) {
				return;
			} else if (!formCheck($('#email2'), $('.error:eq(8)'), "이메일 주소를")) {
				return;
			}
			$.ajax({
				url : "/register/checkEmail",
				type : "post",
				data : {
					"email" : $("#email").val()
				},
				error : function() {
					alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					console.log("resultData : " + resultData);
					if (resultData == 0 || resultData == 1) {
						$("#modalemail").modal('show');
						var email = document.getElementById("email").value;
						if ($("#emailsended").val() >= 1) {
							$('.error:eq(8)').css("color", "#000099").html("이미 인증번호가 전송되었습니다.");
							return;
						}
						var abc = sendMail(email);
						$('.error:eq(8)').css("color", "#000099").html(abc);
					} else if (resultData == "2") {
						alert("회원 정보가 존재하는 이메일입니다.");
					}
				}
			});
		}
	);
	$("#emailCheck").click(
		function() {
			if (emailChecked == 0) {
				$('.error:eq(8)').css("color", "#000099").html("이메일 인증을 완료해주세요.");
			} else {
				$("#modalemail").modal('hide');
			}
		}
	);
	$("#btnEmailCheck").click(
		function() {
			if ($("#txtemail").val() == $("#emailsended").val() && $("#emailsended").val() != "" && $("#txtemail").val() != "") {
				console.log($("#emailsended").val());
				$('.error:eq(8)').css("color", "#2F9D27").html("인증 성공!");
				emailChecked = 1;
				$("#email1").attr("readonly", "readonly");
				$("#email2").attr("readonly", "readonly");
			} else {
				$('.error:eq(8)').css("color", "#000099").html("인증 실패.");
				emailChecked = 0;
			}
		}
	);
	$("#transferId").click(
		function() {
			if (idConfirm != 2) {
				alert("아이디 중복 체크 진행해 주세요.");
				return;
			} else {
				$("#noid").val($(id).val());
				$("#id").val($(id).val());
				$("#idcheck").modal('toggle');
			}
		});
	$("#modalid").bind("blur", function() {
		if (!formCheck($('#modalid'), $('.error:eq(0)'), "아이디를")) {
			iddiv.classList.add("form-group", "has-error");
			modaldiv.classList.add("form-group", "has-error");
			return;
		} else if (!inputVerify(0, '#modalid', '.error:eq(0)')) {
			iddiv.classList.add("form-group", "has-error");
			modaldiv.classList.add("form-group", "has-error");
			return;
		} else {
			iddiv.classList.remove('has-error');
			modaldiv.classList.remove('has-error');
			iddiv.classList.add("form-group", "has-success");
			modaldiv.classList.add("form-group", "has-success");
		}
	});
	$("#password").bind("blur", function() {

		if (!formCheck($('#password'), $('.error:eq(2)'), "비밀번호를")) {
			passdiv.classList.add("form-group", "has-error");
			return;
		} else if (!inputVerify(1, '#password', '.error:eq(2)')) {
			passdiv.classList.add("form-group", "has-error");
			return;
		} else if (!idPwdCheck())
			return;else {
			passdiv.classList.remove('has-error');
			passdiv.classList.add("form-group", "has-warning");
		}
	});
	$("#repassword").bind("blur", function() {
		if (!formCheck($('#repassword'), $('.error:eq(3)'),
				"비밀번호 확인을")) {
			repassdiv.classList.add("form-group", "has-error");
			return;
		} else if (!inputVerify(1, '#repassword', '.error:eq(3)')) {
			repassdiv.classList.add("form-group", "has-error");
			return;
		} else if (!passwordCheck()) {
			repassdiv.classList.add("form-group", "has-error");
			return;
		} else {
			passdiv.classList.remove('has-warning');
			repassdiv.classList.remove('has-error');
			passdiv.classList.add("form-group", "has-success");
			repassdiv.classList.add("form-group", "has-success");
		}
	});
	$("#name").bind("blur", function() {
		if (!formCheck($('#name'), $('.error:eq(4)'), "이름을"))
			return;
	});
	$("#email1").bind("blur", function() {
		if (!formCheck($('#email1'), $('.error:eq(5)'), "이메일 주소를"))
			return;
	});
	$("#email2").bind("blur", function() {
		if (!formCheck($('#email2'), $('.error:eq(5)'), "이메일 주소를"))
			return;
	});
	$("#phone").bind("blur", function() {
		if (!formCheck($('#phone'), $('.error:eq(6)'), "전화번호를"))
			return;
	});
	$("#jibunAddress").bind("blur", function() {
		if (!formCheck($('#address'), $('.error:eq(7)'), "주소를"))
			return;
	});
	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#registerConfirm").click(
		function() {
			// 입력값 체크
			if (!formCheck($('#modalid'), $('.error:eq(0)'), "아이디를")) {
				$('.error:eq(1)').css("color", "#000099").html("아이디를 입력해주세요.");
				return;
			} else if (!inputVerify(0, '#modalid', '.error:eq(0)'))
				return;
			else if (!formCheck($('#password'), $('.error:eq(2)'), "비밀번호를"))
				return;
			else if (!inputVerify(1, '#password', '.error:eq(2)'))
				return;
			else if (!idPwdCheck())
				return;
			else if (!formCheck($('#repassword'), $('.error:eq(3)'),
					"비밀번호 확인을"))
				return;
			else if (!inputVerify(1, '#repassword', '.error:eq(3)'))
				return;
			else if (!passwordCheck())
				return;
			else if (!formCheck($('#name'), $('.error:eq(4)'), "이름을"))
				return;
			else if (!formCheck($('#email1'), $('.error:eq(5)'), "이메일 주소를"))
				return;
			else if (!formCheck($('#email2'), $('.error:eq(5)'), "이메일 주소를"))
				return;
			else if (!formCheck($('#phone'), $('.error:eq(6)'), "전화번호를"))
				return;
			else if (!inputVerify(2, '#phone', '.error:eq(6)'))
				return;
			else if (!formCheck($('#address'), $('.error:eq(7)'), "주소를"))
				return;
			else if (idConfirm != 2) {
				alert("아이디 중복 체크 진행해주세요.");
				return;
			} else if (emailChecked == 0) {
				alert("이메일 인증을 진행해주세요.");
				return;
			} else {

				$("#email").val($("#email1").val() + "@" + $("#email2").val());
				$("#address").val(
					$("#postcode").val() + " " + $("#roadAddress").val() + " " + $("#jibunAddress").val()
				);
				if ($("#weddingdate").val() == "")
					$("#weddingdate").val("9999-12-31");
				$("#registerForm").attr({
					"method" : "post",
					"action" : "/register/confirm"
				});
				$("#registerForm").submit();
			}
		});
	$("#registerCancel").click(function() {
		location.href = "/";
	});
});

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('roadAddress').value = fullAddr;
			document.getElementById('jibunAddress').focus();
			$("#address").val("주소입력완료");
		}
	}).open();
}