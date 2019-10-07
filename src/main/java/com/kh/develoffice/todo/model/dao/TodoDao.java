package com.kh.develoffice.todo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("tDao")
public class TodoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
