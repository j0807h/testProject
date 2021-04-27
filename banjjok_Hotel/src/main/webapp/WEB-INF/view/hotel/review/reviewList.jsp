<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>reviewList.jsp</title>
<link href="/static/css/baseCSS.css" rel="stylesheet" type="text/css" />
<link href="../static/css/footer.css" rel="stylesheet" type="text/css" />
<link href="../static/css/boardStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="hotel-header">
		<%@ include file="../../include/hotelTop.jsp"%>
	</div>
<div class="hotel-content" style="height:900px; margin-top:20px;">
	<!-- content -->
	  <div class="title">
		<ul>
			<li>
				<h1 style="width:83%;">REVIEW</h1> <span>후기 목록</span>
			</li>
		</ul>
	</div>
	<!-- 스탭 디자인 -->
	<!-- 장바구니 -->
	<div class="orderListArea">
		<h3>총 개 게시글</h3>
		<form action="#" method="post" name="frm" id="frm">
			<table border="1">
				<colgroup>
					<col width="78" />
					<col width="70" />
					<col width="381" />
					<!-- <col width="98" />
					<col width="75" /> -->
					<col width="255" />
					<col width="185" />
					<col width="148" />
					<!-- <col width="98" />
					<col width="110" /> -->
				</colgroup>
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="checkAll" onclick="checkAllPro();" checked='checked'/>
						</th>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<!-- 반복 시작 -->
					<tr>
						<td>
							<input type="checkbox" name="check" id="check"
								value="" onclick="sumAllPrice();" checked='checked' />
						</td>
	            <td class="left">
							1
						</td>
						<td class="left">
							<a href="#">
								<strong>글 제목</strong>
							</a>
						</td>
						<td>
							<span class="txtInfo"> 작성자 아이디
							</span>
						</td>
						<td>
							<div class="txtInfo">
								작성일
							</div>
						</td>
						<td>
							0
						</td>
					<!-- 반복 끝 -->
				</tbody>
				<tfoot class="right">
				</tfoot>
			</table>
	      <!-- 선택상품 제어 버튼 -->
			<div class="selectProductWrap">
				<span class="gLeft"> <a href="#" onclick="">선택 삭제하기</a>
				</span>
	        <span class="gRight"> <a href="#" onclick="">글쓰기</a>
				</span>
			</div>
	</div>
	<!-- content 끝-->
</div>
	<!-- foot -->
	<footer> SoulMate's Forest 02.125.7979 Copyright &copy All
		Rights reserved. </footer>
	<!-- foot 끝 -->
    <script src="script.js"></script>
</body>
</html>