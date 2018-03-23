<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
table, .none, .nonev {
	border: 0;
	line-height: normal;
	background-color: white;
}

.menu {
	background-color: yellow;
	width: 200px;
	height: 200px;
	border-radius: 50px;
	border-color: black;
	border-style: solid;
	border-width: 1em;
	width: 200px;
}

a {
	text-decoration: none;
}

.none {
	width: 40px;
}

.nonev {
	height: 40px;
}

/* test */
@media ( min-width : 768px) {
	.circle-tile {
		margin-bottom: 30px;
	}
}

.circle-tile {
	margin-bottom: 15px;
	text-align: center;
}

.circle-tile-heading {
	position: relative;
	width: 80px;
	height: 80px;
	margin: 0 auto -40px;
	border: 3px solid rgba(255, 255, 255, 0.3);
	border-radius: 100%;
	color: #fff;
	transition: all ease-in-out .3s;
}

/* -- Background Helper Classes */

/* Use these to cuztomize the background color of a div. These are used along with tiles, or any other div you want to customize. */
.dark-blue {
	background-color: #34495e;
}

.green {
	background-color: #16a085;
}

.blue {
	background-color: #2980b9;
}

.orange {
	background-color: #f39c12;
}

.red {
	background-color: #e74c3c;
}

.purple {
	background-color: #8e44ad;
}

.dark-gray {
	background-color: #7f8c8d;
}

.gray {
	background-color: #95a5a6;
}

.light-gray {
	background-color: #bdc3c7;
}

.yellow {
	background-color: #f1c40f;
}

/* -- Text Color Helper Classes */
.text-dark-blue {
	color: #34495e;
}

.text-green {
	color: #16a085;
}

.text-blue {
	color: #2980b9;
}

.text-orange {
	color: #f39c12;
}

.text-red {
	color: #e74c3c;
}

.text-purple {
	color: #8e44ad;
}

.text-faded {
	color: rgba(255, 255, 255, 0.7);
}

.circle-tile-heading .fa {
	line-height: 80px;
}

.circle-tile-content {
	padding-top: 50px;
}

.circle-tile-description {
	text-transform: uppercase;
}

.text-faded {
	color: rgba(255, 255, 255, 0.7);
}

.circle-tile-number {
	padding: 5px 0 15px;
	font-size: 26px;
	font-weight: 700;
	line-height: 1;
}

.circle-tile-footer {
	display: block;
	padding: 5px;
	color: rgba(255, 255, 255, 0.5);
	background-color: rgba(0, 0, 0, 0.1);
	transition: all ease-in-out .3s;
}

.circle-tile-footer:hover {
	text-decoration: none;
	color: rgba(255, 255, 255, 0.5);
	background-color: rgba(0, 0, 0, 0.2);
}

.glyphicon {
	padding-top: 10px;
	font-size: 50px
}
</style>
<script type="text/javascript">
	function tab() {
		sessionStorage.removeItem("tab");
	}
	function menuTab() {
		sessionStorage.removeItem("menu");
	}
	function reservationTab() {
		sessionStorage.removeItem("reservation");
	}
	//텝 세션 삭제
	function faqTabClear() {
		sessionStorage.removeItem("faqtab");
	}
</script>
<title>관리자컨텐츠부분</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row" style="padding-left: 660px;">
			<div class="col-lg-2 col-sm-6">
				<div class="circle-tile">
					<div class="circle-tile-heading dark-blue">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					</div>
					<div class="circle-tile-content dark-blue">
						<div class="circle-tile-description text-faded">회원 관리</div>
						<div class="circle-tile-number text-faded">
							<!-- 내용삽입가능 -->
							<span id="sparklineA"></span>
						</div>
						<div class="dropdown">
							<a type="button" id="about-user" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
							<ul class="dropdown-menu" aria-labelledby="about-user ">
								<li><a href="/adminMember/list.do" onclick="tab();">회원조회</a></li>
								<li><a href="/adminCoupon/couponList">쿠폰관리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-sm-6">
				<div class="circle-tile">
					<div class="circle-tile-heading green">
						<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					</div>
					<div class="circle-tile-content green">
						<div class="circle-tile-description text-faded">메뉴 관리</div>
						<div class="circle-tile-number text-faded">
							<!-- 내용삽입가능 -->
							<span id="sparklineA"></span>
						</div>
						<div class="dropdown">
							<a type="button" id="about-menu" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
							<ul class="dropdown-menu" aria-labelledby="about-menu">
								<li><a href="/menu/menuSelect" onclick="menuTab();">메뉴관리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-sm-6">
				<div class="circle-tile">
					<div class="circle-tile-heading orange">
						<span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span>
					</div>
					<div class="circle-tile-content orange">
						<div class="circle-tile-description text-faded">예약 관리</div>
						<div class="circle-tile-number text-faded">
							<!-- 내용삽입가능 -->
							<span id="sparklineA"></span>
						</div>
						<div class="dropdown">
							<a type="button" id="about-reserve" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
							<ul class="dropdown-menu" aria-labelledby="about-reserve">
								<li><a href="/adminReservation/list"
									onclick="reservationTab();">예약관리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="padding-left: 660px;">
			<div class="col-lg-2 col-sm-6">
				<div class="circle-tile">
					<div class="circle-tile-heading blue">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					</div>
					<div class="circle-tile-content blue">
						<div class="circle-tile-description text-faded">방문 후기 관리</div>
						<div class="circle-tile-number text-faded">
							<!-- 내용삽입가능 -->
							<span id="sparklineA"></span>
						</div>
						<div class="dropdown">
							<a type="button" id="about-review" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
							<ul class="dropdown-menu" aria-labelledby="about-review">
								<li><a href="#">방문후기관리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-sm-6">
				<div class="circle-tile">
					<div class="circle-tile-heading red">
						<span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
					</div>
					<div class="circle-tile-content red">
						<div class="circle-tile-description text-faded">고객 센터 관리</div>
						<div class="circle-tile-number text-faded">
							<!-- 내용삽입가능 -->
							<span id="sparklineA"></span>
						</div>
						<div class="dropdown">
							<a type="button" id="about-notice" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
							<ul class="dropdown-menu" aria-labelledby="about-notice">
								<li><a href="/adminNotice">공지사항관리</a></li>
								<li><a href="/adminFaq/adminFaqList"
									onclick="faqTabClear();">FAQ관리</a></li>
								<li><a href="/adminQuestion">1:1문의관리</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-2 col-sm-6">
				<div class="circle-tile">
					<div class="circle-tile-heading purple">
						<span class="glyphicon glyphicon-signal" aria-hidden="true"></span>
					</div>
					<div class="circle-tile-content purple">
						<div class="circle-tile-description text-faded">통계 관리</div>
						<div class="circle-tile-number text-faded">
							<!-- 내용삽입가능 -->
							<span id="sparklineA"></span>
						</div>
						<div class="dropdown">
							<a type="button" id="about-stats" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"
								class="circle-tile-footer">More Info <i
								class="fa fa-chevron-circle-right"></i></a>
							<ul class="dropdown-menu" aria-labelledby="about-stats">
								<li><a href="/adminChart/reservation">예약통계</a></li>
								<li><a href="/adminChart/member">회원통계</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>