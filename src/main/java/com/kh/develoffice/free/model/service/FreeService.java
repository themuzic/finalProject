package com.kh.develoffice.free.model.service;

import java.util.ArrayList;

import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.mail.model.vo.PageInfo;

public interface FreeService {
	
	int getListCount();
		
	// 1_2. 게시판 리스트 조회
	ArrayList<Free> selectList();
		
	// 2. 게시글 작성
	int insertBoard(Free f);
		
	// 3. 게시글 상제 조회
	Free boardDetail(int frId);
		
	// 4. 게시글 단지 조회
	Free selectBoard(int frId);
		
	// 5. 게시글 삭제
	int deleteBoard(int frId);
		
		
	/*
	// 7. 게시글에 딸려있는 댓글 리스트 조회
	ArrayList<Reply> selectReplyList(int bId);
		
		
	// 8. 댓글 작성하기 
	int insertReply(Reply r);
	 */
}
