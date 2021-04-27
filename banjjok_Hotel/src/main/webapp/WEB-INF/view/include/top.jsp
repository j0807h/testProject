<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/static/css/topMenu.css'/>" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="<c:url value='/'/>" class="logoImage"
				style="background-image: url('<c:url value="/static/images/soulMate_logo.png"/>');">
			</a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
		<div class="navigationWrap">
			<c:choose>
				<c:when test="${authInfo.grade eq '1' || authInfo.grade eq '2' || authInfo.grade eq '3' || authInfo.grade eq '4' }">
					<ul class="navigationArea">
						<li><a href="<c:url value='/salon'/>">홈</a></li>
						<li><a href="<c:url value='/salon/menu'/>">Menu</a></li>
						<li><a href="<c:url value='/salon/desn'/>">Designer</a></li>
<!-- 						<li><a href="#">Review</a></li> -->
						<li><a href="<c:url value='/salon/preMyPage'/>">My Page</a></li>
						<c:if test="${authInfo.grade eq '1' }">
							<li><a href="<c:url value='/salon/menu/addMenu'/>">Add menu</a></li>
						</c:if>
						<c:if test="${empty authInfo }">
						<li><a href="<c:url value='/login'/>">Log In</a></li>
						</c:if>
						<c:if test="${!empty authInfo }">
						<li><a href="/main/logout">Log out</a></li>
						</c:if>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="navigationArea">
						<li><a href="<c:url value='/salon'/>">홈</a></li>
						<li><a href="<c:url value='/salon/menu'/>">Menu</a></li>
						<li><a href="<c:url value='/salon/desn'/>">Designer</a></li>
<!-- 						<li><a href="#">Review</a></li> -->
						<c:if test="${empty authInfo }">
						<li><a href="<c:url value='/login'/>">Log In</a></li>
						</c:if>
						<c:if test="${!empty authInfo }">
						<li><a href="<c:url value='/main/myPage'/>">My Page</a></li>
						<li><a href="/main/logout">Log out</a></li>
						</c:if>
					</ul>
				</c:otherwise>
			</c:choose>
			<c:if test="${authInfo.grade eq 'mem' }">
				
			</c:if>
		</div>
	</header>
</body>
</html>