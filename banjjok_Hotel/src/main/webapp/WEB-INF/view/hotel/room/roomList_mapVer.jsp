<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실 리스트</title>
</head>
<body>
<a href="/hotel/roomRegist" >객실등록</a>
${list.roomImg }
<c:set value="${fn:split(list.roomImg,'`') }" var="img" />
<c:forEach items="${img }" var="i" varStatus="status">
	<c:if test="${status.count % 2 == 0}">
		<img src="/hotel/room/upload/${i }" />
	</c:if>
</c:forEach>
</body>
</html>