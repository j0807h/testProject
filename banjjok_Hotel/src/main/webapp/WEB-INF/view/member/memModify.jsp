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
<link href="../static/css/memPage.css" rel="stylesheet" type="text/css" />
<link href="../static/css/memberForm.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
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
	<!-- top 끝 -->
	<!-- content -->
	<div class="content">
	</div>
	<div class="member-regist-wrap">
      <div class="title">
        <h2>회원가입</h2>
      </div>
      <div class="current-section">
        <!-- 보호자 정보 -->
        <span class="pennant"><span class="fa fa-user fa-2x"></span>&nbsp;보호자 정보</span>
      </div>
      <form action="modifyAct" method="post" name="frm" id="frm">
      	<input type="hidden" name="isMChecked" id="isMChecked"/>
        <!-- 보호자 정보 -->
        <div id="member-info">
          <div class="mem-element">
            <p class="element-name">아이디</p>
            <span class="element-value"><input type="text" name="memId" value="${authInfo.userId }" readonly="readonly"/></span>
          </div>
          <div class="mem-element">
            <p class="element-name">비밀번호</p>
            <span class="element-value"><input type="password" name="memPw"/></span>
            <div class="element-errors"></div>
          </div>
          <div class="mem-element">
            <p class="element-name">휴대폰 번호</p>
            <span class="element-value">${mem.memMobile }</span>
          </div>
          <div class="mem-element">
            <p class="element-name">이름</p>
            <span class="element-value"><input type="text" name="memName" value="${mem.memName }"/></span>
          </div>
          <div class="mem-element">
            <p class="element-name">이메일</p>
            <span class="element-value"><input type="text" name="memEmail" value="${mem.memEmail }"/></span>
          </div>
          <div class="mem-element">
            <p class="element-name">닉네임</p>
            <span class="element-value"><input type="text" name="nicName" value="<c:if test="${mem.nicName != null }">${mem.nicName }</c:if>"/></span>
          </div>
          <div class="button-wrap">
            <input type="submit" value="수정"/>
			<input type="button" value="취소" onclick="javascript:location.href='<c:url value="/main/myPage"/>'"/>
          </div>
        </div>
      </form>
    </div>
	<!-- content 끝 -->
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved. </footer>
	<!-- foot 끝 -->
</body>
</html>