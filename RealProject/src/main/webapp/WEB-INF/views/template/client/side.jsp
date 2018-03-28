<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<style type="text/css">
nav.sidebar {
	-webkit-transition: margin 200ms ease-out;
	-moz-transition: margin 200ms ease-out;
	-o-transition: margin 200ms ease-out;
	transition: margin 200ms ease-out;
}

@media ( min-width : 765px) {
	nav.sidebar:hover {
		margin-left: 200px;
	}
	nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand
		{
		margin-left: 0px;
	}
	nav.sidebar .navbar-brand, nav.sidebar .navbar-header {
		text-align: center;
		width: 100%;
		margin-left: 0px;
	}
	nav.sidebar a {
		padding-right: 13px;
	}
	nav.sidebar .navbar-nav>li:first-child {
		border-top: 1px #e5e5e5 solid;
	}
	nav.sidebar .navbar-nav>li {
		border-bottom: 1px #e5e5e5 solid;
	}
	nav.sidebar .navbar-nav .open .dropdown-menu {
		position: static;
		float: none;
		width: auto;
		margin-top: 0;
		background-color: transparent;
		border: 0;
		-webkit-box-shadow: none;
		box-shadow: none;
	}
	nav.sidebar .navbar-collapse, nav.sidebar .container-fluid {
		padding: 0 0px 0 0px;
		background-color: white;
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
		color: #777;
	}
	nav.sidebar {
		width: 200px;
		height: 100%;
		margin-left: -160px;
		float: left;
		margin-bottom: 0px;
		top: 40px;
		left: -220px;
	}
	nav.sidebar li {
		width: 100%;
	}
	nav.sidebar:hover {
		margin-left: 0px;
	}
	.forAnimate {
		opacity: 0;
	}
}

@media ( min-width : 1330px) {
	nav.sidebar {
		margin-left: 0px;
		float: left;
		top: 40px;
		left: -220px;
		background-color: white;
	}
	nav.sidebar .forAnimate {
		opacity: 1;
	}
}

nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus
	{
	color: #CCC;
	background-color: transparent;
}

nav:hover .forAnimate {
	opacity: 1;
}

section {
	padding-left: 15px;
}
</style>
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$(".sidenavs").removeClass("active");
				if ($("#navsidebar").attr("data-side") == 1) {
					$("#nav1").addClass("active");return;
				} else if ($("#navsidebar").attr("data-side") == 2) {
					$("#nav2").addClass("active");return;
				} else if ($("#navsidebar").attr("data-side") == 3) {
					$("#nav3").addClass("active");return;
				} else if ($("#navsidebar").attr("data-side") == 4) {
					$("#nav4").addClass("active");return;
				}
			});
		});
	</script>
	<div class="container-fluid">
		<nav class="navbar navbar-default sidebar" role="navigation"
			id="navsidebar">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-sidebar-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-sidebar-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li id="nav1" class="sidenavs"><a href="/mypage" data-num="1">내
								정보관리<span style="font-size: 16px;"
								class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span>
						</a></li>
						<li id="nav2" class="sidenavs"><a data-num="2"
							href="/mypage/reservationList">예약 내역<span
								style="font-size: 16px;"
								class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
						<li id="nav3" class="sidenavs"><a data-num="3"
							href="/mypage/reservationCancel">예약 취소 내역<span
								style="font-size: 16px;"
								class="pull-right hidden-xs showopacity glyphicon glyphicon-remove-circle"></span>
						</a></li>
						<li id="nav4" class="sidenavs"><a data-num="4"
							href="/mypage/coupon">쿠폰 조회<span style="font-size: 16px;"
								class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span>
						</a></li>
						<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Usuarios <span class="caret"></span><span
								style="font-size: 16px;"
								class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
							<ul class="dropdown-menu forAnimate" role="menu">
								<li><a href="{{URL::to('createusuario')}}">Crear</a></li>
								<li><a href="#">Modificar</a></li>
								<li><a href="#">Reportar</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li class="divider"></li>
								<li><a href="#">Informes</a></li>
							</ul></li> -->
					</ul>
				</div>
			</div>
		</nav>
	</div>
</body>