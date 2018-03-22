<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<style>
#header {
	position: relative;
	height: 139px;
	width: 1200px;
	z-index: 999;
}

#header .header_inner {
	position: fixed;
	top: 0;
	width: 1200px;
	height: 139px;
	background-color: #fff;
	z-index: 100;
}

@media screen and (max-width: 1280px) {
	#header .header_inner {
		position: absolute;
		top: auto;
		height: 139px;
		background-color: #fff;
		z-index: 100;
	}
}

#header .logo {
	position: absolute;
	left: 0;
	top: -10px;
	margin: 34px 0 28px 22px;
	z-index: 10
}

#header .logo a {
	position: relative;
	display: inline-block;
	padding: 0px 0;
}

#header.fixeds .logo a {
	width: 30px;
}

#header .logo img.logB {
	width: 165px;
	height: 22px;
}

#header .logo img.logS {
	position: absolute;
	top: 0px;
	left: 0;
	width: 32px;
	height: 22px;
	opacity: 0;
	filter: alpha(opacity = 0);
}
/*    header GNB Conmon  1뎁    */
#header .gnb {
	position: absolute;
	width: 100%;
	height: 64px;
	padding: 20px 0 0 0px;
	text-align: center;
	z-index: 1
}

#header .gnb ul {
	display: inline-block;
	*display: inline;
	zoom: 1;
}

#header .gnb ul li {
	float: left;
}

#header .gnb ul li>a {
	display: inline-block;
	padding: 15px 30px 0 15px;
	height: 49px;
	color: #808285;
	font-size: 14px;
	letter-spacing: 1px;
	font-family: 'Open Sans', 'sans-serif', 'Arial';
	font-weight: 700;
}

#header .gnb ul li:first-child>a {
	/* 	padding-left: 27px;*/
	
}

#header .gnb ul li.last-child>a {
	margin: 0;
}

#header .gnb ul li>a.on, #header .gnb ul li>a:hover, #header .gnb ul li>a:active,
	#header .gnb ul li>a:focus {
	color: #F361A6;
}

#header .gnb ul li.except>a {
	display: none;
}
/* GNB 모션  fixed   */
#header.fixeds .gnb ul li.except>a.on {
	display: inline-block
}

#header.fixeds .header_inner {
	position: fixed;
	margin-top: -84px;
}

@media screen and (max-width: 1280px) {
	#header.fixeds .header_inner {
		position: absolute;
		margin-top: -84px;
	}
}

#header.fixeds .header_inner .logo {
	margin-top: 103px;
}

#header.fixeds .header_inner .logB {
	width: 120px;
	height: 16px;
	opacity: 0;
	filter: alpha(opacity = 0);
}

#header.fixeds .header_inner .logS {
	width: 27px;
	height: 27px;
	top: -40px;
	left: -50px;
	opacity: 1;
	filter: alpha(opacity = 100);
}

#header.fixeds .header_inner .logB_B {
	width: 120px;
	height: 16px;
	opacity: 0;
	filter: alpha(opacity = 0);
}

#header.fixeds .header_inner .logS_B {
	width: 24px;
	height: 16px;
}

#header.fixeds .header_inner .gnb-list>li>a.on {
	position: absolute;
	top: 90px;
	left: 45px;
	background: url("/resources/include/css/images/other_bar.png") 3px 17px
		no-repeat;
	line-height: 1;
	z-index: 99;
}
/*    header gnb Common  2뎁    */
#header .gnb ul li>ul {
	position: absolute;
	left: 0;
	top: 84px;
	width: 100%;
	height: 53px;
	border-top: 1px solid #efefef;
	border-bottom: 1px solid #efefef;
	background-color: #fff;
	text-align: center;
}

#header .gnb ul li>ul li {
	display: inline-block;
	*display: inline;
	zoom: 1;
	float: none;
}

#header .gnb ul li>ul li a span {
	display: inline-block;
	height: 33px;
	color: #a8a9ad;
	font-size: 11px;
	letter-spacing: 1.5px;
	font-family: 'Open Sans', "Spoqa Han Sans", 'sans-serif', 'Arial';
	font-weight: 500;
	vertical-align: top;
}

#header .gnb ul li>ul li a.on span, #header .gnb ul li>ul li a:hover span,
	#header .gnb ul li>ul li a:active span, #header .gnb ul li>ul li a:focus span
	{
	border-bottom: 1px solid #231f20;
	color: #231f20
}

/* header utility Common     */
#header .utility {
	position: absolute;
	right: 0;
	margin: 31px 12px 0 0;
	padding: 0 5px;
	vertical-align: top;
	z-index: 11
}

#header .utility li {
	float: left;
	display: block;
	font-size: 0;
	zoom: 1.2;
	line-height: 0;
	background: url("/resources/include/css/images/util_bar.gif") 0% 50%
		no-repeat
}

#header .utility li:first-child {
	background: none;
}

#header .utility li a {
	display: inline-block;
	padding: 7px 10px 0;
	height: 18px;
	color: #231f20;
	font-size: 10px;
	line-height: 12px;
}

#header .utility li a:hover, #header .utility li a:active, #header .utility li a:focus
	{
	color: #808285
}

