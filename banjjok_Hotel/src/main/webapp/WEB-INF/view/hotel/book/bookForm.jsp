<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 예약 폼</title>
<link href="<c:url value='/static/css/reserveForm.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/bookForm.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css'/>" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- top -->
	<div id="header">
		<%@include file="../../include/hotelTop.jsp"%>
	</div>
	<!-- top 끝 -->
	<div class="contentWrap" style="width: 620px; margin: 0 auto;">
	<form action="../bookAct" method="post" name="frm" onsubmit="return send();">
		<!-- Content -->
		<div class="content">
			<div class="titleWrap">
				<div class="title">
					<h2>예약하기</h2>
				</div>
				<div class="fieldDesc">
					<!-- <p>서비스 메뉴 등록</p> -->
				</div>
			</div>
			<div class="selectedServiceArea">
				<!-- 예약 서비스 -->
				<ul>
					<input type="hidden" name="roomCode" value="${room.roomCode }" />
					<input type="hidden" name="roomName" value="${room.roomName }" />
				</ul>
				<ul>
					<li><span class="select-menu-name">객실</span>
						<c:if test="${room.roomName == 'D'}"> DELUXE ROOM </c:if>
						<c:if test="${room.roomName == 'DP'}"> DELUXE PREMIUM ROOM </c:if>
						<c:if test="${room.roomName == 'V'}"> VIP ROOM </c:if>
						<c:if test="${room.roomName == 'VV'}"> VVIP ROOM </c:if>
					</li>
					<li><span class="select-menu-price">객실 가격</span><fmt:formatNumber value="${room.roomPrice }" pattern="#,### 원" /> </li>
				</ul>
				<!-- 현재일로부터 14일간만 선택 가능 -->
			</div>
			<div class="selectedServiceArea">
				<!-- 펫 선택 -->
				<div class="select-title">펫 선택</div>
				<input type="hidden" name="petId" value="${pet.petId }"/>
				<c:forEach items="${petList }" var="pet">
					<label class="box-radio-input"> <input type="radio"
						name="petName" value="${pet.petName }" onclick="getPetName('${pet.petId }');" /> <span>${pet.petName }</span>
					</label>
				</c:forEach>
			</div>
			<!-- 펫 끝 -->

			<div class="selectDateArea" id="select-date">
				<!-- 예약 서비스 -->
				<div class="select-title">날짜선택</div>
				<div class="select-title">
<!-- 					<table align="center"> -->
<!-- 						<tr> -->
<!-- 							<th>입실 날짜</th> -->
<!-- 							<th>퇴실 날짜</th> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
							
<!-- 							<td><input type="text" name="chkInDate" placeholder="YYYYMMDD"/></li></td> -->
<!-- 							<td><input type="text" name="chkOutDate" placeholder="YYYYMMDD"/></li></td> -->
<!-- 						</tr> -->
<!-- 					</table> -->
					<ul class="calendar-chk chkIn">
						<li>입실 날짜</li>
						<li><input type="text" name="chkInDate" placeholder="YYYY-MM-DD"  style="width:100%" /></li>
					</ul>
					<ul class="calendar-chk chkOut">
						<li>퇴실 날짜</li>
						<li><input type="text" name="chkOutDate" placeholder="YYYY-MM-DD"  style="width:100%" /></li>
					</ul>
				</div>
				<div class="calendar">
					<div class="month">
						<span onclick="preMonth('${year }','${currMonth - 1 }');"></span>
						${currMonth + 1 }월
						<span onclick="preMonth('${year }','${currMonth + 1 }');"></span>
					</div>
