/*자바 스크립트*/
var selectedMenu;
var seats;
var allprice;
// 장바구니 추가시 배열에 하나씩 추가, 쿼리로 데이터 이동.
var cart_menuno = new Array();
var cart_name = new Array();
var cart_text = new Array();
var cart_price = new Array();
var cart_kind = new Array();
var cart_amount = new Array();
var cart_seq = 0;
var seat_no = 9999;
var book_people = 1;
var discountrate = 0;
var discountPrice = 0;
// 이용 시간의 Default 값
var time = "12:00 ~ 14:00";
var selectOption = 1;

// DataPicker을 통해 선택한 날짜
var selectedDay;

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
			if (cart_seq >= 8 && cart_menuno[i] != selectedMenu.menu_no) {
				alert("최대 8개의 메뉴만 주문하실 수 있습니다.")
				return;
			}
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
		if (discountrate != "0") {
			var discounts = discountrate.split("%");
			discountPrice = ((allprice / 100) * discounts[0]);
		}
		$("#payment_discount").html(makecomma(discountPrice));
		$("#payment_whole").html(allprice - discountPrice);
		$("#payment_ordered").html($("#allprice").html());
		cart_seq += 1;
		alert("장바구니에 추가되었습니다 !")
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
			selectedMenu = resultdata;
			addList();
		}
	});
}


$("#datepicker").datepicker({
	// 최소 날짜 (자동 disabled)
	minDate : "+1d",
	// 최대 날짜 (자동 disabled)
	maxDate : "+14d",
	// 위에 뜨는 Month 포멧 형태
	dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
	// 월별 이름 지정
	monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	// 초기값 지정
	defaultDate : "+1d",
	// < 버튼 hover시 뜨는 문구
	prevText : "이전달",
	// > 버튼 hover시 뜨는 문구
	nextText : "다음달",
	// 출력시 사용할 포멧 값
	dateFormat : "yy년 mm월 dd일",
	// 날짜를 선택했을 경우 메소드
	onSelect : function(dateText, inst) {
		$("#reservationdate").html(dateText);
		var sus = dateText.split("년 ");
		var dnjf = sus[1].split("월 ");
		var dlf = dnjf[1].split("일");
		var date = sus[0] + "-" + dnjf[0] + "-" + dlf[0];
		// 지정한 dateFormat 'yy년 mm월 dd일'을 배열로 나누어 yy-mm-dd 포멧으로 변경.
		selectedDay = date;
		console.log("예약 일시/인원 선택 날짜 : " + date);
		$.ajax({
			url : "/reservation/date",
			type : "post",
			data : {
				"seat_date" : date
			},
			error : function() {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
			},
			success : function(resultdata) {
				if (resultdata != null) {
					seats = resultdata;
					// 출력 초기값 설정
					$("#extra1").html("데이터 없음");
					$("#extra2").html("데이터 없음");
					$("#extra3").html("데이터 없음");
					$("#extra4").html("데이터 없음");
					// 예외 처리
					if (resultdata[0] != null) {
						if (resultdata[0].seat_time == "12:00 ~ 14:00") {
							$("#extra1").html(resultdata[0].seat_extra);
						} else if (resultdata[0].seat_time == "17:30 ~ 19:20") {
							$("#extra2").html(resultdata[0].seat_extra);
						} else if (resultdata[0].seat_time == "20:00 ~ 22:00") {
							$("#extra3").html(resultdata[0].seat_extra);
						} else if (resultdata[0].seat_time == "21:15 ~ 23:15") {
							$("#extra4").html(resultdata[0].seat_extra);
						}
					}
					if (resultdata[1] != null) {
						if (resultdata[1].seat_time == "12:00 ~ 14:00") {
							$("#extra1").html(resultdata[1].seat_extra);
						} else if (resultdata[1].seat_time == "17:30 ~ 19:20") {
							$("#extra2").html(resultdata[1].seat_extra);
						} else if (resultdata[1].seat_time == "20:00 ~ 22:00") {
							$("#extra3").html(resultdata[1].seat_extra);
						} else if (resultdata[1].seat_time == "21:15 ~ 23:15") {
							$("#extra4").html(resultdata[1].seat_extra);
						}
					}
					if (resultdata[2] != null) {
						if (resultdata[2].seat_time == "12:00 ~ 14:00") {
							$("#extra1").html(resultdata[2].seat_extra);
						} else if (resultdata[2].seat_time == "17:30 ~ 19:20") {
							$("#extra2").html(resultdata[2].seat_extra);
						} else if (resultdata[2].seat_time == "20:00 ~ 22:00") {
							$("#extra3").html(resultdata[2].seat_extra);
						} else if (resultdata[2].seat_time == "21:15 ~ 23:15") {
							$("#extra4").html(resultdata[2].seat_extra);
						}
					}
					if (resultdata[3] != null) {
						if (resultdata[3].seat_time == "12:00 ~ 14:00") {
							$("#extra1").html(resultdata[3].seat_extra);
						} else if (resultdata[3].seat_time == "17:30 ~ 19:20") {
							$("#extra2").html(resultdata[3].seat_extra);
						} else if (resultdata[3].seat_time == "20:00 ~ 22:00") {
							$("#extra3").html(resultdata[3].seat_extra);
						} else if (resultdata[3].seat_time == "21:15 ~ 23:15") {
							$("#extra4").html(resultdata[3].seat_extra);
						}
					}
				}
			}
		});
	}
});
$("#accordion").accordion({
	collapsible : true,
	active : false
});

