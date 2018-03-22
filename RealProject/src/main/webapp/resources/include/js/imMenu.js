/*!
 * imScriptLibrary
 * jQuery JavaScript Library v1.9.1
 * Date: 2016-4-12
 */


/**
 * imQuickMenu : 스크롤 딸아 다니는 컨테이너
 * @param $top : 컨테이너 높이값
 */
jQuery.fn.imQuickMenu = function($top) {
	var _conTar = this; // 퀵메뉴 컨테이너
	var _top; // 상단에서 떨어져야하는위치
	_top = ($top) ? $top : 0;
	$(window).scroll(function() {
		var tarH = $(document).scrollTop() + _top;
		quickMenuH(tarH);
	});
	function quickMenuH($tarH) {
		_conTar.stop().animate({
			"top" : $tarH + "px"
		}, 500);
	}
}

/**
 * imTabMenu				: 텝메뉴
 * @param	$btn			: 링크버튼
 * @param	$cont			: 컨텐츠
 * @param	$activeClass	: 활성화 class 이름
 * @method  setBtn(index)	: 인덱스값을 넘기현 해당컨텐츠 활성화
 */
jQuery.fn.imTabMenu = function($btn, $cont, $activeClass, $activeFn) {
	var tabMenu = this; // 텝 컨테이너
	$activeClass = ($activeClass) ? $activeClass : "on"; // activeClass 없으면 on으로 체크
	$(tabMenu).find('li:first').addClass($activeClass); // 텝 버튼 초기화

	$(tabMenu).find($btn).bind("click", function() {
		var _this = $(this).parent();
		var _index = _this.index();
		//_this.addClass($activeClass);
		active(_index, _this);
		return false;
	});
	function active($index, $this) {
		if ($this) { // 클릭시			
			$this.siblings().removeClass($activeClass); // 버튼 초기화
			$this.addClass($activeClass); // 버트 활성화
			$this.siblings().find($cont).hide(); // 컨텐츠 초기화
			$this.find($cont).show(); // 컨텐츠 활성화		

			$this.find("ul li").siblings().removeClass($activeClass); // 버튼 초기화
			$this.find("ul li").eq(0).addClass($activeClass); // 버트 활성화
			$this.find("ul li").siblings().find($cont).hide(); // 컨텐츠 초기화
			$this.find("ul li.on").find($cont).show(); // 컨텐츠 활성화

		} else { // 호출시
			var _length = $index.length;
			if (_length) { // 배열				
				$(tabMenu).find(">li").siblings().removeClass($activeClass); // 버튼 초기화
				$(tabMenu).find(">li").eq($index[0]).addClass($activeClass); // 버트 활성화
				$(tabMenu).find(">li").find($cont).hide(); // 컨텐츠 초기화
				$(tabMenu).find(">li.on").find($cont).show(); // 컨텐츠 활성화		

				var _ulli = "",
					_ullion = "";
				for ($i = 1; $i < _length; $i++) {
					_ulli += "ul li ";
					_ullion += "ul li.on ";
					$(tabMenu).find("li.on").find(_ulli).siblings().removeClass($activeClass); // 버튼 초기화
					$(tabMenu).find("li.on").find(_ulli).eq($index[$i]).addClass($activeClass); // 버트 활성화
					$(tabMenu).find("li.on").find(_ulli).siblings().find($cont).hide(); // 컨텐츠 초기화
					$(tabMenu).find("li.on").find(_ullion).find($cont).show(); // 컨텐츠 활성화
				}

			} else { // 넘버
				//console.log("$index:: " + $index);
				$(tabMenu).find(">li").siblings().removeClass($activeClass); // 버튼 초기화
				$(tabMenu).find(">li").eq($index).addClass($activeClass); // 버트 활성화
				$(tabMenu).find(">li").find($cont).hide(); // 컨텐츠 초기화
				$(tabMenu).find(">li.on").find($cont).show(); // 컨텐츠 활성화		

				$(tabMenu).find("li.on").find("ul li").siblings().removeClass($activeClass); // 버튼 초기화
				$(tabMenu).find("li.on").find("ul li").eq(0).addClass($activeClass); // 버트 활성화
				$(tabMenu).find("li.on").find("ul li").siblings().find($cont).hide(); // 컨텐츠 초기화
				$(tabMenu).find("li.on").find("ul li.on").find($cont).show(); // 컨텐츠 활성화
			}

		}
		if ($activeFn) $activeFn($index);
	}
	active(0);
	return {
		setBtn : function($index) {
			active($index);
		}
	}

}


