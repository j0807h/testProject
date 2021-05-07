<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, model.DTO.*" %>
    <% List<SaleDTO> list = (List<SaleDTO>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
	<h2>쇼핑몰 회원관리 ver 1.0</h2>
</header>
<nav>
	<a href="cRegist.jh">회원등록</a>
	<a href="cList.jh">회원목록조회/수정</a>
	<a href="cSale.jh">회원매출조회</a>
	<a href="index.jsp">홈으로.</a>
</nav>
<section>
	<h3>회원매출 조회</h3>
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<th>회원성명</th>
			<th>고객등급(A:VIP,B:일반,C:직원)</th>
			<th>매출</th>
		</tr>
		<% for(SaleDTO dto :list) { %>
		<tr>
			<td><%=dto.getCustno() %></td>
			<td><%=dto.getCustname() %></td>
			<td>
				<% if(dto.getGrade().equals("A")) { out.println("VIP"); }%>
				<% if(dto.getGrade().equals("B")) { out.println("일반"); }%>
				<% if(dto.getGrade().equals("C")) { out.println("직원"); }%>
			</td>
			<td><%=dto.getPrice() %> </td>
		</tr>
		<% } %>
	</table>

</section>
<footer>
	HRDKOREA Copyrightⓒ2016 All rights reserved Human Resource Development Service of Korea
</footer>
</body>
</html>