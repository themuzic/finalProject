package com.kh.develoffice.free.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.free.model.vo.FreeLike;
import com.kh.develoffice.free.model.vo.FreeReply;

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

	public Free boardFreeDetail(int frId) {

		return sqlSession.selectOne("freeMapper.selectFreeBoard", frId);
	}

	public int insertFreeBoard(Free f) {
		
		return sqlSession.insert("freeMapper.insertFreeBoard", f);
	}

	public int deleteFreeBoard(int frId) {
		return sqlSession.update("freeMapper.deleteFreeBoard", frId);
	}

	public int updateFreeBoard(Free f) {
		return sqlSession.update("freeMapper.updateFreeBoard", f);
	}

	public ArrayList<FreeReply> selectFreeReplyList(int frId) {
		return (ArrayList)sqlSession.selectList("freeMapper.selectFreeReplyList", frId);
	}

	public int insertFreeReply(FreeReply frr) {
		return sqlSession.insert("freeMapper.insertFreeReply", frr);
	}

	public int freeRupdate(FreeReply frr) {
		return sqlSession.update("freeMapper.freeRupdate", frr);
	}

	public int freeRdelete(FreeReply frr) {
		return sqlSession.update("freeMapper.freeRdelete", frr);
	}

	public int insertLike(FreeLike like) {
		return sqlSession.insert("freeMapper.insertLike", like);
	}

	public FreeLike selectLikeCount(int frId) {
		return sqlSession.selectOne("freeMapper.selectLikeCount", frId);
	}
	
	public int deleteLike(FreeLike like) {
		return sqlSession.delete("freeMapper.deleteLike", like);
	}

	public FreeLike checkLike(FreeLike like) {
		return sqlSession.selectOne("freeMapper.checkLike", like);
	}

}
