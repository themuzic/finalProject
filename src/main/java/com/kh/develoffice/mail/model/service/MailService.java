package com.kh.develoffice.mail.model.service;

import java.util.ArrayList;

import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.mail.model.vo.SearchCondition;

public interface MailService {
	
	int getListCount();
	
	ArrayList<Mail> receiveMailList(PageInfo pi);
	
	int insertMail(Mail m);
	
	Mail receiveDetail(int mailNum);
	
	int getSearchListCount(SearchCondition sc);
	
	ArrayList<Mail> selectSearchList(SearchCondition sc, PageInfo pi);
	
	// 단순히 메일만 조회
	Mail selectMail(int mailNum);
	
	// 메일 완전히 삭제
	int deleteMail(int mailNum);
	

}
