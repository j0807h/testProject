<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function validate(){
		if(document.frm.custname.value == ""){
			alert("회원성명이 입력되지 않았습니다.");
			document.frm.custname.focus();
			return false;
		}else 
		if(document.frm.phone.value == ""){
			alert("회원전화가 입력되지 않았습니다.");
			document.frm.phone.focus();
			return false;
		}else 
		if(document.frm.address.value == ""){
			alert("회원주소가 입력되지 않았습니다.");
			document.frm.address.focus();
			return false;
		}else if(document.frm.joindate.value == ""){
			alert("가입일자가 입력되지 않았습니다.");
			document.frm.joindate.focus();
			return false;
		}else if(document.frm.grade.value == ""){
			alert("고객등급이 입력되지 않았습니다.");
			document.frm.grade.focus();
			return false;
		} else if(document.frm.city.value == ""){
			alert("도시코드가 입력되지 않았습니다.");
			document.frm.city.focus();
			return false;
		} else {
			alert("회원등록이 완료 되었습니다!");
		}
	}
</script>
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
	<form action="registAct.jh" name="frm" method="post" onsubmit="return validate();">
		<table border="1">
			<tr>
				<th>회원번호(자동발생)</th>
				<input type="hidden" name="custno" value="${custno }" />
				<td>${custno }</td>
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
				<th>고객등급(A:VIP,B:일반,C:직원)</th>
				<td><input type="text" name="grade" /></td>
			</tr>
			<tr>
				<th>도시코드</th>
				<td><input type="text" name="city" /></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록" />
					<input type="button" onclick="javascript:location.href='cList.jh'" value="조회" />
				</th>
			</tr>
		</table>
	</form>

</section>
<footer>
	HRDKOREA Copyrightⓒ2016 All rights reserved Human Resource Development Service of Korea
</footer>
</body>
</html>