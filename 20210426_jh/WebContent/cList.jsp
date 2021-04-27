<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ page import = "java.util.*, model.DTO.*" %>
    <%
    	List<CourseDTO> list = (List<CourseDTO>)request.getAttribute("list");
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
	<span>총 ${count }개의 교과목이 있습니다.</span>
	<form action="">
		<table border="1">
			<tr>
				<th>과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>담당강사</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
			</tr>
			<% for(CourseDTO dto : list){ %>
			<input type="hidden" name="id" value="<%=dto.getId() %>">
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getCredit() %></td>
				<td>
					<%
						if(dto.getLecturer().equals("1")){out.print("김교수");}
						if(dto.getLecturer().equals("2")){out.print("이교수");}
						if(dto.getLecturer().equals("3")){out.print("박교수");}
						if(dto.getLecturer().equals("4")){out.print("우교수");}
						if(dto.getLecturer().equals("5")){out.print("최교수");}
						if(dto.getLecturer().equals("6")){out.print("강교수");}
						if(dto.getLecturer().equals("7")){out.print("황교수");}
					%>
				</td>
				<td>
					<%
						if(dto.getWeek() == 1){out.print("월");}
						if(dto.getWeek() == 2){out.print("화");}
						if(dto.getWeek() == 3){out.print("수");}
						if(dto.getWeek() == 4){out.print("목");}
						if(dto.getWeek() == 5){out.print("금");}
					%>
				
				</td>
				<td><%=dto.getStartHour() %></td>
				<td><%=dto.getEndHour() %></td>
				<td><a href="courseModify.jh?id=<%=dto.getId() %>">수정</a> / <a href="courseDelete.jh?id=<%=dto.getId() %>">삭제</a></td>
			</tr>
			<% } %>
		</table>
	</form>
</section>
<footer>
	<span>Copyright (C) 2018 정보처리산업기사 All Right Reserved</span>
</footer>
</body>
</html>