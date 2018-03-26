
/* 3초 후에 페이지 이동 */
function onLoading() {
	oInterval = window.setInterval("afterTime()", 3000);
}
function afterTime() {
	window.clearInterval(oInterval);
	window.location.href = '/';
}
/*인증번호 전송 메소드*/
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
	$.ajax({
		url : "/register/sendMail",
		type : "post",
		data : "email=" + $("#searchpassword_email").val(),
		error : function() {
			alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			$("#confirmnumber").val(resultData);
			if (resultData >= 0) {
				console.log($("#searchpassword_email").val() + " 인증번호 전송 성공");
			} else {
				console.log($("#searchpassword_email").val() + " 인증번호 전송 실패");
			}
		}
	});
	return false;
}

//아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var userId = $("#searchpassword_id").val();
	var userPw = $("#reset_password1").val();
	if (userId == "") return true;
	if (userPw.indexOf(userId) > -1) {
		$('.error:eq(5)').css("color", "#000099").html("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#reset_password1").val("");
		$("#reset_password1").focus();
		return false;
	} else {
		return true;
	}
}

function passwordChange() {
	$.ajax({
		url : "/member/passwordreset",
		type : "post",
		data : {
			"searchpassword_id" : $("#searchpassword_id").val(),
			"reset_password1" : $("#reset_password1").val()
		},
		error : function() {
			alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultData) {
			console.log(resultData);
			alert("비밀번호가 성공적으로 변경되었습니다!\n로그인 창으로 이동합니다.");
			location.href = "/login";
		}
	});
}

$(function() {
	$("#btn_idsearch").click(function() {
		/* 유효성 검사 */
		if (!formCheck($('#searchid_name'), $('.error:eq(0)'), "이름을"))
			return;
		else if (!formCheck($('#searchid_email'), $('.error:eq(1)'), "이메일을"))
			return;

		/* 아이디 찾기 POST 진행 */
		$.ajax({
			url : "/member/searchID",
			type : "post",
			data : {
				"searchid_name" : $("#searchid_name").val(),
				"searchid_email" : $("#searchid_email").val()
			},
			error : function() {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
			},
			success : function(resultData) {
				console.log("데이터베이스 검색으로 출력된 아이디: " + resultData);
				if (resultData == null || resultData == "") {
					alert("일치하는 정보가 없습니다.");
					return;
				} else {
					alert("회원님의 아이디는 '" + resultData + "' 입니다.");
					return;
				}
			}
		});
	});

	/*비밀번호 재설정 진행*/
	$("#btn_passwordsearch").click(function() {
		/* 유효성 검사 */
		if (!formCheck($('#searchpassword_id'), $('.error:eq(2)'), "이름을"))
			return;
		else if (!inputVerify(0, '#searchpassword_id', '.error:eq(2)'))
			return;
		else if (!formCheck($('#searchpassword_email'), $('.error:eq(3)'), "이메일을"))
			return;
		/*이메일 전송을 이미 했을 경우*/
		if ($("#confirmnumber").val() >= 1) {
			$('.error:eq(6)').css("color", "#000099").html("이미 인증번호가 전송되었습니다.");
			return;
		}
		/* 아이디 유효성 POST 진행 */
		$.ajax({
			url : "/member/searchPassword",
			type : "post",
			data : {
				"searchpassword_id" : $("#searchpassword_id").val(),
				"searchpassword_email" : $("#searchpassword_email").val()
			},
			error : function() {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
			},
			success : function(resultData) {
				console.log("데이터베이스 검색으로 출력된 아이디: " + resultData);
				if (resultData == null || resultData == "") {
					console.log("일치하는 정보가 없습니다.");
					return;
				} else {
					console.log("일치하는 데이터 '" + resultData + "' 존재.");
					sendMail($("#seachpassword_email").val());
					$("#checkNumber").modal('show');
					$('.error:eq(6)').css("color", "#000099").html("인증번호를 입력해주세요.");
					return;
				}
			}
		});
	});
	/*인증번호 모달 확인*/
	let idsearchform = document.getElementById("idsearchform");
	let passwordsearchform = document.getElementById("passwordsearchform");
	let resetpassword = document.getElementById("resetpassword");
	$("#transferButton").click(
		function() {
			if ($("#transferNumber").val() == $("#confirmnumber").val() && $("#confirmnumber").val() != "" && $("#transferNumber").val() != "") {
				$('.error:eq(6)').css("color", "#000099").html("인증 성공!");
				idsearchform.classList.add("hide");
				passwordsearchform.classList.add("hide");
				resetpassword.classList.remove("hide");
			} else {
				$('.error:eq(6)').css("color", "#000099").html("인증 실패.");
			}
		}
	);
	$("#transferCheck").click(function() {
		$("#checkNumber").modal('hide');
	});

	$("#btn_resetpassword").click(function() {
		idPwdCheck();
		if (!inputVerify(1, '#reset_password1', '.error:eq(5)'))
			return;
		if ($("#reset_password1").val() != $("#reset_password2").val()) {
			$('.error:eq(5)').css("color", "#000099").html("비밀번호와 비밀번호 확인란이 다릅니다.");
			return;
		} else if ($("#reset_password1").val() == $("#reset_password2").val()) {
			passwordChange();
		}
	});
});