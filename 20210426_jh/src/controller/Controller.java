package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.CourseDAO;
import model.DTO.CourseDTO;


public class Controller extends HttpServlet {
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		if(command.equals("/courseList.jh")) {
			CourseDAO dao = new CourseDAO();
			List<CourseDTO> list = dao.SelectAll();
			Integer count = dao.count();
			req.setAttribute("list", list);
			req.setAttribute("count", count);
			RequestDispatcher disp = req.getRequestDispatcher("cList.jsp");
			disp.forward(req, resp);
		} else if(command.equals("/courseRegist.jh")) {
			RequestDispatcher disp = req.getRequestDispatcher("cRegist.jsp");
			disp.forward(req, resp);
		} else if(command.equals("/courseModify.jh")) {
			String id = req.getParameter("id");
			CourseDAO dao = new CourseDAO();
			CourseDTO dto = dao.oneSel(id);
			req.setAttribute("dto", dto);
			RequestDispatcher disp = req.getRequestDispatcher("cModify.jsp");
			disp.forward(req, resp);
		} else if(command.equals("/courseDelete.jh")) {
			String id = req.getParameter("id");
			CourseDAO dao = new CourseDAO();
			CourseDTO dto = dao.courseDel(id);
			resp.sendRedirect("courseList.jh");
		} else if(command.equals("/lecturerList.jh")) {
			RequestDispatcher disp = req.getRequestDispatcher("lList.jsp");
			disp.forward(req, resp);
		} else if(command.equals("/lecturerRegist.jh")) {
			RequestDispatcher disp = req.getRequestDispatcher("lRegist.jsp");
			disp.forward(req, resp);
		} else if(command.equals("/lecturerDelete.jh")) {
//			RequestDispatcher disp = req.getRequestDispatcher("lDelete.jsp");
//			disp.forward(req, resp);
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
