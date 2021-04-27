<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 결제완료</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
<style type="text/css">
body{
	margin : 0;
}
.content {
  width: 620px;
  margin: 0 auto 100px;
}

.titleWrap {
  text-align: center;
  margin-top : 230px;
  padding : 100px;
}

.titleWrap .title {
  margin-top: 30px;
}

.titleWrap .title h2 {
  font-size: 2em;
}

.titleWrap .fieldDesc {
  padding-top: 80px;
}
p{
	font-size:20px;
}
footer {
  margin: 0 auto;
  /* background: #eee; */
  background: #eadfcd;
  text-align: center;
  position: fixed;
  bottom: 0;
  width: 100%;
  padding: 20px 0;
  left:0;
}	
</style>
</head>
<body>
<%@ include file="../../include/hotelTop.jsp"%>
<div class="titleWrap">
	<div class="title">
		<h2>결제가 완료되었습니다.</h2>
	</div>
	<div class="fieldDesc">
		<p><a href="<c:url value='/hotel'/>">홈으로</a></p>
	</div>
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved. </footer>
	<!-- foot 끝 -->
</div>
</body>
</html>