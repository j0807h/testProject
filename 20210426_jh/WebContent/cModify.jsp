<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import = "java.util.*, model.DTO.*" %>
    <%
    	CourseDTO dto = (CourseDTO)request.getAttribute("dto");
    %>
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
	<form action="">
		
		<table border="1">
		<caption><h2>교과목 수정</h2></caption>
			<tr>
				<td>교과목 코드</td>
				<td><input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<option value="<%= dto.getLecturer()%>">					
					<%
						if(dto.getLecturer().equals("1")){out.print("김교수");}
						if(dto.getLecturer().equals("2")){out.print("이교수");}
						if(dto.getLecturer().equals("3")){out.print("박교수");}
						if(dto.getLecturer().equals("4")){out.print("우교수");}
						if(dto.getLecturer().equals("5")){out.print("최교수");}
						if(dto.getLecturer().equals("6")){out.print("강교수");}
						if(dto.getLecturer().equals("7")){out.print("황교수");}
					%>
						</option>
						<% if(!dto.getLecturer().equals("1")){ %>
							<option value="1">김교수</option>
						<% } %>
						<% if(!dto.getLecturer().equals("2")){ %>
							<option value="2">이교수</option>
						<% } %>
						<% if(!dto.getLecturer().equals("3")){ %>
							<option value="3">박교수</option>
						<% } %>
						<% if(!dto.getLecturer().equals("4")){ %>
							<option value="4">우교수</option>
						<% } %>
						<% if(!dto.getLecturer().equals("5")){ %>
							<option value="5">최교수</option>
						<% } %>
						<% if(!dto.getLecturer().equals("6")){ %>
							<option value="6">강교수</option>
						<% } %>
						<% if(!dto.getLecturer().equals("7")){ %>
							<option value="7">황교수</option>
						<% } %>
					</select>
				</td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit" value="<%=dto.getCredit() %>"></td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" name="week" value="<%=dto.getWeek() %>" checked="checked">
						<%
							if(dto.getWeek() == 1){out.print("월");}
							if(dto.getWeek() == 2){out.print("화");}
							if(dto.getWeek() == 3){out.print("수");}
							if(dto.getWeek() == 4){out.print("목");}
							if(dto.getWeek() == 5){out.print("금");}
						%>
					</input>
					<% if(dto.getWeek() != 1) {	%>
						<input type="radio" name="week" value="1"/>월
					<% } %>
					<% if(dto.getWeek() != 2) {	%>
						<input type="radio" name="week" value="2"/>화
					<% } %>
					<% if(dto.getWeek() != 3) {	%>
						<input type="radio" name="week" value="3"/>수
					<% } %>
					<% if(dto.getWeek() != 4) {	%>
						<input type="radio" name="week" value="4"/>목
					<% } %>
					<% if(dto.getWeek() != 5) {	%>
						<input type="radio" name="week" value="5"/>금
					<% } %>
				
				</td>
			</tr>
			<tr>
				<td>시작</td>
				<td><input type="text" name="StartHour" value="<%=dto.getStartHour() %>"></td>
			</tr>
			<tr>
				<td>종료</td>
				<td><input type="text" name="endHour" value="<%=dto.getEndHour()%>"></td>
			</tr>
		</table>
			<input type="button" onclick="javascript:location.href='courseList.jh'" value="목록" />
			<input type="reset" value="취소" />
			<input type="submit" value="완료" />
	</form>
</section>
<footer>
	<span>Copyright (C) 2018 정보처리산업기사 All Right Reserved</span>
</footer>
</body>
</html>