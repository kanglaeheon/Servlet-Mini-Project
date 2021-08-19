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
		//	파라미터 확인
		//	a=form이면 새 주소 추가 화면으로 FORWARD
		String actionName = req.getParameter("a");
		
		if ("form".equals(actionName)) {
			//	a=form이면
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/phonelist/form.jsp");
			//	전달
			rd.forward(req, resp);
		} else {
			//	DAO에서 목록을 받아서 jsp에 전달
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.getList();
			// 요청에 list를 추가
			// list 객체를 list 키로 추가
			req.setAttribute("list", list);
			// JSP로 요청을 전달(FORWARD)

			// Dispatcher 확보
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/phonelist/index.jsp");
			// FORWARD
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
			
			//	VO 객체 생성
			PhoneBookVO vo = new PhoneBookVO();
			vo.setName(name);
			vo.setHp(hp);
			vo.setTel(tel);
			
			//	INSERT 처리
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			boolean success = dao.insert(vo);
			
			//	체크
			if (success) {
				// 성공
				// 처리 후 list페이지로 리다이렉트
				resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/phonelist/index.jsp");
			} else {
				//	실패
				//	폼으로 리다이렉트
				resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/phonelist/form.jsp");
			}
		} else if ("delete".equals(actionName)) {
			//	a=delete면
			Long id = Long.valueOf(req.getParameter("id"));
			
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			dao.delete(id);
			
			//	리스트 페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/WEB-INF/views/phonelist/index.jsp");
		} else if ("search".equals(actionName)) {
			String keyword = req.getParameter("keyword");
			
			PhoneBookDAO dao = new PhoneBookDAOImpl();
			List<PhoneBookVO> list = dao.search(keyword);
			req.setAttribute("list", list);
		} else {
			doGet(req, resp);
		}
	}

}
