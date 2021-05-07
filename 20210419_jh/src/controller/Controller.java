package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.MemberDAO;
import model.DTO.MemberDTO;
import model.DTO.SalesDTO;

public class Controller extends HttpServlet {
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		if(command.equals("/regist.jh")) {
			MemberDAO dao = new MemberDAO();
			Integer custNo = dao.selectCustNo();
			req.setAttribute("custNo", custNo);
			
			RequestDispatcher dis = req.getRequestDispatcher("regist.jsp");
			dis.forward(req, resp);
		}else if(command.equals("/memberList.jh")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.selectAll();
			req.setAttribute("list", list);
			RequestDispatcher dis = req.getRequestDispatcher("memberList.jsp");
			dis.forward(req, resp);			
		}else if(command.equals("/memberSales.jh")) {
			MemberDAO dao = new MemberDAO();
			List<SalesDTO> list = dao.selectSales();
			req.setAttribute("list", list);
			RequestDispatcher dis = req.getRequestDispatcher("memberSales.jsp");
			dis.forward(req, resp);			
		}else if(command.equals("/index.jh")) {
			RequestDispatcher dis = req.getRequestDispatcher("index.jsp");
			dis.forward(req, resp);			
		}else if(command.equals("/memberModify.jh")) {
			String custNo = req.getParameter("custNo");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.selectOne(custNo);
			req.setAttribute("dto", dto);
			RequestDispatcher dis = req.getRequestDispatcher("memberModify.jsp");
			dis.forward(req, resp);	
		}else if(command.equals("/registAct.jh")) {
			req.setCharacterEncoding("utf-8");
			MemberDAO dao = new MemberDAO();
			dao.insertMember(req);
			resp.sendRedirect("regist.jh");
		}else if(command.equals("/modifyAct.jh")) {
			req.setCharacterEncoding("utf-8");
			MemberDAO dao = new MemberDAO();
			dao.updateMember(req);
			resp.sendRedirect("memberList.jh");
		}else if(command.equals("/memberDelete.jh")) {
			String custNo = req.getParameter("custNo");
			MemberDAO dao = new MemberDAO();
			dao.delMember(custNo);
			resp.sendRedirect("memberList.jh");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}

}
