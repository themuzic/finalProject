package com.kh.develoffice.employee.model.service;

import java.util.ArrayList;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;
import com.kh.develoffice.employee.model.vo.WorkTime;

public interface EmployeeService {
	
	// 로그인 서비스
	Employee loginEmp(Employee emp);
	
	// 위젯 정보 저장 서비스
	int saveWidget(Widget w);
	
	// 해당 계정의 모든 위젯 정보 호출
	ArrayList<Widget> selectWidget(int id);
	
	// 모든 직원 목록 호출
	ArrayList<Employee> selectAllEmp();
	
	// 자동완성 결과 호출
	ArrayList<Employee> autocomplete(String key);

	// 나의 근태 정보 호출
	ArrayList<WorkTime> selectWorkList(int id);
	
	// 출근 시간 저장
	int insertStartTime(WorkTime work); 
	
	// 퇴근 시간 저장
	int updateEndTime(WorkTime work); 
	
	// 출근 상태 변경(N -> Y)
	int updateWorkStatus(WorkTime work);
	
	// 출근 상태 변경(Y -> N)
	int updateWorkStatus2(WorkTime work);
	
	// 직원 한명 호출
	Employee selectEmp(int empId);
	
	// 프로필 수정
	int updateMypage(Employee e);

	// 비밀번호 수정
	int updatePwd(Employee e);
	
	// 별 1개+
	int updateStar(int empId);
	
	// 위젯 ON/OFF설정 업데이트
	int updateWidget(Widget w);

	// 사직서 결제되면 퇴사예정일 업데이트
	int updateRetireDate(Employee emp);

	// 위젯 insert
	int insertWidget(Widget w);
	
}
