<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3 style="padding-left: 15%; font-weight: 700">쿠폰</h3>

	<div id="table-result" style="width: 800px; float: right;">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th class="tac">쿠폰이름</th>
					<th class="tac">쿠폰기간</th>
					<th class="tac">쿠폰할인률</th>
				</tr>
			</thead>
			<tbody>
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty myPageMember}">
						<c:forEach var="coupon" items="${myPageMember}" varStatus="status">
							<tr>
								<td>${coupon.coupon_name}</td>
								<td>${coupon.coupon_start.substring(0,10)} ~
									${coupon.coupon_end.substring(0,10)}</td>
								<td id="insidehere${status.index}">
									<%-- ${coupon.coupon_discountRate * 100}% --%>
								</td>
							</tr>
							<script type="text/javascript">
							var discountRate = '${coupon.coupon_discountRate * 100}';
								var splitRate = discountRate.split(".0");
								var tost = splitRate[0] + "%";
								$("#insidehere${status.index}").append(tost);
							</script>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" class="tac">보유한 쿠폰이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>