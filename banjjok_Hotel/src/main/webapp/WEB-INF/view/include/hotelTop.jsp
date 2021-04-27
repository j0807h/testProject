<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%-- <%@ include file="../include/include.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="/static/css/hotelTop.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
 	.w3-green,.w3-hover-green:hover{color:#fff!important;background-color:#04B486!important} 
	.w-bar-item{padding:8px 16px;float:left;width:auto;border:none;display:block;outline:0;}
 	.w-bar-item{width:100%;display:block;padding:8px 16px;text-align:left;border:none;white-space:normal;float:none;outline:0;  } 
	 .w-bar-item{text-align:center; }
	.w-large{font-size:20px!important}
</style>
</head>
<body>
<!-- top -->
	<header class=nvH style="margin:20px;">
	 <div>
		<!-- 로고  -->
		<div class="logoAreaH">
			<a href="<c:url value='/'/>" class="logoImageH"
				style="background-image: url('/static/images/soulMate_logo.png');"
			></a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
<!-- 		<div class="navigationWrap"> -->
<!-- 			<ul class="navigationArea"> -->
<!-- 				<li><a href="#"><i class="green fa fa-bed w3-margin-right"></i>Booking</a></li> -->
<!-- 				<li><a href="/hotel/roomList">Room</a></li> -->
<!-- 				<li><a href="/hotel/sitterList">Pet Sitter</a></li> -->
<!-- 				<li><a href="/hotel/reviewList">Review</a></li> -->
<!-- 				<li><a href="#">Log out</a></li> -->
<!-- 			</ul> -->
<!-- 		</div> -->
		<!-- Navigation Bar -->
		<div class="w-bar w3-white w-large navigationWrap">
			<ul class="navigationArea">
			  <li><a href="/hotel/roomList" class="w3-bar-item w3-button w3-green w3-mobile"><i class="fa fa-bed w3-margin-right"></i>Booking</a></li>
			  <li><a href="/hotel/roomList" class="w3-bar-item w3-button w3-mobile">Rooms</a></li>
			  <li><a href="/hotel/sitterList" class="w3-bar-item w3-button w3-mobile">Pet Sitter</a></li>
			  <li><a href="/hotel/reviewList" class="w3-bar-item w3-button w3-mobile">Review</a></li>
			  <li><a href="/main/logout" class="w3-bar-item w3-button w3-right w3-light-grey w3-mobile">Log out</a></li>
		  </ul>
		</div>
	 </div>
	</header>
</body>
</html>