package com.kh.develoffice.free.model.service;

import java.util.ArrayList;

import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.free.model.vo.FreeLike;
import com.kh.develoffice.free.model.vo.FreeReply;

public interface FreeService {
	
	int getListCount();
		
	// 1. 게시판 리스트 조회
	ArrayList<Free> selectList();
		
	// 2. 게시글 작성
	int insertFreeBoard(Free f);
		
	// 3. 게시글 상제 조회
	Free boardFreeDetail(int frId);
		
	// 4. 게시글 단지 조회
	Free selectFreeBoard(int frId);
		
	// 5. 게시글 삭제
	int deleteFreeBoard(int frId);
	
	//6. 게시글 수정 
	int updateFreeBoard(Free f);
	
	// 7. 게시글에 딸려있는 댓글 리스트 조회
	ArrayList<FreeReply> selectFreeReplyList(int frId);
		
	// 8. 댓글 작성하기 
	int insertFreeReply(FreeReply frr);
	
	// 9. 댓글 수정하기
	int freeRupdate(FreeReply frr);
	
	// 10. 댓글 삭제하기
	int freeRdelete(FreeReply frr);
	
	// 11. 좋아요 insert
	int insertLike(FreeLike like);
	
	// 12. 좋아요 수 select
	FreeLike selectLikeCount(int frId);
	
	// 13. 좋아요 delete
	int deleteLike(FreeLike like);
	
	// 14. 좋아요 했는지 안했는지 검사
	FreeLike checkLike(FreeLike like);
	
}
