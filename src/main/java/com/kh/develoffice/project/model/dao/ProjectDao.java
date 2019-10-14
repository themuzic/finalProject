package com.kh.develoffice.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class ProjectDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
