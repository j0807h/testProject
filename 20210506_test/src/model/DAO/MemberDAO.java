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
import model.DTO.SaleDTO;

public class MemberDAO {
	String sql;
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;

	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		return con;
	}
	
	public void close() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public Integer getCustno() {
		Integer custno = null;
		try {
			con = getConnection();
			sql = " select nvl(max(custno),100000)+1 from member_tbl_02 ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			custno = rs.getInt(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return custno;
	}

	public void insertMember(HttpServletRequest req) {
		try {
			con = getConnection();
			sql = " insert into member_tbl_02 ( custno, custname, phone, address, joindate, grade, city ) "
					+ " values(?,?,?,?,?,?,?) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(req.getParameter("custno")));
			pstmt.setString(2, req.getParameter("custname"));
			pstmt.setString(3, req.getParameter("phone"));
			pstmt.setString(4, req.getParameter("address"));
			pstmt.setString(5, req.getParameter("joindate"));
			pstmt.setString(6, req.getParameter("grade"));
			pstmt.setString(7, req.getParameter("city"));
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List getAllMember() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			con = getConnection();
			sql = " select * from member_tbl_02 ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setAddress(rs.getString("address"));
				dto.setCity(rs.getString("city"));
				dto.setCustname(rs.getString("custname"));
				dto.setCustno(rs.getString("custno"));
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

	public MemberDTO getOneSel(String custno) {
		MemberDTO dto = new MemberDTO();
		try {
			con = getConnection();
			sql = " select * from member_tbl_02 where custno = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, custno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setAddress(rs.getString("address"));
				dto.setCity(rs.getString("city"));
				dto.setCustname(rs.getString("custname"));
				dto.setCustno(rs.getString("custno"));
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

	public void updateMem(HttpServletRequest req) {
		try {
			con = getConnection();
			sql = " update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? "
					+ " where custno = ?  ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("custname"));
			pstmt.setString(2, req.getParameter("phone"));
			pstmt.setString(3, req.getParameter("address"));
			pstmt.setString(4, req.getParameter("joindate"));
			pstmt.setString(5, req.getParameter("grade"));
			pstmt.setString(6, req.getParameter("city"));
			pstmt.setInt(7, Integer.parseInt(req.getParameter("custno")));
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
	}

	public List<SaleDTO> getListSale() {
		List<SaleDTO> list = new ArrayList<SaleDTO>();
		try {
			con = getConnection();
			sql = " select m.custno, custname, grade, sum(price) price "
					+ " from member_tbl_02 m, money_tbl_02 o "
					+ " where m.custno = o.custno "
					+ " group by m.custno, custname, grade "
					+ " order by m.custno desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SaleDTO dto = new SaleDTO();
				dto.setCustname(rs.getString("custname"));
				dto.setCustno(rs.getString("custno"));
				dto.setGrade(rs.getString("grade"));
				dto.setPrice(rs.getString("price"));
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
