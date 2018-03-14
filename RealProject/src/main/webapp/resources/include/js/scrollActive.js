/**
 *  @author    djgim(turfrain)
 *  @version   0.1
 *  @since     01.06.2016
 */

//---------------------------------------------------------------------------------------------------------------
//  								VARIABLES					(변수&상수)
//---------------------------------------------------------------------------------------------------------------
var WHELL_OFFSET = 0; // 휠감지 (up :1 , down:-1)
var RESIZE_HEIGHT = 0; // 화면 높이	
var MENU_HEIGHT = 139; // 84 +55 =139

/* ------------------------------------------ 이벤트 ( scroll, resize) ----------------------------  */
// 타켓위치 리턴 (단독실행).top or 
function targetPosition($tar) {
	return $($tar).offset();
}

/* 현제 스크롤 위치 */
function getNowScroll() {
	var de = document.documentElement;
	var b = document.body;
	var now = {};
	now.X = document.all ? (!de.scrollLeft ? b.scrollLeft : de.scrollLeft) : (window.pageXOffset ? window.pageXOffset : window.scrollX);
	now.Y = document.all ? (!de.scrollTop ? b.scrollTop : de.scrollTop) : (window.pageYOffset ? window.pageYOffset : window.scrollY);
	now.TOTAL = $(document).height();
	return now;
}

/* call back 스크롤 앵커 실행 (컨텐츠위치, 상대값, 실행&초기화, 실행함수, 초기화함수) */
function callBackScrollActive($tarH, $tarY, $offSet, $off, $fn1, $fun2) {
	//console.log( $tarY , ($tarY + $tarH), getNowScroll().Y  );
	if (getNowScroll().Y >= ($tarY - $offSet) && getNowScroll().Y <= $tarY + $tarH) {
		if ($off) {
			$fn1();
			$off = false;
		}
	} else if (getNowScroll().Y <= ($tarY - RESIZE_HEIGHT) || getNowScroll().Y > ($tarY + $tarH)) {
		//console.log("<<"+ $tarY , $offSet, ( $tarY-$offSet), getNowScroll().Y  );        
		if (!$off) {
			$fun2();
			$off = true;
		}
	}
	return $off;
}


/* 리사이즈 이벤트 실행 */
function resizeEventCall() {
	RESIZE_HEIGHT = $(window).height();
}




//----------------------------------------------------------------------------------------------------------------
//  								WINDWON READY				
//----------------------------------------------------------------------------------------------------------------
var exPageArr = [ "main" ]; // 2뎁 필요없는 페이지 
var etcPageArr = [ "brand index", "menu index", "store index", "event index", "membership index", "management", "secession", "utility privacy", "utility terms", "brand-index", "join", "login", "recruit", "customer index" ]; // index, other
$(window).ready(function() {

	for (c in etcPageArr) {
		if ($("body #wrap").hasClass(etcPageArr[c])) {
			$("body #header").addClass("dep2-off");
		}
	}

	/* ------------------------------------------ 이벤트 ( scroll, resize) ----------------------------  */
	// ===============  스크롤 이벤트 
	$(window).scroll(function($e) {
		if (typeof (window["scrollCall"]) == "function") scrollCall(); // 페이지에 있어야하는 함수 (스크롤시호출)

		// side 반응
		topmenuMin()
		sideSharing();

		// dep2 체크 
		for (c in exPageArr) { //console.log(exPageArr[c])
			if ($("body #wrap").hasClass(exPageArr[c])) {
				return;
			}
			; // 메인이면 실행 안함; 	
		}

		// GNB 고정 모션 
		if (getNowScroll().Y > 83) {
			$("#header").addClass("fixeds");
			if ($("#header").hasClass("dep2-off")) {
				$("#header.dep2-off .header_inner").css({
					"height" : "139px"
				});
			}
			//MENU_HEIGHT = 0;
			gnbMotion(true);
		} else {
			$("#header").removeClass("fixeds");
			if ($("#header").hasClass("dep2-off")) {
				$("#header.dep2-off .header_inner").css({
					"height" : "84px"
				});
			}
			//MENU_HEIGHT = 139;
			gnbMotion(false);
		}


	});

	// 스크롤 처음 실행
	if (typeof (window["scrollCall"]) == "function") scrollCall(); // 페이지에 있어야하는 함수	(스크롤시호출)
	$(window).trigger("scroll");


	// ===============  리싸이즈 이벤트
	$(window).resize(function() {
		if (typeof (window["resizeCall"]) == "function") resizeCall(); // 페이지에 있어야하는 함수		
		resizeEventCall();

		// side 반응
		topmenuMin()
		sideSharing();
	});
	// 리싸이즈 처음 실행  
	if (typeof (window["resizeCall"]) == "function") resizeCall(); // 페이지에 있어야하는 함수		
	resizeEventCall();

	topmenuMin();
	sideSharing();
	setTimeout(topmenuMin, 900);
	setTimeout(sideSharing, 900);

});
/* === //window ready ==== */
// =============  topmenuMin ===     
function topmenuMin() {
	if (window.innerWidth <= 1280) {
		$("#header .header_inner").css({
			top : getNowScroll().Y
		});
	} else {
		$("#header .header_inner").css({
			top : 0
		});
	}

}

