<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교과목 목록</title>
</head>
<body>
<header>
	<h3>수강신청 도우미 사이트</h3>
</header>
<section>
	<form action="registAc.jh" method="post" name="frm">
		<table border="1">
		<caption><h2>교과목 추가</h2></caption>
			<tr>
				<td>교과목 코드</td>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<option>담당강사선택</option>
						<option value="1">김교수</option>
						<option value="2">이교수</option>
						<option value="3">박교수</option>
						<option value="4">우교수</option>
						<option value="5">최교수</option>
						<option value="6">강교수</option>
						<option value="7">황교수</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit" /></td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" name="week" value="1"/>월
					<input type="radio" name="week" value="2"/>화
					<input type="radio" name="week" value="3"/>수
					<input type="radio" name="week" value="4"/>목
					<input type="radio" name="week" value="5"/>금
				</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input type="text" name="StartHour" /></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="text" name="endHour" /></td>
			</tr>
		</table>
			<input type="button" onclick="javascript:location.href='courseList.jh'" value="목록" />
			<input type="submit" value="완료" />
	</form>
</section>
<footer>
	<span>Copyright (C) 2018 정보처리산업기사 All Right Reserved</span>
</footer>
</body>
</html>