package com.kh.develoffice.insa.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.common.Job;
import com.kh.develoffice.employee.model.vo.Employee;

@Repository("iDao")
public class InsaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Job> selectJob() {
		return (ArrayList)sqlSession.selectList("insaMapper.selectJob");
	}

	public int insaUpdate(Employee e) {
		return sqlSession.update("insaMapper.insaUpdate",e);
	}
}
