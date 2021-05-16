<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import = "java.util.*, model.DTO.*" %>
    <% List<SaleDTO> list = (List<SaleDTO>)request.getAttribute("list"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<h2>쇼핑몰 회원관리 ver 1.0</h2>
</header>
<nav>
	<a href="regist.jh">등록</a>
	<a href="list.jh">리스트/수정</a>
	<a href="sale.jh">매출</a>
	<a href="regist.jsp">홈</a>
</nav>
<section>
	<h2>회원매출조회</h2>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<% for(SaleDTO dto : list){ %>
		<tr>
				<td><%=dto.getCustno() %></td>
				<td><%=dto.getCustname() %></td>
				<td>
					<% if(dto.getGrade().equals("A")) out.print("VIP"); %>
					<% if(dto.getGrade().equals("B")) out.print("일반"); %>
					<% if(dto.getGrade().equals("C")) out.print("직원"); %>
				</td>
				<td><%=dto.getPrice() %></td>
		</tr>
		<% } %>
	</table>
</section>
<footer>
	HRDKOREA
</footer>

</body>
</html>