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

}
