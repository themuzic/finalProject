package com.kh.develoffice.employee.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;
import com.kh.develoffice.employee.model.vo.WorkTime;

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
	
	
	public ArrayList<WorkTime> selectWorkList(int id){
		return (ArrayList)sqlSession.selectList("employeeMapper.selectWorkList", id);
	}
	
	
	public int insertStartTime(WorkTime work) {
		return sqlSession.insert("employeeMapper.insertStartTime", work);
	}
	
	
	public int updateEndTime(WorkTime work) {
		return sqlSession.update("employeeMapper.updateEndTime", work);
	}
	
	public int updateWorkStatus(WorkTime work) {
		return sqlSession.update("employeeMapper.updateWorkStatus", work);
	}
	
	public int updateWorkStatus2(WorkTime work) {
		return sqlSession.update("employeeMapper.updateWorkStatus2", work);
	}
	
	public Employee selectEmp(int empId) {
		return sqlSession.selectOne("employeeMapper.selectEmp", empId);
	}


	public int updateMyPage(Employee e) {
		return sqlSession.update("employeeMapper.updateMyPage", e);
	}


	public int updatePwd(Employee e) {
		return sqlSession.update("employeeMapper.updatePwd", e);
	}


	public int updateStar(int empId) {
		System.out.println(empId);
		return sqlSession.update("employeeMapper.updateStar", empId);
	}


	public int updateWidget(Widget w) {
		return sqlSession.update("employeeMapper.updateWidget", w);
	}


	public int updateRetireDate(Employee emp) {
		return sqlSession.update("employeeMapper.updateRetireDate", emp);
	}

	public int insertWidget(Widget w) {
		return sqlSession.insert("employeeMapper.insertWidget", w);
	}


	public int minusStar(Employee emp) {
		return sqlSession.update("employeeMapper.minusStar", emp);
	}
}
