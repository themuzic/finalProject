package com.kh.develoffice.teamboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.teamboard.model.dao.TeamBoardDao;
import com.kh.develoffice.teamboard.model.vo.TeamBoard;
import com.kh.develoffice.teamboard.model.vo.TeamBoardReply;

@Service("tbService")
public class TeamBoardServiceImpl implements TeamBoardService{
	
	@Autowired
	private TeamBoardDao tbDao;
	
	@Override
	public int getListCount() {
		return tbDao.getListCount();
	}

	@Override
	public ArrayList<TeamBoard> selectList(int deptCode) {
		return tbDao.selectList(deptCode);
	}

	@Override
	public int insertTeamBoard(TeamBoard tb) {
		return tbDao.insertTeamBoard(tb);
	}

	@Override
	public TeamBoard teamBoardDetail(int tbId) {
	
		int result =tbDao.updateCount(tbId);
		
		if(result>0) {
			return tbDao.teamBoardDetail(tbId);
		}else {
			return null;
		}
		
	}

	@Override
	public TeamBoard selectTeamBoard(int tbId) {
		return tbDao.teamBoardDetail(tbId);
	}

	@Override
	public int deleteTeamBoard(int tbId) {
		return tbDao.deleteTeamBoard(tbId);
	}

	@Override
	public int updateTeamBoard(TeamBoard tb) {
		return tbDao.updateTeamBoard(tb);
	}

	@Override
	public ArrayList<TeamBoardReply> selectTeamBoardReplyList(int tbId) {
		return tbDao.selectTeamBoardReplyList(tbId);
	}

	@Override
	public int insertTeamBoardReply(TeamBoardReply tbr) {
		return tbDao.insertTeamBoardReply(tbr);
	}

	@Override
	public int teamBoardRupdate(TeamBoardReply tbr) {
		return tbDao.teamBoardRupdate(tbr);
	}

	@Override
	public int teamBoardRdelete(TeamBoardReply tbr) {
		return tbDao.teamBoardRdelete(tbr);
	}

}
