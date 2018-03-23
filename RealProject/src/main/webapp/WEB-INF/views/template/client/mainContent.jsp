<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%><%@ page
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/include/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/include/css/sticky-footer-navbar.css"
	rel="stylesheet">
<style>
.align {
	padding-left: 35%;
	padding-right: 35%;
}

.carousel, .carousel-inner>.item>img {
	width: 600px;
	height: 500px;
}

.hide-bullets {
	list-style: none;
	margin-left: -40px;
	margin-top: 20px;
}

.thumbnail {
	padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
}

@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&subset=korean')
	;

p, h3 {
	font-family: 'Nanum Gothic Coding', monospace;
}

h3 {
	font-weight: 700;
}
</style>
</head>
<body>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$('#myCarousel').carousel({
				interval : 5000
			});
			// 사진 선택시 메소드
			$('[id^=carousel-selector-]').click(function() {
				var id_selector = $(this).attr("id");
				try {
					var id = /-(\d+)$/.exec(id_selector)[1];
					jQuery('#myCarousel').carousel(parseInt(id));
				} catch (e) {
					console.log('Regex failed!', e);
				}
			});
			// 슬라이드가 끝나면 내용을 변경함.
			$('#myCarousel').on('slid.bs.carousel', function(e) {
				var id = $('.item.active').data('slide-number');
				$('#carousel-text').html($('#slide-content-' + id).html());
				$("#captionName").html($("#img" + id).attr("data-name"));
				$("#captionText").html($("#img" + id).attr("data-text"));
				$("#captionPrice").html($("#img" + id).attr("data-price") + " 원");
			});
		});
	</script>
	<div class="container">
		<div id="main_area">
			<!-- Slider -->
			<div class="row">
				<div class="col-sm-6" id="slider-thumbs">
					<c:choose>
						<c:when test="${not empty menulist}">
							<ul class="hide-bullets">
								<c:forEach var="menu" items="${menulist}" varStatus="status">
									<li class="col-sm-3"><a class="thumbnail"
										id="carousel-selector-${status.index}"> <img
											src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
											id="img${status.index }" data-name="${menu.menu_name }"
											data-text="${menu.menu_text }"
											data-price="${menu.menu_price }">
									</a></li>
								</c:forEach>
							</ul>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
							</tr>
							<script type="text/javascript">
								window.location.href = '/';
							</script>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-sm-6">
					<div class="col-xs-12" id="slider">
						<!-- Top part of the slider -->
						<div class="row">
							<div class="col-sm-12" id="carousel-bounding-box">
								<div class="carousel slide" id="myCarousel">
									<!-- Carousel items -->
									<div class="carousel-inner">
										<c:choose>
											<c:when test="${not empty menulist}">
												<c:forEach var="menu" items="${menulist}" varStatus="status">
													<c:if test="${status.index != 0}">
														<div class="item" data-slide-number="${status.index }">
															<img src="" id="imgMain${status.index}" width=500
																height=400>
														</div>
														<script type="text/javascript">
																var str = '${menu.menu_menufile }';
																var result = str.split("thumbnail_");
																$("#imgMain" + ${status.index}).attr("src", "/uploadStorage/menu/" + result[1]);
															</script>
													</c:if>
													<c:if test="${status.index == 0}">
														<div class="active item"
															data-slide-number="${status.index }">
															<img src="" id="imgMain${status.index}" width=500
																height=400>
														</div>
														<script type="text/javascript">
																var str = '${menu.menu_menufile }';
																var result = str.split("thumbnail_");
																$("#imgMain" + ${status.index}).attr("src", "/uploadStorage/menu/" + result[1]);
															</script>
													</c:if>
												</c:forEach>
											</c:when>
										</c:choose>

									</div>
									<!-- Carousel nav -->
									<a class="left carousel-control" href="#myCarousel"
										role="button" data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left"></span>
									</a> <a class="right carousel-control" href="#myCarousel"
										role="button" data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/Slider-->

			</div>
		</div>
		<br /> <br />
		<div class="well" style="width: 1200px; height: 150px;" align="center">
			<h3 align="center" id="captionName">
				<script type="text/javascript">
					document.write($("#img0").attr("data-name"));
				</script>
			</h3>
			<p align="center" id="captionText">
				<font></font>
				<script type="text/javascript">
					document.write($("#img0").attr("data-text"));
				</script>
			</p>
			<p align="center" id="captionPrice">
				<script type="text/javascript">
					document.write($("#img0").attr("data-price") + " 원");
				</script>
			</p>
		</div>
	</div>

	<%-- 
		<div class="row">
			<div class="align">
				<div class="carousel slide" id="pictureTab" data-ride="carousel">
					<c:choose>
						<c:when test="${not empty menulist}">
							<ol class="carousel-indicators">
								<c:forEach var="menu" items="${menulist}" varStatus="status">
									<li data-target="#pictureTab"
										data-slide-to="${status.count -1 }" class="active"></li>
								</c:forEach>
							</ol>
							<div class="carousel-inner" role="listbox">
								<c:forEach var="menu" items="${menulist}" varStatus="status">
									<c:if test="${status.count -1 == 0 }">
										<div class="item active">
											<img src="/uploadStorage/menu/thumbnail/" id="img1"
												data-num="${menu.menu_no }" width="auto" height="auto"
												alt="...">
											<div class="carousel-caption">
												<h4>${menu.menu_name }</h4>
												<p>${menu.menu_text }</p>
												<p>${menu.menu_price }원</p>
											</div>
										</div>
										<script type="text/javascript">
											var str = '${menu.menu_menufile }';
											var result = str.split("thumbnail_");
											$("#img1").attr("src", "/uploadStorage/menu/" + result[1]);
										</script>
									</c:if>
									<c:if test="${status.count -1 != 0 }">
										<div class="item">
											<img
												src="/uploadStorage/menu/thumbnail/${menu.menu_menufile }"
												id="img2" data-num="${menu.menu_no }" width="auto"
												height="auto" alt="...">
											<div class="carousel-caption">
												<h4>${menu.menu_name }</h4>
												<p>${menu.menu_text }</p>
												<p>${menu.menu_price }원</p>
											</div>
										</div>
										<script type="text/javascript">
											var str = '${menu.menu_menufile }';
											var result = str.split("thumbnail_");
											$("#img2").attr("src", "/uploadStorage/menu/" + result[1]);
										</script>
									</c:if>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="tac">등록된 메뉴가 존재하지 않습니다.</td>
							</tr>
							<script type="text/javascript">
								window.location.href = '/';
							</script>
						</c:otherwise>
					</c:choose>
					<a class="left carousel-control" href="#pictureTab"
						data-slide="prev"> <span class="icon-prev"></span>
					</a> <a class="right carousel-control" href="#pictureTab"
						data-slide="next"> <span class="icon-next"></span>
					</a>
				</div>
			</div>
		</div>
	</div> --%>
	<script src="/resources/include/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/include/dist/js/bootstrap.min.js"></script>
</body>
</html>