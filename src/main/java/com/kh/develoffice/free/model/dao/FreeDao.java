package com.kh.develoffice.free.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.free.model.vo.Free;

@Repository("fDao")
public class FreeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		
		return sqlSession.selectOne("freeMapper.getListCount");
	}

	public ArrayList<Free> selectList() {
		
		return (ArrayList)sqlSession.selectList("freeMapper.selectList");
	}
	
	public int updateCount(int frId) {

		return sqlSession.update("freeMapper.updateCount", frId);
	}

	public Free boardDetail(int frId) {

		return sqlSession.selectOne("freeMapper.selectBoard", frId);
	}

	public int insertBoard(Free f) {
		return sqlSession.insert("freeMapper.insertBoard", f);
	}

	
	
	

}
