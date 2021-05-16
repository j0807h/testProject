<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import = "java.util.*, model.DTO.*" %>
    <% MemberDTO dto = (MemberDTO)request.getAttribute("dto"); %>
    
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
	<h2>홈쇼핑 회원 정보 수정</h2>
<form action="modifyAct.jh" method="post" name="frm">
	<table border="1">
		<tr>
			<th>회원번호</th>
			<td><input type="text" name="custno" value="<%=dto.getCustno() %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" value="<%=dto.getCustname() %>" /></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" value="<%=dto.getPhone() %>" /></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address" value="<%=dto.getAddress() %>" /></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" value="<%=dto.getJoindate().substring(0,10) %>" /></td>
		</tr>
		<tr>
			<th>고객등급(A:VIP, B:일반, C:직원)</th>
			<td><input type="text" name="grade" value="<%=dto.getGrade() %>" /></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><input type="text" name="city" value="<%=dto.getCity() %>" /></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정"/>
				<input type="button" value="조회"/>
			</th>
		</tr>
	</table>
</form>
</section>
<footer>
	HRDKOREA
</footer>

</body>
</html>