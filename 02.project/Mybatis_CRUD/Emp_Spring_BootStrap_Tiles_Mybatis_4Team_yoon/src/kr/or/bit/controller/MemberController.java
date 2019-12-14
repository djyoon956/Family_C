package kr.or.bit.controller;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

@Controller
public class MemberController {
	private SqlSession sqlSession;

	@Autowired
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "/MemberAdd.do", method = RequestMethod.GET)
	public String showMemberAddView(Model model) {
		// select box 데이터
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		model.addAttribute("deptnos", dao.getDethNos());
		model.addAttribute("jobs", dao.getJobRegister());
		List<Emp> emps = dao.getEmps();
		model.addAttribute("emps", dao.getEmps());

		return "/WEB-INF/views/admin/MemberAdd.jsp";
	}

	@RequestMapping(value = "/MemberAdd.do", method = RequestMethod.POST)
	public String memberAddOk(Emp emp, HttpServletRequest request, Model model) {
		try {
			String uploadpath = request.getServletContext().getRealPath("upload");
			String imagefilename = emp.getMultipartFile().getOriginalFilename();
			String fpath = uploadpath + "\\" + imagefilename;

			if (!imagefilename.isEmpty()) { // 실 파일 업로드
				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write(emp.getMultipartFile().getBytes());
				fs.close();
			}

			emp.setImagefilename(imagefilename);

			EmpDao dao = sqlSession.getMapper(EmpDao.class);
			emp.setImagefilename(imagefilename);
			System.out.println("emp date " + emp.getHiredate());
			int result = dao.insertEmp(emp);

			String msg = "";
			String url = "";
			if (result > 0) {
				msg = "등록 성공! 상세 페이지로 이동합니다.";
				url = "MemberDetail.do?empno=" + emp.getEmpno();
			} else {
				msg = "등록 실패! 관리 페이지로 이동합니다.";
				url = "MemberList.do";
			}

			model.addAttribute("board_msg", msg);
			model.addAttribute("board_url", url);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "/common/redirect.jsp";
	}

	@RequestMapping("/MemberList.do")
	public String showMembers(Model model) {
		try {
			EmpDao dao = sqlSession.getMapper(EmpDao.class);

			List<Emp> emps = dao.getEmps();
			model.addAttribute("emps", emps);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/WEB-INF/views/admin/MemberList.jsp";
	}

	@RequestMapping("/MemberDetail.do")
	public String showDetail(int empno, Model model) {
		try {
			EmpDao dao = sqlSession.getMapper(EmpDao.class);

			Emp emp = dao.getEmpByEmpno(empno);
			model.addAttribute("empdetail", emp);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "/WEB-INF/views/admin/MemberDetail.jsp";
	}

	@RequestMapping("/MemberEdit.do")
	public String showEditView(int empno, Model model) {

		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		try {

			Emp emp = dao.getEmpByEmpno(empno);
			model.addAttribute("emp", emp);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// select box 데이터
		model.addAttribute("deptnos", dao.getDethNos());
		model.addAttribute("jobs", dao.getJobRegister());
		List<Emp> emps = dao.getEmps();
		model.addAttribute("emps", dao.getEmps());
		return "/WEB-INF/views/admin/MemberEdit.jsp";
	}

	@RequestMapping("MemberEditOk.do")
	public String editOk(Emp emp, HttpServletRequest request) {
		System.out.println("in edit ok");
		try {
			EmpDao dao = sqlSession.getMapper(EmpDao.class);
			String uploadpath = request.getServletContext().getRealPath("upload");
			String imagefilename = emp.getMultipartFile().getOriginalFilename();
			String fpath = uploadpath + "\\" + imagefilename;

			if (!imagefilename.equals("")) { // 실 파일 업로드
				FileOutputStream fs = new FileOutputStream(fpath);
				fs.write(emp.getMultipartFile().getBytes());
				fs.close();
			}

			emp.setImagefilename(imagefilename);
			dao.updateEmp(emp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/MemberList.do";
	}

	@RequestMapping("/MemberDelete.do")
	public String delete(int empno, Model model) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		int row = dao.deleteEmpByEmpno(empno);

		String url = "";
		String msg = "";
		if (row > 0) {
			url = "MemberList.do";
			msg = empno + "님이 삭제되었습니다";
		}

		model.addAttribute("board_msg", msg);
		model.addAttribute("board_url", url);

		return "/common/redirect.jsp";
	}
}