/**
 * imGNB					: GNB 메뉴 
 * @param $activeClass		: 활성화 class 이름
 * @param $activeFN($index)	: 인덱스리턴함수
 */
jQuery.fn.imGNB = function($activeClass, $activeFn) {
	var _gnb = this;
	var _index = -1;
	$activeClass = ($activeClass) ? $activeClass : "on"; // activeClass 없으면 on으로 체크
	$(this).find('>ul >li').on("mouseenter focusin", function(e) {
		var this_li = $(this);

		//clearTimeout(this_li.data('imGnbMenu'));										// 깜빡임 제거	
		$(_gnb).find('li').removeClass($activeClass);
		this_li.addClass($activeClass);

		var _liOn = '>ul>li.' + $activeClass;
		$activeFn($(_gnb).find(_liOn).index(), e); // 인덱스 리턴		

	});


	$(_gnb).on("mouseleave focusout", function(e) {
		onClass(e);
	});


	function onClass(e) {
		$(_gnb).find('li').removeClass($activeClass);
		$(_gnb).find('>ul>li').eq(_index).addClass($activeClass);
		$activeFn(_index, e);
	}


	return {
		setBtn : function($index) {
			_index = $index
			var e = {
				type : "default"
			};
			onClass(e);
		}
	} // return;


/*
	$(this).find('>ul li').on("mouseleave focusout",function(){
		var this_li = $(this);
		var timer = setTimeout(function(){					
			this_li.find('ul:first').animate({height:'hide', opacity:'hide'}, 'fast');  // 숨겨지는 애니메이션	
			
		}, 0);
		this_li.removeClass($activeClass);
		this_li.data('imGnbMenu', timer);												// 깜빡임 제거

		$activeFn( -1 );																		// 인덱스 리턴
	});
		*/
}

