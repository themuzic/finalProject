package com.kh.develoffice.mail.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.develoffice.mail.model.dao.MailDao;

@Service("mService")
public class MailServiceImpl implements MailService{
	
	@Autowired
	private MailDao mDao;

}
