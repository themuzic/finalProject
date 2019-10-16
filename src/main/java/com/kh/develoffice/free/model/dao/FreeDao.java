package com.kh.develoffice.free.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fDao")
public class FreeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
