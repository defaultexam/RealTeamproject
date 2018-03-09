<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<!-- BRAND -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#alignment-example"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/"><img
					src="/resources/images/logo.png" class="img-responsive"
					width="30px" height="30px" alt="Logo"></a>
			</div>
			<!-- COLLAPSIBLE NAVBAR -->
			<div class="collapse navbar-collapse" id="alignment-example">
				<!-- Links -->
				<ul class="nav navbar-nav navbar-left">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">소개 <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="about-us">
							<li><a href="/info/info">레스토랑소개</a></li>
							<li><a href="/info/way">오시는길</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">메뉴 <span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="about-us">
							<li><a href="/usermenu/mainMenu">메인 메뉴</a></li>
							<li><a href="/usermenu/course">코스 요리</a></li>
							<li><a href="/usermenu/drink">주류</a></li>
						</ul></li>
					<li><a href="/reservation">예약</a></li>
					<li><a href="#">방문후기</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">고객센터<span class="caret"></span></a>
						<ul class="dropdown-menu" aria-labelledby="about-us">
							<li><a href="/userNotice">공지사항</a></li>
							<li><a href="#">FAQ</a></li>
							<li><a href="/question">1:1문의</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${login.id != null and login.id != ''}">
							<li>환영합니다 ${login.name}님</li>
							<li class="navbar-right"><a href="/login/logout"
								onclick="alert('로그아웃 되었습니다.');">로그아웃</a></li>
							<li class="navbar-right"><a href="#">내정보관리</a></li>
						</c:when>
						<c:otherwise>
							<li class="navbar-right"><a href="/login">로그인</a></li>
							<li class="navbar-right"><a href="/register">회원가입</a></li>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${login.id == null and login.id == ''}">

					</c:if> --%>
				</ul>
			</div>
		</div>
	</nav>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
