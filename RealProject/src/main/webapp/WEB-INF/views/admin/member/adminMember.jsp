<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="/resources/include/js/jquery-3.3.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		// 이름클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".memberInfo").click(function() {
			var m_no = $(this).parents("tr").attr("data-num");
			$("#member_no").val(m_no);

			// 상세 페이지로 이동하기위한 form에 액션과 전송방식 추가
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/adminMember/memberInfo.do"
			});
			$("#detailForm").submit();
		});

		$("#memberTable").tabs({
			collapsible : true
		});

		$(".tab-li").dbclick(function() {
			$(this).attr({
				"selected" : "selected"
			});
		});
	});
</script>
<style type="text/css">
#memberTable {
	width: 100%;
	height: 800px;
}
</style>
</head>
<body>
	<div id="memberTable">
		<h3>회원관리(기본 정보 조회)</h3>
		<hr>
		<!-- ============== 상세 페이지 이동을 위한 form =========== -->
		<form name="datailForm" id="detailForm">
			<input type="hidden" name="member_no" id="member_no">
		</form>

		<%-- ================ 검색기능 시작 =============== --%>
		<div id="boardSearch">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page }" />
				<input type="hidden" id="order_by" name="order_by"
					value="${data.order_by}" /> <input type="hidden" id="order_sc"
					name="order_sc" value="${data.order_sc}" />

				<table summary="검색">
					<colgroup>
						<col width="85%"></col>
						<col width="15%"></col>
					</colgroup>
					<tr>
						<td id="btd1"><label>생일 조회 : </label> <input type="date"
							id="birth"> <input type="button" value="조회"
							id="birthSearch"> <br> <label>결혼기념일조회 : </label> <input
							type="date" id="marry"> <input type="button" value="조회"
							id="marrySearch"></td>
						<td id="btd2"><input type="button" value="전체보기"
							id="memberSearchTotal"></td>
					</tr>

					<tr>

					</tr>

					<tr>
						<td><select id="pageSize" name="pageSize">
								<option value="10">10개씩 보기</option>
								<option value="30">20개씩 보기</option>
								<option value="50">30개씩 보기</option>
						</select></td>
					</tr>
				</table>
			</form>
		</div>
		<%-- ================ 검색기능 종료 =============== --%>

		<ul id="tab-ul">
			<li class="tab-li"><a href="#tab-1">전체보기</a></li>
			<li class="tab-li"><a href="#tab-2">일반회원</a></li>
			<li class="tab-li"><a href="#tab-3">VIP회원</a></li>
			<li class="tab-li"><a href="#tab-4">탈퇴회원</a></li>
		</ul>

		<div id="tab-1">
			<table border="1">
				<thead>
					<tr>
						<th class="tac">no</th>
						<th class="tac">회원상태</th>
						<th class="tac">회원등급</th>
						<th class="tac">회원번호</th>
						<th class="tac">아이디</th>
						<th class="tac">이름</th>
						<th class="tac">성별</th>
						<th class="tac">생년월일</th>
						<th class="tac">이메일</th>
						<th class="tac">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach var="member" items="${memberList}" varStatus="status">

								<tr data-num="${member.member_no}">
									<td>${member.member_no}</td>
									<td>${member.condition}</td>
									<td>${member.rank}</td>
									<td>${member.member_no}</td>
									<td>${member.id}</td>
									<td class="memberInfo">${member.name}</td>
									<td>${member.gender}</td>
									<td>${member.birthday}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="tac">등록된 회원이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div id="tab-2">
			<table border="1">
				<thead>
					<tr>
						<th class="tac">no</th>
						<th class="tac">회원상태</th>
						<th class="tac">회원등급</th>
						<th class="tac">회원번호</th>
						<th class="tac">아이디</th>
						<th class="tac">이름</th>
						<th class="tac">성별</th>
						<th class="tac">생년월일</th>
						<th class="tac">이메일</th>
						<th class="tac">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach var="member" items="${memberList}" varStatus="status">

								<tr data-num="${member.member_no}">
									<td>${member.member_no}</td>
									<td>${member.condition}</td>
									<td>${member.rank}</td>
									<td>${member.member_no}</td>
									<td>${member.id}</td>
									<td class="memberInfo">${member.name}</td>
									<td>${member.gender}</td>
									<td>${member.birthday}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="tac">등록된 회원이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div id="tab-3">
			<table border="1">
				<thead>
					<tr>
						<th class="tac">no</th>
						<th class="tac">회원상태</th>
						<th class="tac">회원등급</th>
						<th class="tac">회원번호</th>
						<th class="tac">아이디</th>
						<th class="tac">이름</th>
						<th class="tac">성별</th>
						<th class="tac">생년월일</th>
						<th class="tac">이메일</th>
						<th class="tac">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach var="member" items="${memberList}" varStatus="status">

								<tr data-num="${member.member_no}">
									<td>${member.member_no}</td>
									<td>${member.condition}</td>
									<td>${member.rank}</td>
									<td>${member.member_no}</td>
									<td>${member.id}</td>
									<td class="memberInfo">${member.name}</td>
									<td>${member.gender}</td>
									<td>${member.birthday}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="tac">등록된 회원이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<div id="tab-4">
			<table border="1">
				<thead>
					<tr>
						<th class="tac">no</th>
						<th class="tac">회원상태</th>
						<th class="tac">회원등급</th>
						<th class="tac">회원번호</th>
						<th class="tac">아이디</th>
						<th class="tac">이름</th>
						<th class="tac">성별</th>
						<th class="tac">생년월일</th>
						<th class="tac">이메일</th>
						<th class="tac">전화번호</th>
					</tr>
				</thead>
				<tbody>
					<!-- 데이터 출력 -->
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach var="member" items="${memberList}" varStatus="status">

								<tr data-num="${member.member_no}">
									<td>${member.member_no}</td>
									<td>${member.condition}</td>
									<td>${member.rank}</td>
									<td>${member.member_no}</td>
									<td>${member.id}</td>
									<td class="memberInfo">${member.name}</td>
									<td>${member.gender}</td>
									<td>${member.birthday}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
								</tr>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="tac">등록된 회원이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

		<%-- ============= 페이지 네비게이션 시작 ============ --%>
		<%-- <div id="boardPage">
			<tag:paging page="${param.page}" total="${total}" list_size="10" />
		</div> --%>
	</div>

</body>
</html>