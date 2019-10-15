package com.kh.develoffice.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sDao")
public class ScheduleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
