<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌보미가입폼(petSitterForm.jsp)</title>
<link href="/static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="/static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="/static/css/sitterForm.css" rel="stylesheet" type="text/css"
/>
</head>
<body>
<form:form action="/hotel/sitterJoin" method="post" name="regFrm" enctype="multipart/form-data" modelAttribute="petSitterCommand">
<div id="header">
	<%@ include file="../../include/hotelTop.jsp" %>
	<div id="wrapper">
    	<div id="content">
   		<!-- id -->
			<div>
				<h3><label for="sitterId">아이디</label></h3>
				<span class="box int_id">
<!-- 					<input type="text" id="sitterId" name="sitterId" class="int" maxlength="20"> -->
					<form:input id="sitterId" path="sitterId" class="int" maxlength="20" />
					<span class="step_url">@banjjok.com</span>
				</span>
				<span class="error_next_box" ><form:errors path="sitterId"/></span>
<%-- 				<span class="error_next_box" >${duplicateId}</span> --%>
			</div>
			 <!-- PW -->
               <div>
                   <h3 class="join_title"><label for="sitterPw">비밀번호</label></h3>
                   <span class="box int_pass">
                       <input type="password" id="sitterPw" name="sitterPw" class="int" maxlength="20">
<!--                        <span id="alertTxt">사용불가</span> -->
                       <img src="/static/images/lock.png" id="pswd1_img1" class="pswdImg">
                   </span>
                   <span class="error_next_box"><form:errors path="sitterPw"/></span>
               </div>

               <!-- PW Con -->
               <div>
                   <h3 class="join_title"><label for="sitterPwCon">비밀번호 재확인</label></h3>
                   <span class="box int_pass_check">
                       <input type="password" id="sitterPwCon" name="sitterPwCon" class="int" maxlength="20">
                       <img src="/static/images/safe.png" id="pswd2_img1" class="pswdImg">
                   </span>
                   <span class="error_next_box"><form:errors path="sitterPwCon"/></span>
					<span class="error_next_box">${pwErr }</span>
               </div>
               
               <!-- NAME -->
               <div>
                   <h3 class="join_title"><label for="sitterName">이름</label></h3>
                   <span class="box int_name">
                       <input type="text" id="sitterName" name="sitterName" class="int" maxlength="20">
                   </span>
                   <span class="error_next_box"><form:errors path="sitterName"/></span>
               </div>
               
               <!-- PHOTO -->
               <div>
               		<h3 class="join_title"><label for="sitterImg">사진</label></h3>
<!-- 					<span class="image"> -->
<!-- 						<img src="#" alt="돌보미 사진" /> -->
<!-- 					</span> -->
					<span class="box int_img filebox" >
						<input type="file" id="sitterImg" name="sitterImg" class="int" />
					</span>
					
					<span class="error_next_box"></span>
					<span class="error_next_box">${noImg }</span>
				</div>
				
               <!-- MOBILE -->
               <div>
                   <h3 class="join_title"><label for="sitterPh">휴대전화</label></h3>
                   <span class="box int_mobile">
                       <input type="tel" id="sitterPh" name="sitterPh" class="int" maxlength="16" placeholder="전화번호 입력">
                   </span>
                   <span class="error_next_box"><form:errors path="sitterPh"/></span>    
               </div>
               
               <!-- OFF -->
               <div>
                   <h3 class="join_title"><label for="sitterOff">정기휴무일</label></h3>
                   <span class="box int_off">
                        <select id="sitterOff" name="sitterOff" class="sel">
                        	<option>요일을 선택하세요</option>
                            <option value="월">월</option>
                            <option value="화">화</option>
                            <option value="수">수</option>
                            <option value="목">목</option>
                            <option value="금">금</option>
                            <option value="토">토</option>
                            <option value="일">일</option>
                       </select>
                   </span>
                   <span class="error_next_box"><form:errors path="sitterOff"/></span>    
               </div>
               <!-- REGISTRATION -->
               <div>
                   <h3 class="join_title"><label for="sitterEnter">입사일</label></h3>
                   <span class="box int_Enter">
                       <input type="date" id="sitterEnter" name="sitterEnter" class="int" maxlength="20" placeholder="YYYY/MM/DD">
                   </span>
                   <span class="error_next_box"><form:errors path="sitterEnter"/></span>
               </div>
				<!-- JOIN BTN-->
                <div class="btn_area">
                    <input type="submit" id="btnJoin" value="가입하기" />
                </div>
		</div> 
        <!-- content 끝-->

    </div> 
    <!-- wrapper 끝-->
<!--     <script src="sitter.js"></script> -->
</div>
</form:form>
	<!-- foot -->
		<footer> SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved. </footer>
	<!-- foot 끝 -->
</body>
</html>