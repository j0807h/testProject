<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link href="static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<!-- <link href="static/css/signUpForm.css" rel="stylesheet" type="text/css" /> -->
<link href="static/css/topMenu.css" rel="stylesheet" type="text/css" />
<link href="static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="static/css/memberForm.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
</head>
<body>
	<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="/" class="logoImage"
				style="background-image: url('static/images/soulMate_logo.png');"
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
					<li>${authInfo.userId }님 환영합니다.</li>
					<li><a href="/main/logout">Log Out</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<!-- top 끝 -->

    <div class="member-regist-wrap">
      <div class="title">
        <h2>회원가입</h2>
      </div>
      <div class="current-section">
        <!-- 보호자 정보 -->
        <span class="pennant"><span class="fa fa-user fa-2x"></span>&nbsp;보호자 정보</span>
        <!-- 펫 정보 -->
        <span class="pennant-pet"><span class="fa fa-faw fa-2x"></span>&nbsp;펫 정보</span>
      </div>
      <form:form action="registMem" name="frm" id="frm" method="post" onsubmit="complete();" modelAttribute="signUpCommand">
      	<input type="hidden" name="isMChecked" id="isMChecked"/>
        <!-- 보호자 정보 -->
        <div id="member-info">
          <div class="mem-element">
            <p class="element-name">아이디</p>
            <span class="element-value"><form:input path="memId" placeholder="아이디"/><input type="hidden" name="duplicate" /></span>
<!--             <span class="button"><input type="button" value="중복확인" onclick="isDuplicate();" name="idBtn"/></span> -->
            <div class="element-errors"><form:errors path="memId"/> </div>
<%--             <div class="element-errors"><form:errors path="duplicate"/> </div> --%>
            <div class="element-errors">${noUseId } </div>
          </div>
          <div class="mem-element">
            <p class="element-name">비밀번호</p>
            <span class="element-value"><input type="password" name="memPw" placeholder="비밀번호"/></span>
            <div class="element-errors"><form:errors path="memPw"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">비밀번호 확인</p>
            <span class="element-value"><input type="password" name="memPwCon" placeholder="비밀번호 확인"/></span>
            <div class="element-errors"><form:errors path="memPwCon"/> </div>
            <div class="element-errors">${notEqual }</div>
          </div>
          <div class="mem-element">
            <p class="element-name">휴대폰 번호</p>
            <span class="element-value"><form:input path="memMobile" placeholder="-포함 휴대폰 번호"/></span>
            <span class="button"><input type="button" value="인증" onclick="chkMobile();"/></span>
            <div class="element-errors"><form:errors path="memMobile"/> </div>
          </div>
          <div class="certificate">
          <div class="mem-element">
<!--             <p class="element-name">휴대폰 번호</p> -->
            <span class="element-value"><input type="text" name="ctfNum" placeholder="인증번호를 입력하세요."/></span>
            <span class="button"><input type="button" value="확인" onclick="chkNum();"/></span>
            <div class="element-errors" id="mobile-err"></div>
          </div>
          </div>
          <div class="mem-element">
            <p class="element-name">이름</p>
            <span class="element-value"><form:input path="memName" placeholder="성함"/></span>
            <div class="element-errors"><form:errors path="memName"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">이메일</p>
            <span class="element-value"><form:input path="memEmail" placeholder="이메일"/></span>
            <div class="element-errors"><form:errors path="memEmail"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">닉네임</p>
            <span class="element-value"><form:input path="nicName" placeholder="닉네임"/></span>
          </div>
          <div class="button-wrap">
            <input type="button" value="이전" onclick="javascript:history.back();"/>
            <input type="button" value="다음단계" onclick="nextPage();"/>
          </div>
        </div>
        <!-- 펫 정보 -->
        <div id="pet-info">
          <div class="mem-element">
            <p class="element-name">펫 이름</p>
            <span class="element-value"><form:input path="petName" placeholder="펫 이름"/></span>
            <div class="element-errors"><form:errors path="petName"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">품종</p>
            <span class="element-value">
            	<label  class="element-value">
            	<input type="radio" name="kind" value="D" checked="checked"/><span>개</span>
            	</label>
<%--             	<form:radiobutton path="cat" value="F"/> 여아 --%>
            </span>
          </div>
          <div class="mem-element">
            <p class="element-name">몸무게</p>
            <span class="element-value"><form:input path="weight" placeholder="몸무게"/></span>
            <div class="element-errors"><form:errors path="weight"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">나이</p>
            <span class="element-value"><form:input path="age" placeholder="나이"/></span>
            <div class="element-errors"><form:errors path="age"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">성별</p>
            <span class="element-value">
				<label  class="element-value">
              	<form:radiobutton path="gender" value="M"  /><span>남아</span>
              	</label >
              	<label  class="element-value">
             	<form:radiobutton path="gender" value="F"/><span>여아</span>
             	</label>
            </span>
            <div class="element-errors"><form:errors path="gender"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">중성화 여부</p>
            <span class="element-value">
            	<label  class="element-value">
            	<form:radiobutton path="isNeutral" value="Y"/><span>Y</span>
            	</label>
            	<label  class="element-value">
                <form:radiobutton path="isNeutral" value="N" onclick="block();" id="noNeutral"/><span>N</span>
                </label>
             </span>
             <div class="element-errors"><form:errors path="isNeutral"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">전자칩 번호</p>
            <span class="element-value"><form:input path="microNum" placeholder="전자칩 번호"/></span>
            <div class="element-errors"><form:errors path="microNum"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">성격이나 버릇</p>
            <span class="element-value">
              <form:textarea path="petDesc" placeholder="성격이나 버릇"></form:textarea>
              </span>
          </div>
          <div class="button-wrap">
            <input type="button" value="이전" onclick="prevPage();"/>
            <input type="submit" value="가입완료"/>
            <input type="button" value="취소" onclick="cancle();"/>
          </div>
        </div>
      </form:form>
    </div>
	<!-- foot -->
		<footer> SoulMate's Forest 02.125.7979 Copyright & copy All Rights reserved. </footer>
<%-- 	<script src="<c:url value='/static/js/signUp.js' />"></script> --%>
	<script src="../static/js/signUp.js"></script>
	<!-- foot 끝 -->
	<script type="text/javascript">
	
	</script>
</body>
</html>