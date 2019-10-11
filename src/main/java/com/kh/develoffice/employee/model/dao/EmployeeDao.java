package com.kh.develoffice.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.employee.model.vo.Employee;

@Repository("eDao")
public class EmployeeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Employee loginEmp(Employee emp) {
		
		return sqlSession.selectOne("employeeMapper.loginEmp", emp);
	}
	
	
	
	

}
