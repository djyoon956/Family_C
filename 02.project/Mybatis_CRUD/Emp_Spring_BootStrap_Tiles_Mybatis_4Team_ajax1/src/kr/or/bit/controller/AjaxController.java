package kr.or.bit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

@Controller
public class AjaxController {

	// org.springframework.web.servlet.view.json.MappingJackson2JsonView
	@Autowired
	private View jsonview;

	private SqlSession sqlSession;

	@Autowired
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/GetSelectBoxData.do")
	public View getMemberAddData(ModelMap map) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		List<Integer> deptnos = dao.getDethNos();
		List<String> jobs = dao.getJobRegister();
		List<Emp> emps = dao.getEmps();

		map.addAttribute("deptnos", deptnos);
		map.addAttribute("jobs", jobs);
		map.addAttribute("emps", emps);

		return jsonview;
	}

	@RequestMapping("/GetDeptNos.do")
	public View getDeptnos(ModelMap map) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		List<Integer> deptnos = dao.getDethNos();
		
		map.addAttribute("deptnos", deptnos);
		
		return jsonview;
	}

	@RequestMapping("/CheckEmpno.do")
	public View checkEmpno(int empno, ModelMap map) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		Emp emp = dao.getEmpByEmpno(empno);
		map.addAttribute("isUse", emp != null);

		return jsonview;
	}
}
