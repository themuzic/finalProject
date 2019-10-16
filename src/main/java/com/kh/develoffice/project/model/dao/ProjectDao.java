package com.kh.develoffice.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pDao")
public class ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
