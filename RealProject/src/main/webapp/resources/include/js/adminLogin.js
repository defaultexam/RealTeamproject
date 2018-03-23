$(function() {
	chkIdPw();
	$('#adminId, #adminPw').bind("keyup", function() {
		$(this).parents("div").find(".error").html("&nbsp;");
	});
	// 로그인 버튼 클릭 시 처리 이벤트
	$("#loginBtn").click(function() {
		if (!formCheck($('#adminId'), $('.error:eq(0)'), "아이디를")) {
			// $('.error:eq(1)').html("");
			return;
		} else if (!formCheck($('#adminPw'), $('.error:eq(1)'), "비밀번호를")) {
			// $('.error:eq(0)').html("");
			return;
		} else {
			$("#loginForm").attr({
				"method" : "POST",
				"action" : "/admin/login.do"
			});
			$("#loginForm").submit();
		}
	});

});

/*
 * 함수명: formCheck(유효성 체크 대상, 출력 영역, 메시지 내용) * 출력영역: 매개변수 두번째 출력영역에. * 예시 :
 * if(!formCheck($('#keyword'),$('#msg'),"검색어를")) return;
 */
function formCheck(main, item, msg) {
	if (main.val().replace(/\s/g, "") == "") {
		item.css("color", "#000099").html(msg + " 입력해 주세요");
		main.val("");
		return false;
	} else {
		return true;
	}
}