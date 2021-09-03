package com.phone.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.phone.dao.PhoneBookDAO;
import com.phone.dao.PhoneBookDAOImpl;
import com.phone.vo.PhoneBookVO;

@WebServlet("/ServletMiniProject")
public class PhoneBookController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		
		if ("form".equals(actionName)) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/phonelist/form.jsp");
			rd.forward(req, resp);
		} else {
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.getList();
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/phonelist/index.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		
		if ("form".equals(actionName)) {
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String tel = req.getParameter("tel");
			
			PhoneBookVO vo = new PhoneBookVO();
			vo.setName(name);
			vo.setHp(hp);
			vo.setTel(tel);
			
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			boolean success = dao.insert(vo);
			
			if (success) {
				resp.sendRedirect(req.getContextPath());
			} else {
				resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/phonelist/index.jsp");
			}
		} else if ("delete".equals(actionName)) {
			Long id = Long.valueOf(req.getParameter("id"));
			
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			dao.delete(id);
			resp.sendRedirect(req.getContextPath());
		} else if ("search".equals(actionName)) {
			String keyword = req.getParameter("keyword");
			
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.search(keyword);
			req.setAttribute("list", list);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/phonelist/index.jsp");
			rd.forward(req, resp);
		} else {
			doGet(req, resp);
		}
	}

}
