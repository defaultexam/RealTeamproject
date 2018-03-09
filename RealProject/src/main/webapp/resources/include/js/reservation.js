/*자바 스크립트*/
var selectedMenu;
var allprice;
var cart_menuno = new Array();
var cart_name = new Array();
var cart_text = new Array();
var cart_price = new Array();
var cart_kind = new Array();
var cart_amount = new Array();
var cart_seq = 0;
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

function toggleSpinners(options) {
	switch (options) {
	case 1:
		spinner1.spinner("enable");
		spinner2.spinner("disable");
		spinner3.spinner("disable");
		spinner4.spinner("disable");
		break;
	case 2:
		spinner2.spinner("enable");
		spinner1.spinner("disable");
		spinner3.spinner("disable");
		spinner4.spinner("disable");
		break;
	case 3:
		spinner3.spinner("enable");
		spinner2.spinner("disable");
		spinner1.spinner("disable");
		spinner4.spinner("disable");
		break;
	case 4:
		spinner4.spinner("enable");
		spinner2.spinner("disable");
		spinner3.spinner("disable");
		spinner1.spinner("disable");
		break;
	}
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
var time = "12:00 ~ 14:00";
var selectOption = 1;
var spinner1 = $("#spinner1").spinner();
var spinner2 = $("#spinner2").spinner();
var spinner3 = $("#spinner3").spinner();
var spinner4 = $("#spinner4").spinner();

/*JQuery 제이쿼리*/
$(function() {
	$("#btn_reservation").click(function() {
		/*이메일 1 , 2 합체!!!*/
		$("#email").val($("#email1").val() + "@" + $("#email2").val());
		$("#phone").val($("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val());
		if ($("#email1").val() == "" || $("#email2").val() == "") {
			alert('이메일 입력란이 비어있습니다.');
			return;
		} else if ($("#phone1").val() == "" || $("#phone2").val() == "" || $("#phone3").val() == "") {
			alert("연락처 입력란이 비어있습니다.");
			return;
		} else if (!inputVerifyAlert(2, '#phone', '존재하지 않는 연락처 형식입니다, 다시 입력해주세요.')) {
			$("#phone").val("");
			$("#phone1").val("");
			$("#phone2").val("");
			$("#phone3").val("");
			return;
		}
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
});

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
$("#spinner1").spinner({
	min : "1",
	max : "30",
	change : function(event, ui) {
		$("#reservationpeople").html($("#spinner1").val());
	}
});
$("#spinner2").spinner({
	min : "1",
	max : "30",
	change : function(event, ui) {
		$("#reservationpeople").html($("#spinner2").val());
	}
});
$("#spinner3").spinner({
	min : "1",
	max : "30",
	change : function(event, ui) {
		$("#reservationpeople").html($("#spinner3").val());
	}
});
$("#spinner4").spinner({
	min : "1",
	max : "30",
	change : function(event, ui) {
		$("#reservationpeople").html($("#spinner4").val());
	}
});