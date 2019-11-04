package com.kh.develoffice.insa.model.service;

import java.util.ArrayList;

import com.kh.develoffice.common.Job;
import com.kh.develoffice.employee.model.vo.Employee;

public interface InsaService {

	// 직급 소환!!!
	ArrayList<Job> selectJob();

	// 인사 이동
	int insaUpdate(Employee e);

	int insaInsert(Employee e);

	int currvalEmpId();

	// 퇴사 예정 직원들
	ArrayList<Employee> selectRetireList();

	// 퇴사 확정!! 땅땅
	int deleteEmployee(int empId);

}