/**
	 * imGNBactive							: 2뎁스 활성화 gnb 
	 * @param		$activeClass			: 활성화 class 이름
	 * @param		$activeFN([,])			: 콜백함수로 인덱스를 배열형태로 리턴
	 * @method		setBtn($index)		: 활성화 인덱스를 넣으면 해당컨텐츠 활성화
*/
jQuery.fn.imGNBactive = function($activeClass, $activeFN) {
	var _depth1 = -1;
	var _depth2 = -1;
	var _this = this;
	var _dep1_ul = $(_this).find('>ul '); //   뎁스 1 ul, gnb-list
	var _dep2_ul = $(_this).find('>ul>li>ul'); //   뎁스 2 ul, 하위 네비게이션

	$activeClass = ($activeClass) ? $activeClass : "on"; // activeClass 없으면 on으로 체크
	//초기화
	_dep2_ul.css({
		'display' : 'none'
	});
	active(_depth1, _depth2);
	// // 이벤트  
	// over 뎁스1  이벤트
	_dep1_ul.find(' > li  a').on('mouseenter focusin', function() {
		var index = _dep1_ul.find(' > li > a').index(this);
		if (index == -1) {
			return;
		}
		active(index, -1, true);
	});

	// over 뎁스2  이벤트
	_dep2_ul.find('a').on('mouseenter focusin', function() {
		var index1 = _dep2_ul.index($(this).parent().parent());
		var index2 = $(this).parent().parent().find('li a').index(this);
		active(index1, index2, true);
	});


	// out 뎁스1,2 이벤트
	//$( _this ).parent().parent().on('mouseleave focusout', function(){ 
	$("#header").on('mouseleave', function() {
		active(_depth1, _depth2);
	});

	//  실행
	function active($dep1, $dep2, $active) {
		var _return = $activeFN($dep1, $dep2); // 인텍스리턴
		if (!_return) {
			return
		}
		; // false 값이 넘어오면 아래를 실행하지 않음
		// subindex, other
		if ($("#header").hasClass("dep2-off") && $active) {
			$("#header.dep2-off .header_inner").css({
				"height" : "139px"
			});
		} else {
			if (!$("#header").hasClass("fixeds")) { // 서브인덱스일때 2뎁사라지지 않게
				$("#header.dep2-off .header_inner").css({
					"height" : "84px"
				});
			}
		}
		if ($dep1 == -1) { // 1뎁스가 없으면 초기화
			_dep1_ul.find(' li > a').removeClass($activeClass);
			_dep2_ul.css({
				'display' : 'none'
			});
			_dep2_ul.eq($dep1).find(' li a').removeClass($activeClass);
			// subindex, other
			if ($("#header").hasClass("dep2-off")) {
				$("#header.dep2-off .header_inner").height("84px");
			}
			return;
		}
		_dep1_ul.find(' li > a').removeClass($activeClass);
		_dep1_ul.find(' > li').eq($dep1).find(' > a').addClass($activeClass);
		_dep2_ul.each(function($$index) {
			if ($$index == $dep1) {
				_dep2_ul.eq($$index).css({
					'display' : 'block'
				});
			} else {
				_dep2_ul.eq($$index).css({
					'display' : 'none'
				});
			}
		})

		//_dep2_ul.css({'display':'none'});
		//_dep2_ul.eq($dep1).css({'display':'block'});

		if ($dep2 != -1) { // 2뎁이 -1이면 없는 걸로
			_dep2_ul.eq($dep1).find(' li a').removeClass($activeClass);
			_dep2_ul.eq($dep1).find(' li:eq(' + ($dep2) + ') a').addClass($activeClass);
		}
	} // active/

	return {
		setBtn : function($index) {
			var _length = $index.length; // 배열인지를 판단하기위해 
			if (_length) { // 배열
				_depth1 = $index[0];
				_depth2 = $index[1];
			} else { // 숫자
				_depth1 = $index;
				_depth2 = -1;
			}
			active(_depth1, _depth2);
		}
	} // return;

} //  imGNBactive



