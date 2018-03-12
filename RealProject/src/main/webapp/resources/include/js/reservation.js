/*자바 스크립트*/
var selectedMenu;
var allprice;
// 장바구니 추가시 배열에 하나씩 추가, 쿼리로 데이터 이동.
var cart_menuno = new Array();
var cart_name = new Array();
var cart_text = new Array();
var cart_price = new Array();
var cart_kind = new Array();
var cart_amount = new Array();
var cart_seq = 0;
// 이용 시간의 Default 값
var time = "12:00 ~ 14:00";
var selectOption = 1;

function makecomma(num) {
	var str = num + '';
	var leng = str.length;
	var finalStr = '';
	var pos = 1;
	var comma = '';
	for (leng; leng > 0; leng--) {
		try {
			if (pos > 3) {
				pos = 1;
			}
			if (pos == 3) {
				if (str.length > 1) {
					comma = ',';
				} else {
					comma = '';
				}
			} else {
				comma = '';
			}
			finalStr = comma + str.substr(str.length - 1) + finalStr;
			str = str.substr(0, str.length - 1);
			pos++;
		} catch (e) {
			alert(e);
		}
	}
	return finalStr;
}
/*핸드폰 형식*/
function inputVerifyAlert(index, data, text) {
	var data_regExp = new RegExp("^\\d{3}-\\d{3,4}-\\d{4}");
	var match = data_regExp.exec($(data).val());
	if (match == null) {
		alert(text);
		$(data).val("");
		return false;
	} else {
		return true;
	}
}
// 이용시간 체크 변경시, 스피너도 변경됨.
var numberic1 = document.getElementById("#numberic1");
var numberic2 = document.getElementById("#numberic2");
var numberic3 = document.getElementById("#numberic3");
var numberic4 = document.getElementById("#numberic4");
function toggleSpinners(options) {
	$(function() {
		switch (options) {
		case 1:
			$("#numberic1").removeAttr("disabled");
			$("#numberic2").attr("disabled", "disabled");
			$("#numberic3").attr("disabled", "disabled");
			$("#numberic4").attr("disabled", "disabled");
			$("#numberic1").val("1");
			$("#numberic2").val("");
			$("#numberic3").val("");
			$("#numberic4").val("");
			break;
		case 2:
			$("#numberic2").removeAttr("disabled");
			$("#numberic1").attr("disabled", "disabled");
			$("#numberic3").attr("disabled", "disabled");
			$("#numberic4").attr("disabled", "disabled");
			$("#numberic1").val("");
			$("#numberic2").val("1");
			$("#numberic3").val("");
			$("#numberic4").val("");
			break;
		case 3:
			$("#numberic3").removeAttr("disabled");
			$("#numberic2").attr("disabled", "disabled");
			$("#numberic1").attr("disabled", "disabled");
			$("#numberic4").attr("disabled", "disabled");
			$("#numberic1").val("");
			$("#numberic2").val("");
			$("#numberic3").val("1");
			$("#numberic4").val("");
			break;
		case 4:
			$("#numberic4").removeAttr("disabled");
			$("#numberic2").attr("disabled", "disabled");
			$("#numberic3").attr("disabled", "disabled");
			$("#numberic1").attr("disabled", "disabled");
			$("#numberic1").val("");
			$("#numberic2").val("");
			$("#numberic3").val("");
			$("#numberic4").val("1");
			break;
		}
	});
	$("#reservationpeople").html("1");
}

