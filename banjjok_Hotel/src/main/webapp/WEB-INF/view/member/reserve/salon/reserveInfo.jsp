<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세</title>
<link href="<c:url value='/static/css/baseCSS.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/topMenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/salResInfo.css' />" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
</head>
<body>
	<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="/" class="logoImage"
				style="background-image: url('<c:url value="/static/images/soulMate_logo.png" />');"></a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
		<div class="navigationWrap">
			<ul class="navigationArea">
				<c:if test="${empty authInfo }">
					<li><a href="login">Log In</a></li>
					<li><a href="signUp">Sign Up</a></li>
				</c:if>
				<c:if test="${!empty authInfo }">
					<li>${authInfo.userName }님환영합니다.</li>
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
		<h2>
			<span>
				<c:choose>
					<c:when test="${dto.reservUse eq '0' }">시술예정</c:when>
					<c:when test="${dto.reservUse eq '1' }">시술완료</c:when>
					<c:when test="${dto.reservUse eq '2' }">취소완료</c:when>
				</c:choose>
			</span>
			<span class="d-day">
				<c:choose>
					<c:when test="${dto.reservUse eq '2' }"><i class="far fa-frown"></i></c:when>
					<c:when test="${dto.reservUse eq '1' }"><i class="far fa-smile"></i></c:when>
					<c:otherwise>
						<i class="far fa-calendar-alt"></i>
						<c:set value="<%=new java.util.Date()%>" var="now" />
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
							<c:set var="resDate"><fmt:formatDate value="${dto.reservDate }" pattern="yyyy-MM-dd"/></c:set>
							<fmt:parseNumber value="${dto.reservDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
							<c:if test="${(strDate - nowDate) <= 0}"></c:if>
							<c:if test="${(strDate - nowDate) > 0}">D-${strDate - nowDate }</c:if>
<!-- 						D-12 -->
					</c:otherwise>
				</c:choose>
			</span>
		</h2>
		<div class="reservation-area">
			<ul>
				<li><span class="title">예약번호</span>${dto.reservCode }</li>
				<li><span class="title">날짜/시간</span>
				<fmt:formatDate value="${dto.reservDate }"
						pattern="M월 d일 (E) a HH:mm" /></li>
				<li><span class="title">선택메뉴</span>${dto.serviceName }</li>
				<li><span class="title">담당</span>
				<c:choose>
						<c:when test="${dto.desnUse eq '1' }">원장</c:when>
						<c:when test="${dto.desnUse eq '2' }">수석디자이너</c:when>
						<c:when test="${dto.desnUse eq '3' }">디자이너</c:when>
					</c:choose>${dto.desnName }</li>
			</ul>
		</div>
		<div class="mem-info">
			<ul>
				<li><span class="title">예약자</span>${authInfo.userName }</li>
				<li><span class="title">펫 이름</span>${dto.petName }</li>
				<li><span class="title">연락처</span>${dto.memMobile }</li>
				<li><span class="title">요청사항</span>${dto.reservDesc }</li>
			</ul>
		</div>
		<div class="payment-area">
			<h2>결제정보</h2>
			<ul>
				<li><span class="title">메뉴가격</span><fmt:formatNumber value="${dto.serviceFee }" pattern="#,###"/> </li>
				<li><span class="title">추가금액</span><fmt:formatNumber value="${dto.totalFee - dto.serviceFee }" pattern="#,###"/> </li>
				<li><span class="title">총 결제금액</span>
				<span class="pay-method"><c:choose>
					<c:when test="${dto.payMethod eq 'card' }">카드</c:when>
				</c:choose> </span>
				<fmt:formatNumber value="${dto.totalFee }" pattern="#,###"/>
				</li>
			</ul>
		</div>
		<c:if test="${dto.reservUse eq '2' }">
		<div class="payment-area">
			<h2>취소/환불 정보</h2>
			<ul>
				<li><span class="title">취소날짜/시간</span><fmt:formatDate value="${dto.cancleDate }" pattern="M월 dd일 (E) a HH:mm"/> </li>
				<li><span class="title">총 금액(취소/환불)</span>
				<span class="pay-method" >
				<c:choose>
					<c:when test="${dto.payMethod eq 'card' }">카드</c:when>
				</c:choose> </span>
				<fmt:formatNumber value="${dto.totalFee }" pattern="#,###"/>
				</li>
			</ul>
		</div>
		</c:if>
		<div class="btn-area">
			<c:choose>
				<c:when test="${dto.reservUse eq '1' || dto.reservUse eq '2' }"></c:when>
				<c:otherwise>
					<a class="modify" onclick="modify();">예약변경</a> <a onclick="cancle('${list.reservCode }')">예약취소</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<script type="text/javascript">
		function modify(){
			location.href="/main/reserve/salon/resChange?reservCode=" + ${dto.reservCode};
		}
		function cancle(reservCode) {
			if(confirm('예약을 취소하시겠습니까?')) {
				location.href='/main/reserve/salon/cancle?reservCode=' + reservCode;
			}
		}
	</script>
	<!-- foot 끝 -->
</body>
</html>