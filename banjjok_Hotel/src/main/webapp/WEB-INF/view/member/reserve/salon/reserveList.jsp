<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>살롱 예약현황</title>
<link href="<c:url value='/static/css/baseCSS.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/topMenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/salResList.css' />" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
</head>
<body>
	<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="/" class="logoImage"
				style="background-image: url('<c:url value="/static/images/soulMate_logo.png" />');"
			></a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
		<div class="navigationWrap">
			<ul class="navigationArea">
				<c:if test="${empty authInfo }">
					<li><a href="login">Log In</a></li>
					<li><a href="signUp">Sign Up</a></li>
				</c:if>
				<c:if test="${!empty authInfo }">
					<li>${authInfo.userName }님 환영합니다.</li>
					<li><a href="/main/myPage">마이페이지</a></li>
					<li><a href="/main/logout">Log Out</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<!-- top 끝 -->
	<!-- 내용 -->
	<div class="content">
		<!-- 예약리스트 -->
		<h2>예약</h2>
		<ul>
			<c:forEach items="${list }" var="list">
				<c:choose>
					<c:when test="${list.reservUse eq '1' || list.reservUse eq '2' }">
						<li class="reserve-menu-area">
							<div class="date-area">
								<i class="fas fa-times-circle"></i> <span><fmt:formatDate
										value="${list.reservDate }" pattern="M/dd (E) a HH:mm" /></span><span
									class="cancle">·
									<c:if test="${list.reservUse eq '1'}">시술완료</c:if>
									<c:if test="${list.reservUse eq '2'}">취소완료</c:if>
									</span>
							</div>
							<div class="menu-area cancle">
								<span class="menu-name">${list.serviceName }</span> <span>
									<c:choose>
										<c:when test="${list.desnUse eq '1' }">원장</c:when>
										<c:when test="${list.desnUse eq '2' }">수석디자이너</c:when>
										<c:when test="${list.desnUse eq '3' }">디자이너</c:when>
									</c:choose> ${list.desnName }
								</span>
<!-- 								<div class="d-day">D-12</div> -->
							</div>
							<div class="btn-area">
								<a hreaf="#" onclick="changeRes('${list.reservCode }');">상세보기</a>
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<li class="reserve-menu-area">
							<div class="date-area">
								<i class="fa fa-clock "></i> <span><fmt:formatDate
										value="${list.reservDate }" pattern="M/dd (E) a HH:mm" /></span>
							</div>
							<div class="menu-area">
								<span class="menu-name">${list.serviceName }</span> <span>
									<c:choose>
										<c:when test="${list.desnUse eq '1' }">원장</c:when>
										<c:when test="${list.desnUse eq '2' }">수석디자이너</c:when>
										<c:when test="${list.desnUse eq '3' }">디자이너</c:when>
									</c:choose> ${list.desnName }
								</span>
								<div class="d-day">
									<c:set value="<%=new java.util.Date()%>" var="now" />
									<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
									<c:set var="resDate"><fmt:formatDate value="${list.reservDate }" pattern="yyyy-MM-dd"/></c:set>
									<fmt:parseNumber value="${list.reservDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
									<c:if test="${(strDate - nowDate) <= 0}"></c:if>
									<c:if test="${(strDate - nowDate) > 0}">D-${strDate - nowDate }</c:if>
								</div>
							</div>
							<div class="btn-area">
							<c:if test="${list.reservUse eq '1' }">
								<a href="#" onclick="changeRes('${list.reservCode }');">상세보기</a>
							</c:if>
							<c:if test="${list.reservUse eq '0' }">
								<a onclick="changeRes('${list.reservCode }');">예약변경</a> <a onclick="cancle('${list.reservCode }')">예약취소</a>
							</c:if>
							</div>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ul>
	</div>
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- foot 끝 -->
	<script type="text/javascript">
		function changeRes(reservCode){
			location.href='/main/reserve/salon/resInfo?reservCode=' + reservCode;
		}
		function cancle(reservCode) {
			if(confirm('예약을 취소하시겠습니까?')) {
				location.href='/main/reserve/salon/cancle?reservCode=' + reservCode;
			}
		}
	</script>
</body>
</body>
</html>