// 모바일 체크 
function check_device() {
	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	var device_name = '';
	var _b = false;
	for (var word in mobileKeyWords) {
		if (navigator.userAgent.match(mobileKeyWords[word]) != null) {
			device_name = mobileKeyWords[word];
			_b = true;
		}
	}
	return _b;
}
var mobileB = check_device(); // 모바일 true	
// =============  side ===     
function sideSharing() {
	var page_h = RESIZE_HEIGHT + getNowScroll().Y; // sharing		 		  
	if (mobileB) { // 모바일 체크 
		$("#header .header_inner").css({
			position : "fixed",
			top : 0
		});
		$("#side .sharing-wrap").css({
			position : "fixed",
			top : "auto",
			bottom : 0
		});
		return false;
	}

	if (window.innerWidth <= 1280) {
		if ($("#wrap").height() < page_h) { // 컨텐츠 높이가 낮으면.
			$(".sharing-wrap").css({
				top : ($("#wrap").height() - 40)
			}); //40 sideWidth				
		} else {
			$(".sharing-wrap").css({
				top : (page_h - 40)
			}); //40 sideWidth	               
		}
	} else {
		$(".sharing-wrap").css({
			top : "auto"
		});
	} // $(".sharing-wrap a").text( $("#wrap").height() +" : "+ window.innerHeight )
}

// ============= GNB 고정 dot 모션 
function gnbMotion($b) {
	var dep1Dot = new TimelineLite(); // TweenMax  도트 모션
	$("#header .dep1view a > span").each(function($index, $element) {
		if ($b) {
			$("#header .dep1view a").css({
				display : "inline-block"
			});
			dep1Dot.add(TweenLite.to($element, 0.2, {
				opacity : 1,
				delay : -0.18,
				ease : Sine.easeOut
			}));
		} else {
			dep1Dot.add(TweenLite.to($element, 0.2, {
				opacity : 0,
				delay : -0.18
			}));
			dep1Dot.add(TweenLite.to($("#header .dep1view a"), 0.0, {
				display : "none"
			}));
		}
	});
}


/* visual full-size  */
var _sw = 0;
var _sh = 0;
function visualFullsize($container, $image) {
	_sw = $(window).width();
	_sh = $(window).height();

	var header_height = 84;
	var sharing_height = 40;
	var imgWidth = 1504;
	var imgHeight = 776;
	var mask_width = $container.width();
	var mask_height = _sh - header_height - sharing_height;
	var imgElement = $image;

	var imgW = Math.floor(imgWidth * mask_height / imgHeight);
	var imgH = Math.floor(mask_height);

	if (imgW < mask_width) {
		var imgW = Math.floor(mask_width);
		var imgH = Math.floor(imgHeight * mask_width / imgWidth);
	}

	var marginLeft = Math.floor(mask_width / 2 - imgW / 2);
	if ($image) {
		$image.css({
			"margin-left" : marginLeft,
			width : imgW,
			height : imgH
		});
	}
	$container.height(imgH);

}
function visualFullsize2($container, $image) {
	_sw = $(window).width();
	_sh = $(window).height();

	var header_height = 139;
	var sharing_height = 40;
	var imgWidth = 1504;
	var imgHeight = 776;
	var mask_width = $container.width();
	var mask_height = _sh - header_height - sharing_height;


	var imgW = Math.floor(imgWidth * mask_height / imgHeight);
	var imgH = Math.floor(mask_height);

	if (imgW < mask_width) {
		var imgW = Math.floor(mask_width);
		var imgH = Math.floor(imgHeight * mask_width / imgWidth);
	}

	var marginLeft = Math.floor(mask_width / 2 - imgW / 2);
	if ($image) {
		$image.css({
			"margin-left" : marginLeft,
			width : imgW,
			height : imgH
		});
	}
	$container.height(imgH);

}

function visualFullsize3($container, $image) {
	_sw = $(window).width();
	_sh = $(window).height();

	var header_height = 84;
	var sharing_height = 40;
	var imgWidth = 752;
	var imgHeight = 776;
	var mask_width = $container.width();
	var mask_height = _sh - header_height - sharing_height;


	var imgW = Math.floor(imgWidth * mask_height / imgHeight);
	var imgH = Math.floor(mask_height);

	if (imgW < mask_width) {
		var imgW = Math.floor(mask_width);
		var imgH = Math.floor(imgHeight * mask_width / imgWidth);
	}

	var marginLeft = Math.floor(mask_width / 2 - imgW / 2);
	if ($image) {
		$image.css({
			"margin-left" : marginLeft,
			width : imgW,
			height : imgH
		});
	}
	$container.height(imgH);

}