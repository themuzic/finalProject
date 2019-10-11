package com.kh.develoffice.employee.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.dao.EmployeeDao;
import com.kh.develoffice.employee.model.vo.Employee;

@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDao eDao;

	@Override
	public Employee loginEmp(Employee emp) {
		
		Employee loginUser = eDao.loginEmp(emp);
		
		return loginUser;
	}
	
	
	
	

}
