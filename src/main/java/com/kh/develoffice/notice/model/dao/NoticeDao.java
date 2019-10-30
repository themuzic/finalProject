package com.kh.develoffice.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.notice.model.vo.Notice;

@Repository("nDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList() {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}

	public int updateCount(int noId) {
		return sqlSession.update("noticeMapper.updateCount",noId);
	}
	
	public int insertNoticeBoard(Notice n) {
		return sqlSession.insert("noticeMapper.insertNoticeBoard",n);
	}

	public Notice boardNoticeDetail(int noId) {
		return sqlSession.selectOne("noticeMapper.selectNoticeBoard",noId);
	}

	public int deleteNoticeBoard(int noId) {
		return sqlSession.update("noticeMapper.deleteNoticeBoard",noId);
	}

	public int updateNoticeBoard(Notice n) {
		return sqlSession.update("noticeMapper.updateNoticeBoard",n);
	}

	
	
}