/* header dep1view Common     */
#header .dep1view {
	position: absolute;
	top: 91px;
	right: 15px;
	width: 18px;
	height: 18px;
	padding: 12px;
	z-index: 10;
	overflow: hidden
}

#header .dep1view a {
	display: none;
	width: 18px;
	height: 18px;
}

#header .dep1view a span {
	float: left;
	display: block;
	width: 4px;
	height: 4px;
	margin: 1px;
	opacity: 0;
	filter: alpha(opacity = 0);
	background-color: #231f20;
}

#header .dep1view a:hover span {
	background-color: #a8a9ad;
}

/* 인덱스 쪽메뉴 */
#header.dep2-off {
	height: 84px;
}

#header.dep-off .header_inner {
	height: 139px;
}
</style>
</head>
<body data-dep1="" data-dep2="">
	<div id="header" class="dep2-off">
		<div class="header_inner" style="top: 0px; height: 84px;">
			<!-- BRAND -->
			<h1 class="logo">
				<a href="/"><img src="/resources/images/logo.png" class="logB"
					alt="Logo" style="width: 40px; height: 40px;"></a> <a href="/"><img
					src="/resources/images/logo.png" class="logS" alt="Logo"></a>
			</h1>
			<nav class="gnb">
				<ul class="gnb-list">
					<li><a href="/info/info" target="" id="id_gnb_06002" class="">RESTAURANT</a>
						<ul style="display: none;">
							<li><a href="/info/info"><span>INTRODUCE</span></a></li>
							<li><a href="/info/way"><span>WAY</span></a></li>
						</ul></li>
					<li><a href="/usermenu/mainMenu" target="" id="id_gnb_06003"
						class="">MENU</a>
						<ul style="display: none;">
							<li><a href="/usermenu/mainMenu"
								onclick="activeImote(1,-1);"><span>MAIN MENU</span></a></li>
							<li><a href="/usermenu/course" onclick="activeImote(1,-1);"><span>COURSE</span></a></li>
							<li><a href="/usermenu/drink" onclick="activeImote(1,-1);"><span>LIQUOR</span></a></li>
						</ul></li>
					<li><a href="/reservation" target="" id="id_gnb_06004"
						onclick="activeImote(2,-1);" class="">RESERVATION</a>
						<ul style="display: none;">
							<li><a href="/reservation"><span>RESERVE</span></a></li>
						</ul></li>
					<li><a href="#" target="" id="id_gnb_06005" class="">REVIEW</a>
						<ul style="display: none;">
							<li><a href="#"><span>REVIEW</span></a></li>
						</ul></li>
					<li><a href="#" target="" id="id_gnb_06006" class=""
						onclick="activeImote(4,-1);">고객센터</a>
						<ul style="display: none;">
							<li><a href="/userNotice"><span>공지사항</span></a></li>
							<li><a href="#"><span>FAQ</span></a></li>
							<li><c:if test="${login.id != null and login.id != ''}">
									<a
										href="/question/questionList.do?member_no=${login.member_no}"><span>1:1
											문의</span></a>

								</c:if> <c:if test="${login.id == null or login.id == ''}">
									<a href="/login"
										onclick="alert('로그인 후 이용 가능한 서비스입니다. \n로그인 페이지로 이동합니다.');"><span>1:1
											문의</span></a>

								</c:if></li>
						</ul></li>

				</ul>
			</nav>
			<div class="utility">
				<ul class="utility-list">
					<c:choose>
						<c:when test="${login.id != null and login.id != ''}">
							<li>환영합니다 ${login.name}님</li>
							<li><a href="/login/logout" onclick="alert('로그아웃 되었습니다.');">로그아웃</a></li>
							<li class="last-child"><a href="#">내정보관리</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/login">Login</a></li>
							<li class="last-child"><a href="/register/terms">Join</a></li>
						</c:otherwise>
					</c:choose>
					<c:if test="${login.id == null and login.id == ''}">
					</c:if>
				</ul>
			</div>
			<!-- 스크롤을 내렸을때 우측에 생성되는 네모 버튼 -->
			<div class="dep1view">
				<a href="#" class="btn-dep1"> <span></span><span></span><span></span>
					<span></span><span></span><span></span> <span></span><span></span><span></span>
				</a>
			</div>
		</div>
	</div>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
	<script src="/resources/include/js/imMenu.js"></script>
	<script src="/resources/include/js/TweenMax.min.js"></script>
	<script src="/resources/include/js/scrollActive.js"></script>
	<script type="text/javascript">
		var _dep1 = $("body").attr("data-dep1");
		var _dep2 = $("body").attr("data-dep2");
		$('.gnb').imGNBactive("on", gnbActiave).setBtn([ _dep1, _dep2 ]);
		function gnbActiave($index1, $index2) {
			return true;
		}
		// 2뎁 보기 버튼
		$("#header a.btn-dep1").on("click", function($e) {
			$e.preventDefault();
			$("#header").removeClass("fixeds");
			gnbMotion(false);
		})

		function activeImote(a, b) {
			_dep1 = $("body").attr("data-dep1", a);
			_dep2 = $("body").attr("data-dep2", b);
		}
	</script>
</body>
