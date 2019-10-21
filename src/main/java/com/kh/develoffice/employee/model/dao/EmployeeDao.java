package com.kh.develoffice.employee.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;

@Repository("eDao")
public class EmployeeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Employee loginEmp(Employee emp) {
		
		return sqlSession.selectOne("employeeMapper.loginEmp", emp);
	}
	
	
	public int saveWidget(Widget w) {
		return sqlSession.update("employeeMapper.saveWidget",w);
	}
	
	
	public ArrayList<Widget> selectWidget(int id){
		return (ArrayList)sqlSession.selectList("employeeMapper.selectWidget", id);
	}
	
	
	public ArrayList<Employee> selectAllEmp(){
		return (ArrayList)sqlSession.selectList("employeeMapper.selectAllEmp");
	}
	
	
	public ArrayList<Employee> autocomplete(String key){
		return (ArrayList)sqlSession.selectList("employeeMapper.autocomplete",key);
	}

}
