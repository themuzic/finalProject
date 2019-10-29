package com.kh.develoffice.teamboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.teamboard.model.vo.TeamBoard;
import com.kh.develoffice.teamboard.model.vo.TeamBoardReply;

@Repository("tbDao")
public class TeamBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return  sqlSession.selectOne("TeamBoardMapper.getListCount");
	}

	public ArrayList<TeamBoard> selectList() {
		return (ArrayList)sqlSession.selectList("TeamBoardMapper.selectList");
	}

	public int insertTeamBoard(TeamBoard tb) {
		return sqlSession.insert("TeamBoardMapper.insertTeamBoard", tb);
	}

	public int updateCount(int tbId) {
		return sqlSession.update("TeamBoardMapper.updateCount", tbId);
	}

	public TeamBoard teamBoardDetail(int tbId) {
		return sqlSession.selectOne("TeamBoardMapper.selectTeamBoard", tbId);
	}

	public int deleteTeamBoard(int tbId) {
		return sqlSession.update("TeamBoardMapper.deleteTeamBoard", tbId);
	}

	public int updateTeamBoard(TeamBoard tb) {
		return sqlSession.update("TeamBoardMapper.updateTeamBoard", tb);
	}

	public ArrayList<TeamBoardReply> selectTeamBoardReplyList(int tbId) {
		return (ArrayList)sqlSession.selectList("TeamBoardMapper.selectTeamBoardReplyList", tbId);
	}

	public int insertTeamBoardReply(TeamBoardReply tbr) {
		return sqlSession.insert("TeamBoardMapper.insertTeamBoardReply", tbr);
	}

	public int teamBoardRupdate(TeamBoardReply tbr) {
		return sqlSession.update("TeamBoardMapper.teamBoardRupdate", tbr);
	}

	public int teamBoardRdelete(TeamBoardReply tbr) {
		return sqlSession.update("TeamBoardMapper.teamBoardRdelete", tbr);
	}


	
}
