<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, model.DTO.*" %>
    <%
    	List<MemberDTO>list = (List<MemberDTO>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
	<h2>쇼핑몰 회원관리</h2>
</header>
<nav>
	<div class="topMenu">
		<a href="regist.jh">회원등록</a>
		<a href="memberList.jh">회원목록조회/수정</a>
		<a href="memberSales.jh">회원매출조회</a>
		<a href="index.jh">홈으로</a>
	</div>
</nav>
<section>
	<h3>회원목록조회/수정</h3>
	<table border="1">
		<colgroup>
			<col width="100">
			<col width="100">
			<col width="150">
			<col width="250">
			<col width="150">
			<col width="100">
			<col width="100">
		</colgroup>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<% for(MemberDTO dto : list) { %>
		<tr>
			<td>
				<a href="memberModify.jh?custNo=<%=dto.getCustno() %>">
				<%= dto.getCustno() %>
				</a>
			</td>
			<td><%= dto.getCustname() %></td>
			<td><%= dto.getPhone() %></td>
			<td><%= dto.getAddress() %></td>
			<td><%= dto.getJoindate().substring(0, 10) %></td>
			<td><%
					if(dto.getGrade().equals("A")){ out.print("VIP"); }
					if(dto.getGrade().equals("B")){ out.print("일반"); }
					if(dto.getGrade().equals("C")){ out.print("직원"); }
				%>
			</td>
			<td><%= dto.getCity() %></td>
		</tr>
		<% } %>
	</table>
</section>
<footer>
	<span>HKDKOREA Copyright&copy 2016 All reserved Human Resources Development Service of Korea</span>
</footer>
</body>
</html>