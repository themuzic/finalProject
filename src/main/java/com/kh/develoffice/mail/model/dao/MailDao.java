package com.kh.develoffice.mail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mDao")
public class MailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
