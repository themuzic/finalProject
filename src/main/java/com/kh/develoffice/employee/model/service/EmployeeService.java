package com.kh.develoffice.employee.model.service;

import java.util.ArrayList;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;

public interface EmployeeService {
	
	// 로그인 서비스
	Employee loginEmp(Employee emp);
	
	// 위젯 정보 저장 서비스
	int saveWidget(Widget w);
	
	// 해당 계정의 모든 위젯 정보 호출
	ArrayList<Widget> selectWidget(int id);

}
