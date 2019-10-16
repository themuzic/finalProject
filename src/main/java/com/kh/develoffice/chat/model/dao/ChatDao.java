package com.kh.develoffice.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cDao")
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
