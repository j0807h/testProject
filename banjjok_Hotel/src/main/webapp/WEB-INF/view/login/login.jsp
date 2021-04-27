<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link href="static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<!-- <link href="static/css/topMenu.css" rel="stylesheet" type="text/css" /> -->
<link href="static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="static/css/loginForm.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
/>
</head>
<body>
	<!-- 타이틀 -->
	<div id="topWrapper">
		<a href="javascript:history.back();">
			<span><</span>뒤로가기
		</a>
		<h2>
			Login
		</h2>
	</div>
	<!-- 로그인 -->
	<div id="LoginWrapper">
<!-- 		<div class="LoginNavi"> -->
<!-- 			<!-- 클릭하면 페이지 이동 --> 
<!-- 			<a href="#">회원 로그인</a> -->
<!-- 			<a href="#">관리자 로그인</a> -->
<!-- 		</div> -->
		<div class="LoginDataWrap">
			<!-- 화면 바뀌게 -->
			<form:form action="loginAct" method="post" name="frm"
				modelAttribute="loginCommand"
			>
				<div class="idForm">
					<form:input path="userId" id="userId" placeholder="ID" />
				</div>
				<div class="passForm">
					<input type="password" name="userPw" id="userPw" placeholder="PW" />
				</div>

				<!-- 에러 -->
				<div>
					<form:errors path="userId"/>&nbsp;
					<form:errors path="userPw"/>&nbsp;
					<span>${valid_userId }</span>&nbsp;
					<span>${valid_userPw }</span>
				</div>
				<input type="submit" value="LOG IN" class="loginButton" />
			</form:form>
		</div>
		<!-- 하단 나비 -->
		<div id="bottomWrapper">
			<ul>
				<li><a href="signUp">Sign Up</a></li>
				<li><a href="#">Find ID</a></li>
				<li><a href="#">Find Password</a></li>
			</ul>
		</div>
	</div>

	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- 	<script src="js/script.js"></script> -->
	<!-- foot 끝 -->
</body>

</html>