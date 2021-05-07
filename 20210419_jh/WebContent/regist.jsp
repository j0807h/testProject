<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function validate(){
		if(document.frm.custName.value == ""){
			alert("회원명을 입력해주세요.");
			document.frm.custName.focus();
			return false();
		} else
		if(document.frm.custPh.value == ""){
			alert("회원전화를 입력해주세요.");
			document.frm.custPh.focus();
			return false();
		} else
		if(document.frm.custAddr.value == ""){
			alert("회원주소를 입력해주세요.");
			document.frm.custAddr.focus();
			return false();
		} else
		if(document.frm.joinDate.value == ""){
			alert("가입일을 입력해주세요.");
			document.frm.joinDate.focus();
			return false();
		} else
		if(document.frm.grade.value == ""){
			alert("고객등급을 입력해주세요.");
			document.frm.grade.focus();
			return false();
		} else
		if(document.frm.city.value == ""){
			alert("도시코드를 입력해주세요.");
			document.frm.city.focus();
			return false();
		} else{
		alert("회원가입이 완료되었습니다.");
		}
	}
</script>
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
	<h3>회원등록</h3>
	<form action="registAct.jh" method="post" name="frm" onsubmit="return validate();">
	<input type="hidden" name="custNo" value="${custNo }" />
		<table border="1">
			<tr>
				<th>회원번호(자동발생)</th>
				<td>${custNo }</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="custName" /></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" name="custPh" /></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" name="custAddr" /></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><input type="text" name="joinDate" /></td>
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
					<input type="button" value="조회" onclick="javascript:location.href='memberList.jh'" />
				</th>
			</tr>
		</table>
	</form>
</section>
<footer>
	<span>HKDKOREA Copyright&copy 2016 All reserved Human Resources Development Service of Korea</span>
</footer>
</body>
</html>