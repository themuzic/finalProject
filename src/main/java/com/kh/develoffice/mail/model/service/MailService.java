package com.kh.develoffice.mail.model.service;

import java.util.ArrayList;

import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;

public interface MailService {
	
	int getListCount();
	
	ArrayList<Mail> receiveMailList(PageInfo pi);
	
	int insertMail(Mail m);
	

}