/*JQuery 제이쿼리*/
$(function() {
	// .selectCoupon 클래스 지정(tr), 쿠폰 선택시
	$(".selectCoupon").click(function() {
		// tr에 지정되있는 data-num을 통해 값을 가져옴.
		var couponhistory_no = $(this).attr("data-num");
		// hidden으로 만들어 놓은 저장소에 저장, /reservation/reserve로 값을 옮길때 사용.
		$("#couponhistory_no").val(couponhistory_no);
		// 4번째 td의 id값인 #쿠폰번호의 값을 가져와 할인율을 확인함.
		discountrate = $("#" + couponhistory_no).html();
		// 체크 표시 전용 span값 초기화.
		$("span[role=no]").html("");
		// span에 선택 표시.
		$("#span" + couponhistory_no).html("✓");
		if (couponhistory_no == 9999) {
			discountrate = "0%";
		}
		if (discountrate != "0" && allprice != 0) {
			// 10%와 같은 표기에서 %를 떼어 상수로 표기.
			var discounts = discountrate.split("%");
			discountPrice = ((allprice / 100) * discounts[0]);
		}
		// makecomma를 통해 단위를 나누어 표기함, 예) 40,000
		if (discountPrice >= 0) $("#payment_discount").html(makecomma(discountPrice));
		if (allprice - discountPrice >= 0) $("#payment_whole").html(allprice - discountPrice);
	});

	$("#btn_reservation").click(function() {
		if ((login == '' || login == null) && alerts != 0) {
			alert("로그인 후 이용하실 수 있습니다.");
			alerts++;
			return;
		}
		// 00aaaa00 naver.com 와 같은 분리된 이메일과 전화번호에 추가 기호를 붙여 병합시킴.
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
				"member_no" : $("#memberno").val(),
				"seat_no" : seat_no,
				"book_people" : book_people,
				"totalpay" : $("#payment_whole").html(),
				"book_condition" : '미사용',
				"coupon_no" : $("#couponhistory_no").val(),
				"discount" : discountPrice,
				"pay_way" : $('input:radio[name="payway"]').val(),
				"choice_menu1" : cart_menuno[0],
				"choice_menu2" : cart_menuno[1],
				"choice_menu3" : cart_menuno[2],
				"choice_menu4" : cart_menuno[3],
				"choice_menu5" : cart_menuno[4],
				"choice_menu6" : cart_menuno[5],
				"choice_menu7" : cart_menuno[6],
				"choice_menu8" : cart_menuno[7],
				"choice_menu_number1" : cart_amount[0],
				"choice_menu_number2" : cart_amount[1],
				"choice_menu_number3" : cart_amount[2],
				"choice_menu_number4" : cart_amount[3],
				"choice_menu_number5" : cart_amount[4],
				"choice_menu_number6" : cart_amount[5],
				"choice_menu_number7" : cart_amount[6],
				"choice_menu_number8" : cart_amount[7],
				"choice_menu_price1" : cart_price[0],
				"choice_menu_price2" : cart_price[1],
				"choice_menu_price3" : cart_price[2],
				"choice_menu_price4" : cart_price[3],
				"choice_menu_price5" : cart_price[4],
				"choice_menu_price6" : cart_price[5],
				"choice_menu_price7" : cart_price[6],
				"choice_menu_price8" : cart_price[7],
				"book_name" : $("#book_name").val(),
				"book_phone" : $("#phone").val(),
				"book_email" : $("#email").val(),
				"book_memo" : $("#book_memo").val()
			},
			error : function(e) {
				alert('사이트 접속 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				console.log(e);
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
			seat_no = seats[0].seat_no;
		} else if ($(this).val() == '2') {
			selectOption = 2;
			time = "17:30 ~ 19:20"
			seat_no = seats[1].seat_no;
		} else if ($(this).val() == '3') {
			selectOption = 3;
			time = "20:00 ~ 22:00";
			seat_no = seats[2].seat_no;
		} else if ($(this).val() == '4') {
			selectOption = 4;
			time = "21:15 ~ 23:15";
			seat_no = seats[3].seat_no;
		}
		toggleSpinners(selectOption);
		$("#reservationtime").html(time);
	});
	$("#numberic1").bind("click", function() {
		$("#reservationpeople").html($("#numberic1").val());
		book_people = $("#numberic1").val();
	});
	$("#numberic2").bind("click", function() {
		$("#reservationpeople").html($("#numberic2").val());
		book_people = $("#numberic2").val();
	});
	$("#numberic3").bind("click", function() {
		$("#reservationpeople").html($("#numberic3").val());
		book_people = $("#numberic3").val();
	});
	$("#numberic4").bind("click", function() {
		$("#reservationpeople").html($("#numberic4").val());
		book_people = $("#numberic4").val();
	});
});