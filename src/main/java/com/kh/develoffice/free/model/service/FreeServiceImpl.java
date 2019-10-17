package com.kh.develoffice.free.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.free.model.dao.FreeDao;
import com.kh.develoffice.free.model.vo.Free;
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
	public int insertBoard(Free f) {
		return fDao.insertBoard(f);
	}

	@Override
	public Free boardDetail(int frId) {
		
		int result = fDao.updateCount(frId);
			if(result>0) {
				return fDao.boardDetail(frId);
			}else {
				return null;
			}
		
	}

	@Override
	public Free selectBoard(int frId) {
		return fDao.boardDetail(frId);
	}

	@Override
	public int deleteBoard(int frId) {
		return 0;
	}
	
}
