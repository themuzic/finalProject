package com.kh.develoffice.employee.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.dao.EmployeeDao;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;
import com.kh.develoffice.employee.model.vo.WorkTime;

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

	@Override
	public ArrayList<WorkTime> selectWorkList(int id) {
		return eDao.selectWorkList(id);
	}

	@Override
	public int insertStartTime(WorkTime work) {
		return eDao.insertStartTime(work);
	}

	@Override
	public int updateEndTime(WorkTime work) {
		return eDao.updateEndTime(work);
	}

	@Override
	public int updateWorkStatus(WorkTime work) {
		return eDao.updateWorkStatus(work);
	}

	@Override
	public Employee selectEmp(int empId) {
		return eDao.selectEmp(empId);
	}

	@Override
	public int updateWorkStatus2(WorkTime work) {
		return eDao.updateWorkStatus2(work);
	}

	@Override
	public int updateMypage(Employee e) {
		return eDao.updateMyPage(e);
	}

	@Override
	public int updatePwd(Employee e) {
		return eDao.updatePwd(e);
	}

	@Override
	public int updateStar(int empId) {
		return eDao.updateStar(empId);
	}

	@Override
	public int updateWidget(Widget w) {
		return eDao.updateWidget(w);
	}
	
	
	

}
