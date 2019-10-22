package com.kh.develoffice.mail.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.employee.model.vo.Employee;
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
	public ArrayList<Mail> receiveMailList(PageInfo pi, Employee e) {
		
		return mDao.receiveMailList(pi, e);
	}
	
	@Override
	public ArrayList<Mail> sendMailList(PageInfo pi, Employee e) {
		
		return mDao.sendMailList(pi, e);
	}

	@Override
	public ArrayList<Mail> deleteMailList(PageInfo pi) {
		
		return mDao.deleteMailList(pi);
	}
	
	@Override
	public int insertMail(Mail m) {
		
		int result = mDao.insertMail(m);
		
		return result;
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
	public int updateMail(int mailNum) {
		
		return mDao.updateMail(mailNum);
	}

	@Override
	public int deleteMail(int mailNum) {
		
		return mDao.deleteMail(mailNum);
	}
	
	@Override
	public int selectEmpId(String toEmail) {
		return mDao.selectEmpId(toEmail);
		
	}

	@Override
	public int insertStatusMail(int empId) {
		return mDao.insertStatusMail(empId);
	}


}
