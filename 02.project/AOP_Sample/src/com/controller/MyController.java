package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.TestDao;

@Controller
public class MyController {

	private TestDao dao;
	
	@Autowired
	public void setDao(TestDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/insert.do")
	public String insert()  {
		dao.insertSomething();
		return "index.jsp";
	}
	
	
	@RequestMapping("/exception.do")
	public String exception() throws Exception  {
		dao.exceptionSomething();
		return "index.jsp";
	}
}
