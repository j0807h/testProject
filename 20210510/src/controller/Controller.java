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
import model.DTO.SaleDTO;

public class Controller extends HttpServlet {
	protected void 	process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("/regist.jh")) {
			Integer custno = null;
			MemberDAO dao = new MemberDAO();
			custno = dao.getNum();
			req.setAttribute("custno", custno);
			RequestDispatcher dis = req.getRequestDispatcher("regist.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/list.jh")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.memberList();
			req.setAttribute("list", list);
			RequestDispatcher dis = req.getRequestDispatcher("list.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/modify.jh")) {
			String custno = req.getParameter("custno");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.oneSel(custno);
			req.setAttribute("dto", dto);
			RequestDispatcher dis = req.getRequestDispatcher("modify.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/sale.jh")) {
			MemberDAO dao = new MemberDAO();
			List<SaleDTO> list = dao.getSale();
			req.setAttribute("list", list);
			RequestDispatcher dis = req.getRequestDispatcher("sale.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/registAct.jh")) {
			req.setCharacterEncoding("UTF-8");
			MemberDAO dao = new MemberDAO();
			dao.insertMember(req);
			resp.sendRedirect("list.jh");
		} else if(command.equals("/modifyAct.jh")) {
			req.setCharacterEncoding("UTF-8");
			MemberDAO dao = new MemberDAO();
			dao.updateMember(req);
			resp.sendRedirect("list.jh");
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