/**
	 * imGNBactive3							: 3뎁스 활성화 gnb 
	 * @param		$activeClass			: 활성화 class 이름
	 * @param		$activeFN([,])			: 콜백함수로 인덱스를 배열형태로 리턴
	 * @method		setBtn($index)		: 활성화 인덱스를 넣으면 해당컨텐츠 활성화
*/
jQuery.fn.imGNBactive3 = function($activeClass, $activeFN) {
	var _depth1 = -1;
	var _depth2 = -1;
	var _depth3 = -1;
	var _this = this;
	var _dep1_ul = $(_this).find(' > ul '); //   뎁스 1 ul
	var _dep2_ul = $(_this).find(' > ul > li > ul'); //   뎁스 2 ul
	var _dep3_ul = $(_this).find(' > ul > li > ul > li >ul'); //   뎁스 3 ul

	$activeClass = ($activeClass) ? $activeClass : "on"; // activeClass 없으면 on으로 체크
	//초기화
	_dep2_ul.css({
		'display' : 'none'
	});
	_dep3_ul.css({
		'display' : 'none'
	});
	active(_depth1, _depth2, _depth3);

	// // 이벤트  
	// over 뎁스1  이벤트
	_dep1_ul.find(' > li > a').on('mouseenter focusin', function() {
		var index = $(this).parent().index();
		active(index, -1, -1);
	});

	// over 뎁스2  이벤트
	_dep2_ul.find('> li > a').on('mouseenter focusin', function() {
		var index1 = $(this).parents(".dep1li").index();
		var index2 = $(this).parents(".dep2li").index();
		active(index1, index2, -1);
	});

	// over 뎁스3  이벤트
	_dep3_ul.find('> li > a').on('mouseenter focusin', function() {

		//_dep1_ul.find(">li").css({ backgroundColor:"#ffffff" });
		//$(this).parent().parent().parent().parent().parent().css({ backgroundColor:"#3333aa" });
		var index1 = $(this).parents(".dep1li").index();
		var index2 = $(this).parents(".dep2li").index();
		var index3 = $(this).parent().index();
		active(index1, index2, index3);
	});



	// out 뎁스1,2 이벤트
	$(_this).on('mouseleave focusout', function() {
		active(_depth1, _depth2, _depth3);
	});

	//  실행
	function active($dep1, $dep2, $dep3) {
		var _return = $activeFN($dep1, $dep2, $dep3); // 인텍스리턴
		if (!_return) {
			return
		}
		; // false 값이 넘어오면 아래를 실행하지 않음

		if ($dep1 == -1) { // 1뎁스가 없으면 초기화
			_dep1_ul.find(' li ').removeClass($activeClass);
			_dep2_ul.css({
				'display' : 'none'
			});
			_dep2_ul.find('> li').removeClass($activeClass);
			_dep3_ul.css({
				'display' : 'none'
			});
			_dep3_ul.find('> li').removeClass($activeClass);
			return;
		}
		if ($dep2 == -1) { // 1뎁스가 없으면 초기화										
			_dep2_ul.find('> li').removeClass($activeClass);
			_dep3_ul.css({
				'display' : 'none'
			});
			_dep3_ul.find('> li').removeClass($activeClass);
		//return;
		}

		_dep1_ul.find('li').removeClass($activeClass);
		_dep1_ul.find(' > li').eq($dep1).addClass($activeClass);
		_dep2_ul.css({
			'display' : 'none'
		});
		_dep2_ul.eq($dep1).css({
			'display' : 'block'
		});

		_dep2_ul.find(' > li').removeClass($activeClass);
		_dep1_ul.find(">li").eq($dep1).find(">ul>li").eq($dep2).addClass($activeClass);
		_dep3_ul.css({
			'display' : 'none'
		});
		_dep1_ul.find(">li").eq($dep1).find(">ul>li").eq($dep2).find(">ul").css({
			'display' : 'block'
		});

		_dep3_ul.find(">li").removeClass($activeClass);
		_dep1_ul.find(">li").eq($dep1).find(">ul>li").eq($dep2).find(">ul>li").eq($dep3).addClass($activeClass);



		//				if($dep2 != -1){		// 2뎁이 -1이면 없는 걸로
		//				 	_dep1_ul.find(">li").eq($dep1).find(' li').removeClass($activeClass);
		//				 	_dep1_ul.find(">li").eq($dep1).find(' li:eq('+($dep2)+') ').addClass($activeClass);		  
		//				}

	} // active/

	return {
		setBtn : function($index) {
			var _length = $index.length; // 배열인지를 판단하기위해 
			if (_length) { // 배열
				_depth1 = $index[0];
				_depth2 = $index[1];
				_depth3 = $index[2];
			} else { // 숫자
				_depth1 = $index;
				_depth2 = -1;
				_depth3 = -1;
			}
			active(_depth1, _depth2, _depth3);
		}
	} // return;

} //  imGNBactive3



/**
 * imAccordionMenu				: 아코디언메뉴 
 * @param	$btn				: 버튼 클래스 선택자 이름
 * @param	$cont				: 컨텐츠 클래스 선택자 이름
 * @param	$activeClass		: 활성화 class 이름
 * @method	setBtn($index)		: 활성화 인덱스를 넣으면 해당컨텐츠 활성화
 */
jQuery.fn.imAccordionMenu = function($btn, $cont, $activeClass, $activeFN) {
	var _index = 0;
	var _this = this;
	$activeClass = ($activeClass) ? $activeClass : "on"; // activeClass 없으면 on으로 체크

	$(_this).find($btn).each(function($index) {
		$(this).attr("data-index", $index);
	});

	$(this).find($btn).on("click", function($e) {
		_index = $(this).parent().index();
		active(_index);
	});

	function active($index) {
		if ($activeFN) {
			var _return = $activeFN($index); // 인텍스리턴
			if (!_return) {
				return
			}
			; // false 값이 넘어오면 아래를 실행하지 않음
		}

		if ($(_this).find($btn).eq($index).hasClass($activeClass)) {
			return;
		} // 활성화되어있으면 그냥 넘어간다.

		$(_this).find($btn).removeClass($activeClass);
		$(_this).find($btn).eq($index).addClass($activeClass);

		$(_this).find($cont).slideUp();
		$(_this).find($cont).eq($index).slideDown();
	}

	return {
		setBtn : function($index) {
			active($index);
		}
	}
}



