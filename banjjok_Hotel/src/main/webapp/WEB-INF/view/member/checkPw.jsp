<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 전 비밀번호 확인</title>
<link href="../static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="../static/css/topMenu.css" rel="stylesheet" type="text/css" />
<link href="../static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="../static/css/memPage.css" rel="stylesheet" tyㅊpe="text/css" />
<link href="../static/css/loginForm.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="/" class="logoImage"
				style="background-image: url('../static/images/soulMate_logo.png');"></a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
		<div class="navigationWrap">
			<ul class="navigationArea">
				<c:if test="${empty authInfo }">
					<li><a href="<c:url value='/login'/>">Log In</a></li>
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
	<div id="topWrapper">
<!-- 		<a href="javascript:history.back();"> -->
<!-- 			<span><</span>뒤로가기 -->
<!-- 		</a> -->
<!-- 		<h2> -->
<!-- 			회원정보 수정 -->
<!-- 		</h2> -->
	</div>
	<!-- top 끝 -->
	<!-- content -->
	<div class="content">
		<div id="LoginWrapper">
			<div class="LoginDataWrap">
				<form action="goModify" method="post" name="frm">
					<div class="idForm">
						<input type="text" name="memId" value="${authInfo.userId }"
							readonly="readonly" style="text-align: center;" />
					</div>
					<div class="passForm">
						<input type="password" name="memPw" style="text-align: center;" />
					</div>

					<!-- 에러 -->
					<div class="errors">${pwErr }</div>
					<input type="submit" value="수정" class="loginButton" />
				</form>
			</div>
		</div>

	</div>
	<!-- content 끝 -->
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- foot 끝 -->
</body>
</html>