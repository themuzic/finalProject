package com.kh.develoffice.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@RequestMapping("sendMail.do")
	public String documentTableList() {
		return "mail/sendMail";
	}
	
	
	
	
	
	

}
