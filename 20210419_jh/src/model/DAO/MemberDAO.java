package model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DTO.MemberDTO;
import model.DTO.SalesDTO;

public class MemberDAO {
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
	
	public Integer selectCustNo() {
		Integer custNo = null;
		try {
			con = getconnection();
			sql = " select max(custno) + 1 from member_tbl_02 ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			return custNo = rs.getInt(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return custNo;
	}

	public void insertMember(HttpServletRequest req) {
		try {
			con = getconnection();
			sql = " insert into member_tbl_02 values(?,?,?,?,?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(req.getParameter("custNo")));
			pstmt.setString(2, req.getParameter("custName"));
			pstmt.setString(3, req.getParameter("custPh"));
			pstmt.setString(4, req.getParameter("custAddr"));
			pstmt.setString(5, req.getParameter("joinDate"));
			pstmt.setString(6, req.getParameter("grade"));
			pstmt.setString(7, req.getParameter("city"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public List<MemberDTO> selectAll() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			con = getconnection();
			String sql = " select * from member_tbl_02 ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setAddress(rs.getString("address"));
				dto.setCity(rs.getString("city"));
				dto.setCustname(rs.getString("custname"));
				dto.setCustno(rs.getInt("custno"));
				dto.setGrade(rs.getString("grade"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setPhone(rs.getString("phone"));
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

	public MemberDTO selectOne(String custNo) {
		MemberDTO dto = new MemberDTO();
		try {
			con = getconnection();
			String sql = " select * from member_tbl_02 where custNo = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setAddress(rs.getString("address"));
				dto.setCity(rs.getString("city"));
				dto.setCustname(rs.getString("custname"));
				dto.setCustno(rs.getInt("custno"));
				dto.setGrade(rs.getString("grade"));
				dto.setJoindate(rs.getString("joindate"));
				dto.setPhone(rs.getString("phone"));
			} 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public void updateMember(HttpServletRequest req) {
		try {
			con = getconnection();
			sql = " update member_tbl_02 set CUSTNAME=?, PHONE=?, ADDRESS=?, JOINDATE=?, GRADE=?, CITY=? where CUSTNO=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("custName"));
			pstmt.setString(2, req.getParameter("custPh"));
			pstmt.setString(3, req.getParameter("custAddr"));
			pstmt.setString(4, req.getParameter("joinDate"));
			pstmt.setString(5, req.getParameter("grade"));
			pstmt.setString(6, req.getParameter("city"));
			pstmt.setInt(7, Integer.parseInt(req.getParameter("custNo")));
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void delMember(String custNo) {
		try {
			con = getconnection();
			sql = " delete from member_tbl_02 where CUSTNO=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custNo);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<SalesDTO> selectSales() {
		List<SalesDTO> list = new ArrayList<>();
		try {
			con = getconnection();
			sql = " select m.custno, custname, grade, sum(price) price " + 
		            " from member_tb1_02 m join money_tbl_02 n " + 
		            " on m.custno = n.custno " + 
		            " group by m.custno, custname, grade " + 
		            " order by price desc ";
			sql = " select m.custno, custname, grade, price " + 
					" from member_tbl_02 m,( select custno, sum(price)price "
					+ 						" from money_tbl_02 group by custno) o " + 
					" where m.custno = o.custno ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SalesDTO dto = new SalesDTO();
				dto.setCustname(rs.getString("custname"));
				dto.setCustno(rs.getInt("custno"));
				dto.setGrade(rs.getString("grade"));
				dto.setPrice(rs.getInt("price"));
//				dto.setCustname(rs.getString(2));
//				dto.setCustno(rs.getInt(1));
//				dto.setGrade(rs.getString(3));
//				dto.setPrice(rs.getInt(4));
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
}
