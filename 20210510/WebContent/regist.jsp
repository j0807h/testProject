<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import = "java.util.*" %>
    <% Integer custno = (Integer)request.getAttribute("custno"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function valid(){
		if(document.frm.custname.value == ""){
			alert("회원성명이 입력되지 않았습니다. ");
			document.frm.custname.focus();
			return false;
		} 
	}
</script>
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
	<h2>홈쇼핑 회원 등록</h2>
<form action="registAct.jh" method="post" name="frm" onsubmit="return valid();">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td><input type="text" name="custno" value="${custno }" readonly="readonly" /></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" name="custname" /></td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td><input type="text" name="phone" /></td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" name="address" /></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" name="joindate" /></td>
		</tr>
		<tr>
			<th>고객등급(A:VIP, B:일반, C:직원)</th>
			<td><input type="text" name="grade" /></td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td><input type="text" name="city" /></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="등록"/>
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