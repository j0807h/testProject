<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌보미 상세정보(petSitterInfo.jsp)</title>
<link href="/static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="/static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="/static/css/memberForm.css" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
<style type="text/css">
table td {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../../include/hotelTop.jsp"%>
	<div class="member-regist-wrap">
		<div class="title">
			<h2>돌보미 정보수정</h2>
		</div>
		<form:form action="/hotel/sitterModify" method="post" name="frm"
 			onsubmit="return frmSend();" modelAttribute="petSitterCommand" 
			enctype="multipart/form-data">
			<input type="hidden" name="sitterUse" value="${list.sitterUse }">
			<table border="1">
				<tr>
					<td>구분</td>
					<td>돌보미</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						${list.sitterId } <input type="hidden" name="sitterId"
							value="${list.sitterId }" />
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="sitterPw" id="sitterPw" />
						<div>
							<form:errors path="sitterPw" />
							<p>${PwErr }</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>사진</td>
					<td>
					
					
						<c:set value="${fn:split(list.sitterImg,'`') }" var="i" />
						<input type="file" name="sitterImg" style="display:none;" /> <!-- 파일 업로드창은 안보이게 -->
						<img src="/hotel/petSitter/upload/${i[1] }" alt="돌보미 사진" border="0" 
							style="width: 100px; height: 100px" onclick="document.all.sitterImg.click();"/>
<!-- 							사진 새로 등록시 새로 등록한 사진 보이게 하는거 아직 안 넣음 -->
<%-- 						<button type="button" onclick="imgDel('${i[1]}', this);" --%>
<!-- 							id="delBtn">삭제</button> -->
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<form:input path="sitterName" value="${list.sitterName }" />
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<form:input path="sitterPh" value="${list.sitterPh }" />
					</td>
				</tr>
				<tr>
					<td>휴무일</td>
					<td>
								<c:if test="${list.sitterOff == '월' }">
									매주 월요일
								</c:if>
									<c:if test="${list.sitterOff == '화' }">
									매주 화요일
								</c:if>
									<c:if test="${list.sitterOff == '수' }">
									매주 수요일
								</c:if>
									<c:if test="${list.sitterOff == '목' }">
									매주 목요일
								</c:if>
									<c:if test="${list.sitterOff == '금' }">
									매주 금요일
								</c:if>
									<c:if test="${list.sitterOff == '토' }">
									매주 토요일
								</c:if>
									<c:if test="${list.sitterOff == '일' }">
									매주 일요일
								</c:if> <hr />
						<select id="sitterOff" name="sitterOff" class="sel">
                        	<option value="${list.sitterOff }">수정할 휴무일</option>
                            <option value="월">매주 월요일</option>
                            <option value="화">매주 화요일</option>
                            <option value="수">매주 수요일</option>
                            <option value="목">매주 목요일</option>
                            <option value="금">매주 금요일</option>
                            <option value="토">매주 토요일</option>
                            <option value="일">매주 일요일</option>
                       </select>
<%-- 					<form:input path="sitterOff" value="${list.sitterOff }" /> --%>
					</td>
				</tr>
				<tr>
					<td>입사일</td>
					<td>	
						<form:input path="sitterEnter" value="${list.sitterEnter }"/>
<%-- 						<fmt:formatDate value="EL{list.sitterEnter }" type="date" pattern="yyyy - MM - dd" /> --%>
					</td>
				</tr>
			</table>
			<div class="button-wrap">
				<input type="button" value="이전" onclick="javascript:history.back();" />
				<input type="submit" value="수정" />
				<input type="button" value="탈퇴" onclick="sitterDelete();" />
			</div>
		</form:form>
	</div>

	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- 	<script src="js/script.js"></script> -->
	<!-- foot 끝 -->
	<script src="/static/js/sitter.js"></script>
</body>
</html>

