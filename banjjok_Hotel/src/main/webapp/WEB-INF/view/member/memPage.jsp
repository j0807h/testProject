<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 마이페이지</title>
<link href="<c:url value='/static/css/baseCSS.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/topMenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/memPage.css' />" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="/" class="logoImage"
				style="background-image: url('<c:url value="/static/images/soulMate_logo.png"/>');"></a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
		<div class="navigationWrap">
			<ul class="navigationArea">
				<c:if test="${empty authInfo }">
					<li><a href="<c:url value='/login'/>">Log In</a></li>
					<li><a href="<c:url value='/signUp' />">Sign Up</a></li>
				</c:if>
				<c:if test="${!empty authInfo }">
					<li>${authInfo.userName }님환영합니다.</li>
					<li><a href="<c:url value='/main/myPage'/>">마이페이지</a></li>
					<li><a href="<c:url value='/main/logout'/>">Log Out</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<!-- top 끝 -->
	<!-- content -->
	<div class="content">
	<div class="contentSelectWrap">
		<div class="InfoModify">
			<!-- 회원정보 수정 -->
			<h2>회원정보</h2>
			<p>회원 정보를 수정하거나 탈퇴할 수 있습니다.</p>
			<a href="<c:url value='/main/modifyMem'/>" class="modify" >수정</a>
			<a href="#">비밀번호 변경</a>
			<a onclick='return del("${authInfo.userId}");'>회원 탈퇴</a>
		</div>
		<div class="cartInfo">
			<!-- 장바구니 -->
			<h2>마이펫</h2>
			<p>등록된 나의 반려견 정보를 확인할 수 있습니다.</p>
			<a href="<c:url value='/main/myPet'/>" class="modify">내 반쪽</a>
		</div>
		<div class="orderInfo">
			<!-- 주문조회 -->
			<h2>예약현황</h2>
			<p>최근 예약/결제한 서비스를 조회할 수 있습니다.</p>
			<a href="#">호텔</a>
			<a href="#">유치원</a>
			<a href="<c:url value='/main/reserve/salon'/>">살롱</a>
		</div>
		<div class="myInterestInfo">
			<h2>나의 관심</h2>
			<p>내가 관심등록한 상품을 확인할 수 있습니다.</p>
			<a href="#">조회</a>
		</div>
		</div>
	</div>
	<!-- content 끝 -->
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved. </footer>
	<!-- foot 끝 -->
	<script type="text/javascript">
		function del(userId){
			if(confirm('정말 탈퇴하시겠습니까?')) {
				location.href='/main/delMember?memId=' + userId;
			}
			return false;
		}
	</script>
</body>
</html>