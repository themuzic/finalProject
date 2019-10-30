package com.kh.develoffice.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.notice.model.dao.NoticeDao;
import com.kh.develoffice.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao nDao;

	@Override
	public int getListCount() {
		return nDao.getListCount();
	}

	@Override
	public ArrayList<Notice> selectList() {
		return nDao.selectList();
	}

	@Override
	public int insertNoticeBoard(Notice n) {
		return nDao.insertNoticeBoard(n);
	}

	@Override
	public Notice boardNoticeDetail(int noId) {
		
		int result = nDao.updateCount(noId);
		
		if(result>0) {
			return nDao.boardNoticeDetail(noId);
		}else {
			return null;
		}
		
	}

	@Override
	public Notice selectNoticeBoard(int noId) {
		return nDao.boardNoticeDetail(noId);
	}

	@Override
	public int deleteNoticeBoard(int noId) {
		return nDao.deleteNoticeBoard(noId);
	}

	@Override
	public int updateNoticeBoard(Notice n) {
		return nDao.updateNoticeBoard(n);
	}
}
