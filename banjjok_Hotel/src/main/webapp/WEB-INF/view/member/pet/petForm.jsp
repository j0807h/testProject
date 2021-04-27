<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 추가</title>
<link href="<c:url value='/static/css/baseCSS.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/topMenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/myPet.css' />" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
</head>
<body>
  <!-- top -->
     <header>
      <!-- 로고  -->
      <div class="logoArea">
        <a href="/" class="logoImage" style="background-image: url('<c:url value="/static/images/soulMate_logo.png"/>');"></a>
      </div>
      <!-- 나비(메뉴선택 바)  -->
      <div class="navigationWrap">
        <ul class="navigationArea">
          <c:if test="${empty authInfo }">
					<li><a href="<c:url value='/login'/>">Log In</a></li>
					<li><a href="<c:url value='/signUp'/>">Sign Up</a></li>
				</c:if>
				<c:if test="${!empty authInfo }">
					<li>${authInfo.userName }님 환영합니다.</li>
					<li><a href="<c:url value='/main/myPage' />">마이페이지</a></li>
					<li><a href="<c:url value='/main/logout' />">Log Out</a></li>
				</c:if>
        </ul>
      </div>
    </header>  
    <!-- top 끝 --> 
    <!-- 펫정보 -->
    <!-- 사진 / 이름 -->
    <div class="content">
    <div class="mem-summary">
<!--       <img src="#"/> -->
      <span class="img"><i class="fas fa-user-circle fa-7x"></i></span>
      <span>${authInfo.userId }</span>
<!--       <ul class="mem-pet-list"> -->
<!--         <li><a href="#">펫1</a></li> -->
<!--         <li><a href="#">펫2</a></li> -->
<!--       </ul> -->
    </div>
    <!-- 메인 펫 정보 -->
    <form action="petRegist" method="post" name="frm">
    <div class="pet-info-area">
<%--     <c:forEach items="${list }" var="pet"> --%>
      <h2>펫 등록</h2>
      <ul>
        <li>
          <span class="pet-info-title">이름</span>
          <label class="pet-info-input"><input type="text" name="petName" placeholder="펫이름을 입력해주세요." /></label>
        </li>
        <li>
          <span class="pet-info-title">품종</span>
          <label class="pet-info-input"><input type="radio" name="kind" value="D" checked="checked"/>개</label>
        </li>
        <li>
          <span class="pet-info-title">몸무게</span>
          <label class="pet-info-input"><input type="text" name="weight" placeholder="몸무게" />kg</label>
        </li>
        <li>
          <span class="pet-info-title">나이</span>
          <label class="pet-info-input"><input type="text" name="age" placeholder="나이" />세</label>
        </li>
        <li>
          <span class="pet-info-title">성별</span>
          <label class="pet-info-input">
	          <input type="radio" name="gender" value="M"/> 남아
	          &nbsp;&nbsp;&nbsp;&nbsp;
	          <input type="radio" name="gender" value="F"/> 여아
          </label>
        </li>
        <li>
          <span class="pet-info-title">중성화 여부</span>
          <label class="pet-info-input">
	          <input type="radio" name="isNeutral" value="Y" checked="checked"/>Y
	          <input type="radio" name="isNeutral" value="N" onclick="noCheck();"/>N
          </label>
        </li>
        <li>
          <span class="pet-info-title">전자칩</span>
          <label class="pet-info-input"><input type="text" name="microNum" placeholder="전자칩번호를 입력하세요."  /></label>
        </li>
        <li>
          <span class="pet-info-title">성격/버릇</span>
          <label class="pet-info-input"><textarea name="petDesc" placeholder="성격이나 버릇을 입력해주세요." ></textarea></label>
        </li>
      </ul>
<%--       </c:forEach> --%>
    </div>
    <div class="btn-area">
      <input type="button" value="이전으로" onclick="javascript:location.href='<c:url value="/main/myPet"/>'"/>
      <input type="submit" value="저장하기"/>
    </div>
    </form>
    </div>
    <!-- foot -->
    <footer>
      SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved.
    </footer>
    <!-- foot 끝 -->
    <script type="text/javascript">
    	function noCheck(){
    		alert('중성화 된 친구만 등록가능합니다.');
    		document.getElementsByName('isNeutral')[0].checked = 'checked';
    	}
    </script>
</body>
</html>