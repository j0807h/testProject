<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, model.DTO.*" %>
    <% List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
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
	<h3>홈쇼핑 회원 등록</h3>
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<th>회원성명</th>
			<th>회원전화</th>
			<th>회원주소</th>
			<th>가입일자</th>
			<th>고객등급(A:VIP,B:일반,C:직원)</th>
			<th>도시코드</th>
		</tr>
		<% for(MemberDTO dto :list) { %>
		<tr>
			<td><a href="cModify.jh?custno=<%= dto.getCustno() %>"><%=dto.getCustno() %></a></td>
			<td><%=dto.getCustname() %></td>
			<td><%=dto.getPhone() %></td>
			<td><%=dto.getAddress() %></td>
			<td><%=dto.getJoindate().substring(0,10) %></td>
			<td>
				<% if(dto.getGrade().equals("A")) { out.println("VIP"); }%>
				<% if(dto.getGrade().equals("B")) { out.println("일반"); }%>
				<% if(dto.getGrade().equals("C")) { out.println("직원"); }%>
			</td>
			<td><%=dto.getCity() %> </td>
		</tr>
		<% } %>
	</table>

</section>
<footer>
	HRDKOREA Copyrightⓒ2016 All rights reserved Human Resource Development Service of Korea
</footer>
</body>
</html>