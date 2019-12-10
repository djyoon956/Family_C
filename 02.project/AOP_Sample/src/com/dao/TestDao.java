package com.dao;

import org.springframework.stereotype.Service;

@Service
public class TestDao {

	public void insertSomething() {
		System.out.println("Start insert something");
		System.out.println("End insert something");
	}
	
	public void exceptionSomething() throws Exception {
		System.out.println("Start insert something");
		throw new Exception("ERROR 발생");
	}
}
