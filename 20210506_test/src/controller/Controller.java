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

public class Controller extends HttpServlet{
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("/cRegist.jh")) {
			MemberDAO dao = new MemberDAO();
			Integer custno = dao.getCustno();
			req.setAttribute("custno", custno);
			RequestDispatcher dis = req.getRequestDispatcher("cRegist.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/registAct.jh")) {
			req.setCharacterEncoding("UTF-8");
			MemberDAO dao = new MemberDAO();
			dao.insertMember(req);
			resp.sendRedirect("cList.jh");
		} else if(command.equals("/cList.jh")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getAllMember();
			req.setAttribute("list", list);
			RequestDispatcher dis = req.getRequestDispatcher("cList.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/cModify.jh")) {
			String custno = req.getParameter("custno");
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getOneSel(custno);
			req.setAttribute("dto", dto);
			
			RequestDispatcher dis = req.getRequestDispatcher("cModify.jsp");
			dis.forward(req, resp);
		} else if(command.equals("/modifyAct.jh")) {
			req.setCharacterEncoding("UTF-8");
			MemberDAO dao = new MemberDAO();
			dao.updateMem(req);
			resp.sendRedirect("cList.jh");
		} else if(command.equals("/cSale.jh")) {
			SaleDTO dto = new SaleDTO();
			MemberDAO dao = new MemberDAO();
			List<SaleDTO> list = dao.getListSale();
			req.setAttribute("list", list);
			RequestDispatcher dis = req.getRequestDispatcher("cSale.jsp");
			dis.forward(req, resp);
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

}
