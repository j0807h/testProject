<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roomDetail.jsp</title>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link href="/static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="/static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="/static/css/memberForm.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.mySlides {display: none}
 .w3-hover-green:hover{color:#fff!important;background-color:#000!important}
</style>
<body class="w3-border-left w3-border-right">
	<%@ include file="../../include/hotelTop.jsp"%>
	
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-light-grey w3-collapse w3-top" style="z-index:3;width:260px" id="mySidebar">
	  <div class="w3-container w3-display-container w3-padding-16">
	    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-transparent w3-display-topright"></i>
	    <h3>Booking</h3>
	    <c:forEach items="${list }" var="room">
	   		<h3><fmt:formatNumber value="${room.roomPrice }" pattern="#,###" />원</h3>
	    	<h6>per night</h6>
	   	</c:forEach>
	    <hr>
	    <form action="#booking" target="_blank">
	      <p><label><i class="fa fa-calendar-check-o"></i> Check In</label></p>
	      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckIn" required>          
	      <p><label><i class="fa fa-calendar-o"></i> Check Out</label></p>
	      <input class="w3-input w3-border" type="text" placeholder="DD MM YYYY" name="CheckOut" required>         
	      <p><label><i class="fa fa-male"></i> Guardian/Companion </label></p>
	      <input class="w3-input w3-border" type="number" value="0" name="Guardian" min="1" max="6">              
	      <p><label><i class="fa fa-child"></i>	pet</label></p>
	      <input class="w3-input w3-border" type="number" value="1" name="pet" min="0" max="6">
	      <p><button class="w3-button w3-block w3-green w3-left-align" type="submit"><i class="fa fa-search w3-margin-right"></i> Search availability</button></p>
	    </form>
	  </div>
	  <div class="w3-bar-block">
	    <a href="#hotel" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-building"></i> Hotel</a>
	    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-16" onclick="document.getElementById('subscribe').style.display='block'"><i class="fa fa-rss"></i> Subscribe</a>
	    <a href="#contact" class="w3-bar-item w3-button w3-padding-16"><i class="fa fa-envelope"></i> Contact</a>
	  </div>
	</nav>
	
	<!-- Top menu on small screens -->
	<header class="w3-bar w3-top w3-hide-large  w3-xlarge">
<!-- 	  <span class="w3-bar-item">Booking </span> -->
	  <a href="javascript:void(0)" class="w3-right w3-bar-item w3-button" onclick="w3_open()"><i class="fa fa-bars"></i></a>
	</header>
	
	<!-- Overlay effect when opening sidebar on small screens -->
	<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	
	<!-- !PAGE CONTENT! -->
	<div class="w3-main w3-white" style="margin-left:260px">
	
	  <!-- Push down content on small screens -->
	  <div class="w3-hide-large" style="margin-top:80px"></div>
	
	  <!-- Slideshow Header -->
	  <div class="w3-container" id="hotel">
	    <h2 class="w3-text-green">The Forest of BANJJOK Hotel</h2>
			<c:forEach items="${list }" var="room">
				<div class="w3-row w3-large">
	    			<h4><strong>Room Code</strong></h4>
	  					${room.roomCode }
	    		</div><hr />
			
				<c:forTokens items="${room.roomImg }" delims="`" var="img"> 
			    <div class="w3-display-container mySlides">
			    <img src="/hotel/room/upload/${img }" alt="roomImg" style="width:100%;height:800px;margin-bottom:-6px;"/>
<!-- 			    <img src="/w3images/livingroom.jpg" style="width:100%;margin-bottom:-6px"> -->
			      <div class="w3-display-bottomleft w3-container w3-black">
			        <p>
				        <c:if test="${room.roomName == 'D'}"> DELUXE ROOM </c:if>
						<c:if test="${room.roomName == 'DP'}"> DELUXE PREMIUM ROOM </c:if>
						<c:if test="${room.roomName == 'V'}"> VIP ROOM </c:if>
						<c:if test="${room.roomName == 'VV'}"> VVIP ROOM </c:if>
						<input type="hidden" name="roomName" value="${room.roomName }" />
			        </p>
			      </div>
			    </div>	
			    </c:forTokens>
			</c:forEach>
			
			    <div class="w3-display-container mySlides">
			    <img src="/hotel/room/upload/${img }" alt="Room image 없음">
			      <div class="w3-display-bottomleft w3-container w3-black">
			        <p>${room.roomName}</p>
			      </div>
			    </div>
			        
			  </div>
			  <c:forEach items="${list }" var="room">
			  <div class="w3-row-padding w3-section">
				<c:forTokens items="${room.roomImg }" delims="`" var="img" end="3" varStatus="status"> 
			    <div class="w3-col s3">
			      <img class="demo w3-opacity w3-hover-opacity-off" src="/hotel/room/upload/${img }" style="width:100%; height:300px; cursor:pointer;display:inline-block;" onclick="currentDiv(${status.count})" title="${room.roomName}">
			    </div>
			  </c:forTokens>
			  </div>
			</c:forEach>	
		<hr />
	  <div class="w3-container">
	  	
	    <div class="w3-row w3-large">
	    	<h4><strong>Room Price</strong></h4>
	  		<fmt:formatNumber value="${list.get(0).roomPrice }" pattern="#,###" />원
	    </div><hr />
	    <h4><strong>The space</strong></h4>
	    <div class="w3-row w3-large">
	      <div class="w3-col s6">
	        <p><i class="fa fa-fw fa-male"></i> Max people: 4</p>
	        <p><i class="fa fa-fw fa-bath"></i> Bathrooms: 2</p>
	        <p><i class="fa fa-fw fa-bed"></i> Bedrooms: 1</p>
	      </div>
	      <div class="w3-col s6">
	        <p><i class="fa fa-fw fa-clock-o"></i> Check In: After 3PM</p>
	        <p><i class="fa fa-fw fa-clock-o"></i> Check Out: 12PM</p>
	      </div>
	    </div>
	    <hr />
	    	
<!-- 	      <div class="w3-col s6"> -->
<!-- 	        <p><i class="fa fa-fw fa-shower"></i> Shower</p> -->
<!-- 	        <p><i class="fa fa-fw fa-wifi"></i> WiFi</p> -->
<!-- 	        <p><i class="fa fa-fw fa-tv"></i> TV</p> -->
<!-- 	      </div> -->
<!-- 	      <div class="w3-col s6"> -->
<!-- 	        <p><i class="fa fa-fw fa-cutlery"></i> Kitchen</p> -->
<!-- 	        <p><i class="fa fa-fw fa-thermometer"></i> Heating</p> -->
<!-- 	        <p><i class="fa fa-fw fa-wheelchair"></i> Accessible</p> -->
<!-- 	      </div> -->
	    <h4><strong>Room Description</strong></h4>
	    <div class="w3-row w3-large">
	   		${list.get(0).roomDesc }
	    </div>
	    <hr>
	    <h4><strong>Extra Info</strong></h4>
	    <p>Our apartment is really clean and we like to keep it that way. Enjoy the lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	    <p>We accept: <i class="fa fa-credit-card w3-large"></i> <i class="fa fa-cc-mastercard w3-large"></i> <i class="fa fa-cc-amex w3-large"></i> <i class="fa fa-cc-cc-visa w3-large"></i><i class="fa fa-cc-paypal w3-large"></i></p>
	  </div>
	  <hr />
	  <!-- 관리자 모드 -->
	  	<div class="button-wrap">
			<input type="button" value="취소" onclick="cancle();" />
			<input type="submit" value="수정" onclick="javascript:location.href='../roomModi?roomName=${list.get(0).roomName }'";/>
		</div>
	  <hr /><br />
	  
	  <!-- 관리자 모드 끝 -->
	 	<!-- foot -->
		<footer> SoulMate's Forest 02.125.7979 Copyright &copy All Rights reserved. </footer>
		<!-- 	<script src="js/script.js"></script> -->
		<!-- foot 끝 -->
	
	<!-- End page content -->
	</div>

<script src="/static/js/room.js"></script>

</body>
</html>