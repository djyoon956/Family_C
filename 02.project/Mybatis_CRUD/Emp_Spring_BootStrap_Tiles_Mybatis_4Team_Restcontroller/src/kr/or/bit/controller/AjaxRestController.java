package kr.or.bit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

/*
	RestController = Controller + ResponseBody 
 */

@RestController
public class AjaxRestController {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlsession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//ajax - deptno
	@RequestMapping(value="/AjaxGetDeptNos.do")
	public List<Integer> getDeptNo() {
		
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		List<Integer> deptnolist = dao.getDethNos();
		System.out.println(deptnolist);
		
		return deptnolist;
	}
	

	
	//ajax - idcheck
	@RequestMapping(value= "/ec.do", method = RequestMethod.POST)
	public String idCheck(int empno) {
		System.out.println("나오니" + empno);
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		Emp result = dao.getEmpByEmpno(empno);
		
		String responsedata = "";
		if(result != null) {
			responsedata = "false";
			
		}else {
			responsedata = "true";
		}
		return responsedata;
	}

	
	
	//ajax 
	@RequestMapping(value= "/ajax.do")
	public Map<String , Object> showDeptnos() {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		List<Integer> deptnolist = dao.getDethNos();
		System.out.println(deptnolist);
		
		List<String> joblist = dao.getJobRegister();
		System.out.println(joblist);
		
		List<Emp> emplist = dao.getEmps();		
 		System.out.println(dao.getEmps());
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("deptno", deptnolist);
		map.put("job", joblist);
		map.put("emp", emplist);


		return map;

	}
	
}
