package com.kh.develoffice.teamboard.model.service;

import java.util.ArrayList;

import com.kh.develoffice.free.model.vo.FreeLike;
import com.kh.develoffice.free.model.vo.FreeReply;
import com.kh.develoffice.teamboard.model.vo.TeamBoard;
import com.kh.develoffice.teamboard.model.vo.TeamBoardReply;

public interface TeamBoardService {

	int getListCount();
	
	ArrayList<TeamBoard> selectList(int deptCode);
	
	int insertTeamBoard(TeamBoard tb);
	
	TeamBoard teamBoardDetail(int tbId);
	
	TeamBoard selectTeamBoard(int tbId);
	
	int deleteTeamBoard(int tbId);
	
	int updateTeamBoard(TeamBoard tb);
	
	ArrayList<TeamBoardReply> selectTeamBoardReplyList(int tbId);
	
	int insertTeamBoardReply(TeamBoardReply tbr);
	
	int teamBoardRupdate(TeamBoardReply tbr);
		
	int teamBoardRdelete(TeamBoardReply tbr);
		
	
}
