<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약변경</title>
<link href="<c:url value='/static/css/baseCSS.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/footer.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/topMenu.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/static/css/reserveForm.css'/>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery.form.js'/>"></script>
</head>
<body>
	<!-- top -->
	<header>
		<!-- 로고  -->
		<div class="logoArea">
			<a href="/" class="logoImage"
				style="background-image: url('<c:url value="/static/images/soulMate_logo.png" />');"></a>
		</div>
		<!-- 나비(메뉴선택 바)  -->
		<div class="navigationWrap">
			<ul class="navigationArea">
				<c:if test="${empty authInfo }">
					<li><a href="login">Log In</a></li>
					<li><a href="signUp">Sign Up</a></li>
				</c:if>
				<c:if test="${!empty authInfo }">
					<li>${authInfo.userName }님환영합니다.</li>
					<li><a href="/main/myPage">마이페이지</a></li>
					<li><a href="/main/logout">Log Out</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<!-- top 끝 -->
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
			<form action="resChangeAct" method="post" name="frm" >
			<input type="hidden" name="reservCode" value="${dto.reservCode }"/>
			<div class="reserve-wrap">
			<div class="selectedServiceArea">
				<!-- 예약 서비스 -->
				<ul>
					<li><span class="select-menu-name">메뉴</span>${dto.serviceName }</li>
					<li><span class="select-menu-price">메뉴가격</span><fmt:formatNumber value="${dto.serviceFee }" pattern="#,###" /> </li>
				</ul>
				<!-- 현재일로부터 14일간만 선택 가능 -->
			</div> <!-- 서비스 끝 -->
			<div class="selectedServiceArea">
				<!-- 펫 선택 -->
				<div class="select-title">펫 선택</div>
				<input type="hidden" name="petName"/>
							<label class="box-radio-input">
								<input type="radio" name="petId" checked readonly="readonly"/>
								<span>${dto.petName }</span>
							</label>
				<!-- 현재일로부터 14일간만 선택 가능 -->
			</div> <!-- 펫 끝 -->
			<div class="selectDateArea">
				<!-- 예약 서비스 -->
				<div class="select-title">날짜선택</div>
				<div class="calendar">
					<div class="month">${currMonth +1 }월</div>
					<input type="hidden" name="year" value="${year }"/>
					<input type="hidden" name="month" value="${currMonth }"/>
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
						<c:set var="stDate"><fmt:formatDate value="${dto.reservDate }" pattern="dd"/></c:set>
						<c:forEach items="${pre }" var="pre">
							<li ><a class="date none-current">${pre }</a></li>
						</c:forEach>
						<!-- 이번달 -->
						<c:forEach items="${cur }" var="cur" varStatus="status">
							<c:set value="${status.index + pre.size() }" var="line"/>
							<c:if test="${line % 7 eq 0 }">
								<br />
							</c:if>
							<c:if test="${cur lt curDate }">
								<li ><a class="date none-current">${cur }</a></li>
							</c:if>
							<c:if test="${cur ge curDate }">
								<li >
									<label class="date-current">
									<input type="radio" name="date" value="${cur }" <c:if test="${cur eq stDate }">checked</c:if> />
									<span>${cur }</span>
									</label>
								</li>
							</c:if>
						</c:forEach>
						<!-- 다음달 -->
						<c:forEach items="${next }" var="next">
							<li><a class="date none-current" >${next }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div> <!-- 캘린더 끝 -->
			<div class="selectDesignerArea" id="reload-area">
				<div class="select-title">디자이너/시간 선택 </div>
				<div class="designer-list">
					<div class="select-designer">
						<c:set value="${fn:split(desn.desnImg,'`') }" var="img" />
						<img class="designer-img" src="/salon/designer/upload/${img[1] }"/>
						<div class="designer-Area">
							<span class="designer-name">
								<c:choose>
									<c:when test="${desn.desnUse eq '1' }">원장</c:when>
									<c:when test="${desn.desnUse eq '2' }">수석디자이너</c:when>
									<c:when test="${desn.desnUse eq '3' }">디자이너</c:when>
								</c:choose>
								${desn.desnName }
							</span>
							<span class="designer-desc">
								안녕하세요,
								<c:choose>
									<c:when test="${desn.desnUse eq '1' }">원장</c:when>
									<c:when test="${desn.desnUse eq '2' }">수석디자이너</c:when>
									<c:when test="${desn.desnUse eq '3' }">디자이너</c:when>
								</c:choose>
								${desn.desnName }입니다. (
								<c:set var="regYear"><fmt:formatDate value="${desn.desnEnter }" pattern="yyyy"/></c:set>
								<c:out value="${year - regYear }"/>년 )
							</span>
						</div>
						<c:set var="offDay" value="${fn:split(desn.desnOff,',') }"/>
						<c:if test="${offDay[0] eq dayOfWeek || offDay[1] eq dayOfWeek}">
							<div class="time-area">
								<ul>
									<li class="off">디자이너 정기휴일</li>
								</ul>
							</div>
						</c:if>
						<c:if test="${offDay[0] ne dayOfWeek && offDay[1] ne dayOfWeek }">
							<div class="time-area">
								<ul>
									<c:set value=":00" var="minute"/>
									<c:set var="resTime"><fmt:formatDate value="${dto.reservDate }" pattern="HH"/></c:set>
									<c:forEach begin="10" end="17" var="hour">
											<li><label class="box-radio-input"> 
												<input type="radio" name="reservTime" value="${hour }${minute}" 
												<c:if test="${resTime eq hour }">checked</c:if> onclick="getId('${desn.desnId}',this)" />
												<span>${hour }${minute}</span>
											</label></li>
									</c:forEach>
<!-- 									<li> -->
<!-- 										<label class="box-radio-input"> -->
<!-- 											<input type="radio" name="reservTime" value="10:00" /><span >10:00</span> -->
<!-- 										</label> -->
<!-- 									</li> -->
								</ul>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 요청사항 -->
			<div class="selectedServiceArea">
				<div class="select-title">요청사항</div>
				<div>
					<textarea name="reservDesc">${dto.reservDesc }</textarea>
				</div>
			</div>
			<!-- 요청사항 끝 -->
			</div>
			<div class="btn-wrap">
				<!-- 예약하기 -->
				<div class="price-area">
					<span>총 결제금액</span>
					<span class="price">
						<fmt:formatNumber value="${dto.serviceFee }" pattern="#,###" />원
						<input type="hidden" name="serviceFee" value="${dro.serviceFee }"/>
					</span>
				</div>
				<div class="btn-area">
					<input type="submit" value="변경하기" />
				</div>
			</div>
		</form>
		</div>
		<!-- Content 끝 -->
		<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- foot 끝 -->
	<script type="text/javascript">
	function getId(desnId, btn){
		var year = $('input:hidden[name="year"]').val();
		var month = $('input:hidden[name="month"]').val();
		var date = $('input:radio[name="date"]:checked').val();
		var time = $(btn).val();
		var data = {
				"desnId" : desnId
				,"year" : year
				,"month" : month
				,"date" : date
				,"time" : time
			};
		console.log(data);
		isReserved = {
				type : "post"
				,url : "/salon/menu/isReserve"
				,data : data
				,dataType : "text"
				,success : function(result){
					if(result != 0) {
						alert('이미 예약된 시간입니다.\n다른 시간을 선택해주세요.');
						$(btn).attr('checked', false);
					} else {
// 						document.getElementsByName('desnId')[0].value = desnId;
// 						document.getElementsByName('desnName')[0].value = desnName;
					}
				}
				,error : function() {}
		};
		$.ajax(isReserved);
	}
	</script>
</body>
</html>