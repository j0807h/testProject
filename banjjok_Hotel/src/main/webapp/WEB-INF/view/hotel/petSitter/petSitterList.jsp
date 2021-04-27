<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="../../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>petSitterList</title>
<link href="/static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="/static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="/static/css/sitterInfo.css" rel="stylesheet" type="text/css" />
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<style type="text/css">
.w3-row-padding {
	margin: 200px;
}

img {
	height: 500px;
	width: 200px;
}
</style>
</head>
<body>
	<div id="hotel-header">
		<%@ include file="../../include/hotelTop.jsp"%>
	</div>
	<!-- The Grid -->
	<div class="hotel-content" style="height:900px; margin-top:20px;">
		<div class="w3-row-padding">
			<c:forEach items="${lists }" var="list" varStatus="cnt">
				<a href="sitterInfo/${list.sitterId}">
					<div class="w3-third" style="width: 350px; margin: 50px;">

						<div class="w3-white w3-text-grey w3-card-4">
							<div class="w3-display-container">
								<c:set value="${fn:split(list.sitterImg,'`') }" var="img" />
								<img src="/hotel/petSitter/upload/${img[1] }"
									style="width: 100%" alt="돌보미이미지" />
								<div class="w3-display-bottomleft w3-container w3-text-black">
									<h2>${list.sitterName }</h2>
								</div>
							</div>
							<div class="w3-container" style="margin-top: 20px">
								<!--           <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i></p> -->
								<p>
									<i
										class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>
									PET SITTER
								</p>

								<p>
									<i
										class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>${list.sitterId }@banjjok.com</p>
								<p>
									<i
										class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${list.sitterPh }</p>
								<hr>
								<!-- End Left Column -->
							</div>
						</div>
					</div>
				</a>
				<!-- sitterInfo 링크 끝 -->
			</c:forEach>
			<div class="w3-third" style="width: 350px; margin: 50px;"
				onclick="javascript:location='/hotel/registSitter'">
				<div class="w3-white w3-text-grey w3-card-4"
					style="border: 1px solid #F2F2F2; height: 630px">
					<img class="img-plus" src="/static/images/profile.png"
						style="width: 200px; height: 200px; display: block; margin: 200px 80px;" />
				</div>
			</div>


			<!-- End Grid -->
		</div>

		<!-- End Page Container -->
	</div>
	</div>

	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- foot 끝 -->
</body>
</html>