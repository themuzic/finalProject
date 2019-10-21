package com.kh.develoffice.employee.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.dao.EmployeeDao;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;

@Service("eService")
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDao eDao;

	@Override
	public Employee loginEmp(Employee emp) {
		
		Employee loginUser = eDao.loginEmp(emp);
		
		return loginUser;
	}

	@Override
	public int saveWidget(Widget w) {
		
		return eDao.saveWidget(w);
	}

	@Override
	public ArrayList<Widget> selectWidget(int id) {
		return eDao.selectWidget(id);
	}

	@Override
	public ArrayList<Employee> selectAllEmp() {
		return eDao.selectAllEmp();
	}

	@Override
	public ArrayList<Employee> autocomplete(String key) {
		return eDao.autocomplete(key);
	}
	
	
	
	

}
