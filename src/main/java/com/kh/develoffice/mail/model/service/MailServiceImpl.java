package com.kh.develoffice.mail.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.develoffice.mail.model.dao.MailDao;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.mail.model.vo.SearchCondition;

@Service("mService")
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDao mDao;

	@Override
	public int getListCount() {

		return mDao.getlistCount();
	}

	@Override
	public ArrayList<Mail> receiveMailList(PageInfo pi) {
		
		return mDao.receiveMailList(pi);
	}
	
	@Override
	public int insertMail(Mail m) {
		
		return mDao.insertMail(m);
	}

	@Override
	public Mail receiveDetail(int mailNum) {
		
		return mDao.receiveDetail(mailNum);
	}

	@Override
	public int getSearchListCount(SearchCondition sc) {
		
		return mDao.getSearchListCount(sc);
	}

	@Override
	public ArrayList<Mail> selectSearchList(SearchCondition sc, PageInfo pi) {
		
		return mDao.selectSearchList(sc, pi);
	}

	@Override
	public Mail selectMail(int mailNum) {
		
		return mDao.receiveDetail(mailNum);
	}

	@Override
	public int deleteMail(int mailNum) {
		
		return mDao.deleteMail(mailNum);
	}

	@Override
	public int transferMail(int mailNum) {
		
		return mDao.transferMail(mailNum);
	}

}
