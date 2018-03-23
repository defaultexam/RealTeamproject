/* 3초 후에 페이지 이동 */
function onLoading() {
	oInterval = window.setInterval("afterTime()", 3000);
}
function afterTime() {
	window.clearInterval(oInterval);
	window.location.href = '/';
}


function goNext() {
	window.clearInterval(loadInterval);
	$("#loginForm").attr({
		"method" : "POST",
		"action" : "/login"
	});
	$("#loginForm").submit();
}

function checkWrong(item) {
	item.css("color", "#000099").html("");
}

$(function() {
	$('#id, #password').bind("keyup", function() {
		$(this).parents("div").find(".error").html("");
	});

	$("#id").bind("blur", function() {
		if (!formCheck($('#id'), $('.error:eq(0)'), "아이디를")) {
			return;
		} else if (!inputVerify(0, '#id', '.error:eq(0)')) {
			return;
		} else
			checkWrong($('#id'));
	});

	$("#password").bind("blur", function() {
		if (!formCheck($('#password'), $('.error:eq(1)'), "비밀번호를")) {
			return;
		} else if (!inputVerify(1, '#password', '.error:eq(1)')) {
			return;
		} else
			checkWrong($('#password'));
	});

	// 로그인 버튼 클릭 시 처리 이벤트
	$("#loginBtn").click(function() {
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
	});

	
	
});