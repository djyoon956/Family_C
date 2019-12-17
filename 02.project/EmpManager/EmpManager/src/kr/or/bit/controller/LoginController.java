package kr.or.bit.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.bit.dao.EmpDao;

@Controller
public class LoginController {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/Login.do")
	public String showView() {
		return "/WEB-INF/views/login/Login.jsp";
	}

	@RequestMapping("/LoginOk.do")
	public String loginOk(String userid, String pwd, HttpServletRequest request) {
		String view = null;

		try {
			EmpDao dao = sqlSession.getMapper(EmpDao.class);
			String adminId = dao.checkAdminLogin(userid, pwd);
			
			if (adminId != null && !adminId.isEmpty()) {
				request.getSession().setAttribute("userid", userid);
				view = "Index.do";
			} else
				view = "Login.do";

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return view;
	}

	@RequestMapping("/Logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "Index.do";
	}
}
