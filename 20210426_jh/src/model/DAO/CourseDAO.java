package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DTO.CourseDTO;

public class CourseDAO {
	ResultSet rs;
	PreparedStatement pstmt;
	Connection con;
	String sql;
	
	public Connection getconnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","1234");
		return con;
	}
	
	public void close() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public List<CourseDTO> SelectAll() {
		List<CourseDTO> list = new ArrayList<CourseDTO>();
		try {
			con = getconnection();
			sql = " select * from course_tbl ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CourseDTO dto = new CourseDTO();
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setCredit(rs.getInt(3));
				dto.setLecturer(rs.getString(4));
				dto.setWeek(rs.getInt(5));
				dto.setStartHour(rs.getInt(6));
				dto.setEndHour(rs.getInt(7));
				list.add(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

	public Integer count() {
		Integer count = null;
		try {
			con = getconnection();
			sql = " select count(*) from course_tbl ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return count = rs.getInt(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
	}

	public CourseDTO oneSel(String id) {
		CourseDTO dto = new CourseDTO();
		try {
			con = getconnection();
			sql = " select * from course_tbl where id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setCredit(rs.getInt(3));
				dto.setLecturer(rs.getString(4));
				dto.setWeek(rs.getInt(5));
				dto.setStartHour(rs.getInt(6));
				dto.setEndHour(rs.getInt(7));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public CourseDTO courseDel(String id) {
		CourseDTO dto = new CourseDTO();
		try {
			con = getconnection();
			sql = " delete * from course_tbl where id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public void insertCourse(HttpServletRequest req) {
		try {
			con = getconnection();
			sql = " insert into course_tbl "
					+ " values( ?,?,?,?,?,?,? ) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("id"));
			pstmt.setString(2,req.getParameter("name") );
			pstmt.setInt(3, Integer.parseInt(req.getParameter("lecturer")));
			pstmt.setString(4, req.getParameter("credit"));
			pstmt.setInt(5, Integer.parseInt(req.getParameter("week")));
			pstmt.setInt(6, Integer.parseInt(req.getParameter("StartHour")));
			pstmt.setInt(7, Integer.parseInt(req.getParameter("endHour")));
			pstmt.executeQuery();
			System.out.println("등록");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

}
