package com.kh.develoffice.document.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.common.Department;

@Repository("dDao")
public class DocumentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Department> selectDept(){
		
		return (ArrayList)sqlSession.selectList("documentMapper.selectDept");
	}
	

}
