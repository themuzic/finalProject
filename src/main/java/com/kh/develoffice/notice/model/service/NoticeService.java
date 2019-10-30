package com.kh.develoffice.notice.model.service;

import java.util.ArrayList;

import com.kh.develoffice.notice.model.vo.Notice;


public interface NoticeService {

	int getListCount();
		
	// 1. 게시판 리스트 조회
	ArrayList<Notice> selectList();
		
	// 2. 게시글 작성
	int insertNoticeBoard(Notice n);
		
	// 3. 게시글 상제 조회
	Notice boardNoticeDetail(int noId);
		
	// 4. 게시글 단지 조회
	Notice selectNoticeBoard(int noId);
		
	// 5. 게시글 삭제
	int deleteNoticeBoard(int noId);
	
	//6. 게시글 수정 
	int updateNoticeBoard(Notice n);
}
