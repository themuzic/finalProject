package com.kh.develoffice.document.model.service;

import java.util.ArrayList;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.employee.model.vo.Employee;

public interface DocumentService {
	
	// 부서테이블 호출
	ArrayList<Department> selectDept();
	


}