<%-- 					<input type="hidden" name="year" value="${year }" /> --%>
<%-- 					<input type="hidden" name="month" value="${currMonth + 1 }" /> --%>
<%-- 					<input type="hidden" name="date" value="${date }" /> --%>
					<ul class="calendar-month">
						<!-- 요일 -->
						<li>일</li>
						<li>월</li>
						<li>화</li>
						<li>수</li>
						<li>목</li>
						<li>금</li>
						<li>토</li>
					</ul>
					<ul class="calendar-month">
						<!-- 지난달 -->
						<c:forEach items="${pre }" var="pre">
							<li><a class="date none-current">${pre }</a></li>
						</c:forEach>
						<!-- 이번달 -->
						<c:forEach items="${cur }" var="cur" varStatus="status">
							<c:set value="${status.index + pre.size() }" var="line" />
							<c:if test="${line % 7 eq 0 }">
								<br />
							</c:if>
							<li><c:if test="${cur lt date }">
									<a class="date none-current">${cur }</a>
								</c:if> <c:if test="${cur ge date }">
									<label class="date-current">
										<input type="radio" name="date" value="${cur }"
											<c:if test="${cur eq date }">checked</c:if>
											onclick="checkIn('${year }', '${currMonth +1 }', '${cur }');" />
										<span>${cur }</span>
									</label>
								</c:if></li>
						</c:forEach>
						<!-- 다음달 -->
						<c:forEach items="${next }" var="next">
							<li><a class="date none-current">${next }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- 캘린더 끝 -->

			<div class="selectDesignerArea">
				<!-- 예약 서비스 -->
				<div class="select-title">펫시터 선택</div>
				<div class="designer-list">
					<c:forEach items="${sitterList }" var="sitter">
					<div class="select-designer">
						<c:if test="${sitter.sitterOff eq '월' }" ><c:set value="2" var="off"/></c:if>
						<c:if test="${sitter.sitterOff eq '화' }" ><c:set value="3" var="off"/></c:if>
						<c:if test="${sitter.sitterOff eq '수' }" ><c:set value="4" var="off"/></c:if>
						<c:if test="${sitter.sitterOff eq '목' }" ><c:set value="5" var="off"/></c:if>
						<c:if test="${sitter.sitterOff eq '금' }" ><c:set value="6" var="off"/></c:if>
						<c:if test="${sitter.sitterOff eq '토' }" ><c:set value="7" var="off"/></c:if>
						<c:if test="${sitter.sitterOff eq '일' }" ><c:set value="1" var="off"/></c:if>
							<c:set value="${fn:split(sitter.sitterImg,'`') }" var="img" />
							<img class="designer-img" src="<c:url value='/hotel/petSitter/upload/${img[1] }' />" />
						<c:if test="${dayOfWeek != off }">
						<div class=chk-area>
							<ul>
								<li><label class="box-radio-input"> 
										<input type="radio" name="sitterId" value="${sitter.sitterId}" 
										onclick="getId('${sitter.sitterId}');" />
										<span>선택</span> 
									</label></li>
							</ul>
						</div>
						</c:if>
						<div class="designer-Area">
						<c:if test="${dayOfWeek != off }">
							<span class="designer-name">${sitter.sitterName }</span>
<!-- 							<span class="designer-desc">취향저격 스타일전문가(1년)</span> -->
						</c:if>
						<c:if test="${dayOfWeek == off }">
							<span style="color:red; background: #e1e1e1; padding: 10px; border-radius: 40px">펫시터 정기휴일</span>
						</c:if>
						</div>
<%-- 						<c:if test="${dayOfWeek != off }"> --%>
<!-- 						<div class="time-area"> -->
<!-- 							<ul> -->
<!-- 								<li class="off">펫시터 정기휴일</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<%-- 						</c:if> --%>
					</div>
					</c:forEach>
					</div>
				</div>
				<!-- 요청사항 -->
				<div class="selectedServiceArea">
					<div class="select-title">요청사항</div>
					<!-- 예약 서비스 -->
					<div>
						<textarea name="bookDesc"></textarea>
					</div>
					<!-- 현재일로부터 14일간만 선택 가능 -->
				</div> <!-- 요청사항 끝 -->
			</div>
				<div class="btn-wrap">
					<!-- 예약하기 -->
					<div class="price-area">
						<span>총 결제금액</span>
						<span class="price">
							<fmt:formatNumber value="${room.roomPrice }" pattern="#,###" />원
							<input type="hidden" name="roomPrice" value="${room.roomPrice }"/>
						</span>
					</div>
					<div class="btn-area">
						<input type="submit" value="예약하기" />
					</div>
				</div>
			</form>
		</div>
		<!-- Content 끝 -->
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright & copy All sRights reserved. </footer>
	<script src="/static/js/hotelBook.js"></script>
	<!-- foot 끝 -->
	<script>
		// function select(date){
		//   var dateArr = document.querySelectorAll('.date');
		//   for(var i = 0; i < dateArr.length ; i++) {
		//     if(dateArr[i].classList.contains('select-date')){
		//       dateArr[i].classList.remove('select-date')
		//     }
		//   }
		//   date.classList.add('select-date');
		// }
	</script>
	<script src="/static/js/room.js"></script>
	<script type="text/javascript">
		function checkIn(year, month, date){
			if(month.length < 2) month = '0' + month;
			if(document.getElementsByName('chkInDate')[0].value == "") {
				document.getElementsByName('chkInDate')[0].value = year + "-" + month + "-" + date ;
			} else if(document.getElementsByName('chkOutDate')[0].value == "") {
				document.getElementsByName('chkOutDate')[0].value = year + "-" + month + "-" + date ;
			} else if(document.getElementsByName('chkOutDate')[0].value != "") {
				document.getElementsByName('chkInDate')[0].value = "";
				document.getElementsByName('chkOutDate')[0].value = "";
				document.getElementsByName('chkInDate')[0].value = year + "-" + month + "-" + date;
			}
		}
	</script>

</body>
</html>