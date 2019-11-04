package com.kh.develoffice.insa.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.common.Job;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.insa.model.dao.InsaDao;

@Service("iService")
public class InsaServiceImpl implements InsaService {
	
	@Autowired
	private InsaDao iDao;

	@Override
	public ArrayList<Job> selectJob() {
		return iDao.selectJob();
	}

	@Override
	public int insaUpdate(Employee e) {
		return iDao.insaUpdate(e);
	}

	@Override
	public int insaInsert(Employee e) {
		return iDao.insaInsert(e);
	}

	@Override
	public int currvalEmpId() {
		return iDao.currvalEmpId();
	}

	@Override
	public ArrayList<Employee> selectRetireList() {
		return iDao.selectRetireList();
	}

	@Override
	public int deleteEmployee(int empId) {
		return iDao.deleteEmployee(empId);
	}

}