/**
 * imAccordionOverMenu			: 아코디언 오버형태 메뉴 
 * @param	$overAarea			: 오버영역 클래스 선택자 이름
 * @param	$cont				: 컨텐츠 클래스 선택자 이름
 * @param	$activeClass		: 활성화 class 이름
 * @method	setBtn($index)		: 활성화 인덱스를 넣으면 해당컨텐츠 활성화
 */
jQuery.fn.imAccordionOverMenu = function($overAarea, $cont, $activeClass) {
	var _index = 0;
	var _this = this;
	var _time;
	$activeClass = ($activeClass) ? $activeClass : "on"; // activeClass 없으면 on으로 체크

	$(_this).find($overAarea).each(function($index) {
		$(this).attr("data-index", $index);
	});

	$(this).find($overAarea).on("mouseenter", function($e) {
		clearTimeout(_time);
		active($(this).index());
	});
	$(this).find($overAarea).on("mouseleave", function($e) {
		_time = setTimeout(function() {
			active(_index); // 숨겨지는 애니메이션				
		}, 500);

	});

	function active($index) {
		if ($(_this).find($overAarea).eq($index).hasClass($activeClass)) {
			return;
		} // 활성화되어있으면 그냥 넘어간다.

		$(_this).find($overAarea).removeClass($activeClass);
		$(_this).find($overAarea).eq($index).addClass($activeClass);

		$(_this).find($cont).stop().slideUp();
		$(_this).find($cont).eq($index).stop().slideDown();
	}

	return {
		setBtn : function($index) {
			_index = $index
			active($index);
		}
	}
}


/**
	toggleBtn : 토글버튼함수 		//  $(버튼 선택자).imToggleBtn($trueFn,$falseFn)
	@param	$trueFn			: true  일때 호출되는 함수
	@param	$falseFn		: false 일때 호출되는 함수
	@method toggleAllSet("true"/"false")	: 동일한 형태의 버튼을 "true" 이면 "true" 상태로 "false" 이면 "false" 상태로 만듬
	@method betBtn(index)					: 활성화 인덱스를 넣으면 해당 버튼만 "true" 상태로 바꿈
*/
jQuery.fn.imToggleBtn = function($trueFn, $falseFn) {
	var _this,
		_thisAll,
		_e;
	_thisAll = this; // 전체 버튼
	$(_thisAll).attr("data-active", "false"); // 전체 버튼 닫친상태 로

	$(this).on("click", function($e) {
		_this = $(this); // 선택 버튼
		_e = $e; // 이벤트
		if (_this.attr("data-active") == "true") {
			_this.attr("data-active", "false")
		} else {
			_this.attr("data-active", "true")
		}
		; // 클랙된것만 열린상태
		active(_this, true);
		return false;
	});

	// 상태에 따른 실행문
	function active($this, $bb) {
		if ($this.attr("data-active") == "true")
			$trueFn($this, $bb);
		else
			$falseFn($this, $bb);
	}

	return {
		toggleAllSet : function($b) {
			_thisAll._tb = $b;
			if (_thisAll._tb)
				$trueFn(_thisAll);
			else
				$falseFn(_thisAll);

			$(_thisAll).attr("data-active", $b);

		},
		setBtn : function($index) {
			$(_thisAll).attr("data-active", "false");
			$(_thisAll).eq($index).attr("data-active", "true");

			$(_thisAll).each(function($index) {
				active($(_thisAll).eq($index), true);
			});

		},
		setBtnArr : function($arr, $bb) {
			$(_thisAll).attr("data-active", "false");
			for (i = 0; i < $arr.length; ++i) {
				//console.log(">> : "+ i)
				$(_thisAll).eq($arr[i]).attr("data-active", "true");
			}


			$(_thisAll).each(function($index) {
				active($(_thisAll).eq($index), $bb);
			});

		}
	}; // return//
}