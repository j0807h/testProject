<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실등록(roomRegist.jsp)</title>
<link href="static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="static/css/signUpForm.css" rel="stylesheet" type="text/css" />
<link href="static/css/topMenu.css" rel="stylesheet" type="text/css" />
<link href="static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="static/css/memberForm.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
</head>
<body>
	<%@ include file="../../include/hotelTop.jsp" %>

<!-- <form action="roomRegistOk" method="post" id="frm" name="frm" enctype="multipart/form-data"> -->
<!-- 	<label for="roomImg">객실사진</label> <hr /> -->
<!-- 	<input type="file" name="roomImg" multiple="multiple" /> -->
<!-- 	<input type="text" name="src" /> -->
<!-- 	<input type="submit" value="등록" /> -->
<!-- </form> -->
<form:form action="roomRegistOk" name="frm" id="frm" method="post" onsubmit="complete();" modelAttribute="roomCommand" enctype="multipart/form-data">
        <!-- 객실 등록  -->
        <div id="member-info">
          <div class="mem-element">
            <p class="element-name"><label for="roomCode">객실 코드</label></p>
<%--             <span class="element-value"><form:input path="roomCode" placeholder="Delux0001_자동생성할까..?"/></span> --%>
<%--             <span class="element-value">${roomCode }</span> --%>
<!--             <span class="button"><input type="button" value="중복확인"/></span> -->
<%--             <div class="element-errors"><form:errors path="roomCode"/> </div> --%>
          </div>
          <div class="mem-element">
            <p class="element-name"><label for="roomName">객실 이름</label></p>
            <span class="element-value">
				<select id="roomName" name="roomName" class="sel"> 
                   	<option>객실을 선택해주세요</option>
                    <option value="D">DELUXE ROOM</option>
                    <option value="DP">DELUXE PREMIUM ROOM</option>
                    <option value="V">VIP ROOM</option>
                    <option value="VV">VVIP ROOM</option>
<!--                     <option value="Add">ADD ROOM</option> -->
                  </select>
            </span>
            
            
            <div class="element-errors"><form:errors path="roomName"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name"><label for="roomImg">객실 사진</label></p>
            <span class="element-value">
				<input type="file" name="roomImg" multiple="multiple" />
<!-- 				<input type="text" name="src" /> -->
			</span>
            <div class="element-errors"><form:errors path="roomImg"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">객실 가격</p>
            <span class="element-value"><form:input path="roomPrice" /></span>
            <div class="element-errors"><form:errors path="roomPrice"/> </div>
          </div>
          <div class="mem-element">
            <p class="element-name">객실 설명</p>
            <span class="element-value"><form:textarea rows="20" cols="50" path="roomDesc" /></span>
<%--             <div class="element-errors"><form:errors path="roomDesc"/> </div> --%>
          </div>
           <div class="button-wrap">
            <input type="button" value="이전" onclick="prevPage();"/>
            <input type="submit" value="가입완료"/>
            <input type="button" value="취소" onclick="cancle();"/>
          </div>
          <div class="mem-element">
            <p class="element-name">비밀번호</p>
            <span class="element-value"><form:password path="roomPw" /></span>
            <div class="element-errors"><form:errors path="roomPw"/> </div>
          </div>
        </div>
      </form:form>
	<!-- foot -->
		<footer> SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved. </footer>
	<!-- foot 끝 -->
	<script src="/static/js/member-regist-wrap.js"></script>
</body>
</html>
