<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import = "java.util.*, model.DTO.*" %>
    <% List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("list"); %>
    
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
	<h2>회원목록조회/수정</h2>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급(A:VIP, B:일반, C:직원)</th>
			<th>거주지역</th>
		</tr>
		<% for(MemberDTO dto : list){ %>
		<tr>
				<td><a href="modify.jh?custno=<%=dto.getCustno() %>"><%=dto.getCustno() %></a></td>
					<input type="hidden" name="custno" value="<%=dto.getCustno() %>" />
				<td><%=dto.getCustname() %></td>
				<td><%=dto.getPhone() %></td>
				<td><%=dto.getAddress() %></td>
				<td><%=dto.getJoindate().substring(0,10) %></td>
				<td>
					<% if(dto.getGrade().equals("A")) out.print("VIP"); %>
					<% if(dto.getGrade().equals("B")) out.print("일반"); %>
					<% if(dto.getGrade().equals("C")) out.print("직원"); %>
				</td>
				<td><%=dto.getCity() %></td>
		</tr>
		<% } %>
	</table>
</section>
<footer>
	HRDKOREA
</footer>

</body>
</html>