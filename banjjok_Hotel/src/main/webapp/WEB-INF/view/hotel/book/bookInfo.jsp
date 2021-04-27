<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<link href="<c:url value='/static/css/baseCSS.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/reserveForm.css'/>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
<style type="text/css">
	.selectedServiceArea li {margin-bottom: 15px;}
	.selectedServiceArea li:last-child {margin-bottom: 0;}
</style>
</head>
<body>
<div id="header">
		<%@ include file="../../include/hotelTop.jsp"%>
	</div>
	<div class="contentWrap">
		<!-- Content -->
		<div class="content">
			<div class="titleWrap">
				<div class="title">
					<h2>결제하기</h2>
				</div>
				<div class="fieldDesc">
					<!-- <p>서비스 메뉴 등록</p> -->
				</div>
			</div>
			<form action="../payment" method="post" name="frm" >
				<input type="hidden" name="roomCode" value="${room.roomCode }"/>
				<input type="hidden" name="bookCode" value="${bookInfo.reservCode }"/>
<%-- 				<input type="hidden" name="reservDate" value="${bookInfo.reservDate }"/> --%>
				<input type="hidden" name="bookDesc" value="${bookInfo.reservDesc }"/>
<%-- 				<input type="hidden" name="totalFee" value="${info.serviceFee }"/> --%>
			<div class="selectedServiceArea">
				<!-- 예약 서비스 -->
				<div class="select-title">예약정보</div>
				<ul>
					<li><span >객실이름</span>
						<c:if test="${room.roomName == 'D'}">DELUXE ROOM </c:if>
						<c:if test="${room.roomName == 'DP'}">DELUXE PREMIUM ROOM </c:if>
						<c:if test="${room.roomName == 'V'}">VIP ROOM </c:if>
						<c:if test="${room.roomName == 'VV'}">VVIP ROOM </c:if>
					</li>
					<li><span >담당</span>${sitter.sitterName }</li>
					<li><span >회원이름</span>${bookInfo.memName }</li>
					<li><span >펫 이름</span>${bookInfo.petName }</li>
					<li><span >체크인</span>${fn:substring(bookInfo.chkInDate,0,10) }</li>
					<li><span >체크아웃</span>${fn:substring(bookInfo.chkOutDate,0,10) }</li>
					<li><span >투숙일</span>${(fn:substring(bookInfo.chkOutDate,8,10)) - (fn:substring(bookInfo.chkInDate,8,10) ) }일</li>
					<li><span >요청사항</span>${bookInfo.reservDesc }</li>
				</ul>
<%-- 						<input type="hidden" value="${(fn:substring(bookInfo.chkOutDate,8,10)) - (fn:substring(bookInfo.chkInDate,8,10) ) }" name="period" /> --%>
			</div>
			<div class="selectedServiceArea">
				<!-- 결제정보 입력 -->
				<div class="select-title">결제정보</div>
					<input type="hidden" name="roomPrice" value="${room.roomPrice }" >
				<ul>
					<li><span class="select-menu-price">메뉴가격</span><fmt:formatNumber value="${room.roomPrice }" pattern="#,### 원" /> </li>
					<li><span >총 결제금액</span><fmt:formatNumber value="${room.roomPrice *( (fn:substring(bookInfo.chkOutDate,8,10)) - (fn:substring(bookInfo.chkInDate,8,10) ) ) }" pattern="#,### 원" /></li> 
					<li><span >결제방법</span><input type="radio" name="payMethod" checked="checked" value='card'/>카드</li>
				</ul>
			</div>
			<div class="btn-wrap">
				<!-- 예약하기 -->
				<div class="price-area">
					<span>총 결제금액</span>
					<span class="price">
						<fmt:formatNumber value="${room.roomPrice *( (fn:substring(bookInfo.chkOutDate,8,10)) - (fn:substring(bookInfo.chkInDate,8,10) ) ) }" pattern="#,###" />원
					</span>
						<input type="hidden" name="totalPrice" value="${room.roomPrice *( (fn:substring(bookInfo.chkOutDate,8,10)) - (fn:substring(bookInfo.chkInDate,8,10) ) ) }" />
						
				</div>
				<div class="btn-area">
					<input type="submit" value="결제하기"/>
				</div>
			</div>
		</form>
		</div>
		</div>
		<!-- Content 끝 -->

		<!-- foot -->
		<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
			Rights reserved. </footer>
		<!-- foot 끝 -->
</body>
</html>