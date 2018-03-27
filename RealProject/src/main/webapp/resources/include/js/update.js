
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
		url : "/mypage/sendMail",
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



$(function() {
	var idConfirm = 1;
	$("#btnEmail").click(
		function() {
			$("#email").val($("#email1").val() + "@" + $("#email2").val());
			if (!formCheck($('#email1'), $('.error:eq(8)'), "이메일 주소를")) {
				return;
			} else if (!formCheck($('#email2'), $('.error:eq(8)'), "이메일 주소를")) {
				return;
			}
			$("#modalemail").modal('show');
			var email = document.getElementById("email").value;
			if ($("#emailsended").val() >= 1) /*이메일 전송을 이미 했을 경우*/
			{
				$('.error:eq(8)').css("color", "#000099").html("이미 인증번호가 전송되었습니다.");
				return;
			}
			else
				console.log("전송 여부: 가능");
			var abc = sendMail(email);
			$('.error:eq(8)').css("color", "#000099").html(abc);
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
				$('.error:eq(2)').css("color", "#000099").html("인증 성공!");
				emailChecked = 1;
				$("#email1").attr("readonly", "readonly");
				$("#email2").attr("readonly", "readonly");
			} else {
				$('.error:eq(2)').css("color", "#000099").html("인증 실패.");
				emailChecked = 0;
			}
		}
	);


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
			//repassdiv.classList.add("form-group", "has-error");
			return;
		} else if (!inputVerify(1, '#repassword', '.error:eq(3)')) {
			//repassdiv.classList.add("form-group", "has-error");
			return;
		} else if (!passwordCheck()) {
			//repassdiv.classList.add("form-group", "has-error");
			return;
		} else {
			passdiv.classList.remove('has-warning');
			//repassdiv.classList.remove('has-error');
			passdiv.classList.add("form-group", "has-success");
			//repassdiv.classList.add("form-group", "has-success");
		}
	});
	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("updateBtn").click(
		function() {
			// 입력값 체크
			if (!formCheck($('#password'), $('.error:eq(2)'), "비밀번호를"))
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
					$("#postcode").val() + "▒" + $("#roadAddress").val() + "▒" + $("#jibunAddress").val()
				);
				if ($("#weddingdate").val() == "")
					$("#weddingdate").val("9999-12-31");
				$("#registerForm").attr({
					"method" : "post",
					"action" : "/mypage/update"
				});
				$("#registerForm").submit();
			}
		});
	$("updateCancel").click(function() {
		location.href = "user/mypage/mypage";
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