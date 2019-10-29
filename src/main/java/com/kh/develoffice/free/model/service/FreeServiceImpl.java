package com.kh.develoffice.free.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.free.model.dao.FreeDao;
import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.free.model.vo.FreeLike;
import com.kh.develoffice.free.model.vo.FreeReply;
import com.kh.develoffice.mail.model.vo.PageInfo;

@Service("fService")
public class FreeServiceImpl implements FreeService{

	@Autowired
	private FreeDao fDao;

	@Override
	public int getListCount() {
		return fDao.getListCount();
	}

	@Override
	public ArrayList<Free> selectList() {
		return fDao.selectList();
	}

	@Override
	public int insertFreeBoard(Free f) {
		return fDao.insertFreeBoard(f);
	}

	@Override
	public Free boardFreeDetail(int frId) {
		
		int result = fDao.updateCount(frId);
			if(result>0) {
				return fDao.boardFreeDetail(frId);
			}else {
				return null;
			}
		
	}

	@Override
	public Free selectFreeBoard(int frId) {
		return fDao.boardFreeDetail(frId);
	}

	@Override
	public int deleteFreeBoard(int frId) {
		return fDao.deleteFreeBoard(frId);
	}

	@Override
	public int updateFreeBoard(Free f) {
		return fDao.updateFreeBoard(f);
	}

	@Override
	public ArrayList<FreeReply> selectFreeReplyList(int frId) {
		return fDao.selectFreeReplyList(frId);
	}

	@Override
	public int insertFreeReply(FreeReply frr) {
		return fDao.insertFreeReply(frr);
	}

	@Override
	public int freeRupdate(FreeReply frr) {
		return fDao.freeRupdate(frr);
	}

	@Override
	public int freeRdelete(FreeReply frr) {
		return fDao.freeRdelete(frr);
	}

	@Override
	public int insertLike(FreeLike like) {
		return fDao.insertLike(like);
	}

	@Override
	public FreeLike selectLikeCount(int frId) {
		return fDao.selectLikeCount(frId);
	}

	@Override
	public int deleteLike(FreeLike like) {
		return fDao.deleteLike(like);
	}

	@Override
	public FreeLike checkLike(FreeLike like) {
		return fDao.checkLike(like);
	}

	

	
	
}