function addList() {
	var resultnum = 9999;
	$(function() {
		for (var i = 0; i <= cart_seq; i++) {
			/* cart 리스트에 이미 값이 있을 경우 */
			if (cart_menuno[i] == selectedMenu.menu_no) {
				resultnum = i;
				break;
			} else {
				/* cart 리스트에 값이 없을 경우 */
				resultnum = 9999;
			}
		}
		if (resultnum == 9999) {
			cart_menuno[cart_seq] = selectedMenu.menu_no;
			cart_name[cart_seq] = selectedMenu.menu_name;
			cart_text[cart_seq] = selectedMenu.menu_text;
			cart_price[cart_seq] = selectedMenu.menu_price;
			cart_kind[cart_seq] = selectedMenu.menu_kind;
			cart_amount[cart_seq] = 1;
			/* 테이블 생성 */
			$("#afterhere").after("<tr id='tr" + selectedMenu.menu_no + "'>");
			$("#tr" + selectedMenu.menu_no).append("<td id='td1_" + selectedMenu.menu_no + "'>" + "ㆍ" + selectedMenu.menu_name + "</td>" + "<br>");
			$("#td1_" + selectedMenu.menu_no).after("<td id='td2_" + selectedMenu.menu_no + "'>" + selectedMenu.menu_price + " 원" + "</td>" + "<br>");
			$("#td2_" + selectedMenu.menu_no).after("<td id='" + "cartamount" + selectedMenu.menu_no + "'>" + cart_amount[cart_seq] + "개" + "</td>" + "<br>");
			$(".table-detail3").before("</tr>");
		} else {
			cart_amount[resultnum] = cart_amount[resultnum] + 1;
			$("#cartamount" + selectedMenu.menu_no).html(cart_amount[i] + "개");
		}
		/* 테이블 전체 금액 계산 및 콤마 */
		if (allprice == '' || allprice == null) {
			allprice = selectedMenu.menu_price;
			$("#allprice").html(makecomma(allprice));
		} else {
			allprice = allprice + selectedMenu.menu_price;
			$("#allprice").html(makecomma(allprice));
		}
		cart_seq += 1;
	});
}

function checkMenu(menu_no) {
	$.ajax({
		url : "/reservation/checkmenu",
		type : "post",
		data : {
			"menu_no" : menu_no
		},
		error : function() {
			alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
		},
		success : function(resultdata) {
			console.log("정보 받아오기 성공");
			alert("장바구니에 추가되었습니다 !")
			selectedMenu = resultdata;
			addList();
		}
	});
}


$("#datepicker").datepicker({
	minDate : "-d",
	maxDate : "+14d",
	dateFormat : 'yy-mm-dd',
	dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
	monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	defaultDate : "+1d",
	prevText : "이전달",
	nextText : "다음달",
	dateFormat : "yy년 mm월 dd일",
	onSelect : function(dateText, inst) {
		$("#reservationdate").html(dateText);
	}
});
$("#accordion").accordion({
	collapsible : true,
	active : false
});
/*JQuery 제이쿼리*/
$(function() {
	$("#btn_reservation").click(function() {

		/*이메일 1 , 2 합체!!!*/
		$("#email").val($("#email1").val() + "@" + $("#email2").val());
		$("#phone").val($("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val());
		if (cart_menuno == null || cart_menuno == "") {
			alert("장바구니가 비었습니다."); 
			return;
		} else if ($("#email1").val() == "" || $("#email2").val() == "") {
			alert('이메일 입력란이 비어있습니다.');
			$("#email1").focus();
			return;
		} else if ($("#phone1").val() == "" || $("#phone2").val() == "" || $("#phone3").val() == "") {
			alert("연락처 입력란이 비어있습니다.");
			$("#phone1").focus();
			return;
		} else if (!inputVerifyAlert(2, '#phone', '존재하지 않는 연락처 형식입니다, 다시 입력해주세요.')) {
			$("#phone1").focus();
			$("#phone").val("");
			$("#phone1").val("");
			$("#phone2").val("");
			$("#phone3").val("");
			return;
		}
		$.ajaxSettings.traditional = true;
		$.ajax({
			url : "/reservation/reserve",
			type : "post",
			data : {
				"cart_menuno" : cart_menuno,
				"cart_name" : cart_name
			},
			error : function() {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
			},
			success : function(resultdata) {
				window.location.href = '/';
			}
		});
		alert("아~ 예약 ~ 되셨구요~ 시간 맞춰서~ 오세요~");
	});

	$('input:radio[name="timetable"]').change(function() {
		if ($(this).val() == '1') {
			selectOption = 1;
			time = "12:00 ~ 14:00";
		} else if ($(this).val() == '2') {
			selectOption = 2;
			time = "17:30 ~ 19:20"
		} else if ($(this).val() == '3') {
			selectOption = 3;
			time = "20:00 ~ 22:00";
		} else if ($(this).val() == '4') {
			selectOption = 4;
			time = "21:15 ~ 23:15";
		}
		toggleSpinners(selectOption);
		$("#reservationtime").html(time);
	});

	$("#numberic1").bind("click", function() {
		$("#reservationpeople").html($("#numberic1").val());
	});
	$("#numberic2").bind("click", function() {
		$("#reservationpeople").html($("#numberic2").val());
	});
	$("#numberic3").bind("click", function() {
		$("#reservationpeople").html($("#numberic3").val());
	});
	$("#numberic4").bind("click", function() {
		$("#reservationpeople").html($("#numberic4").val());
	});
});