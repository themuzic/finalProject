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
	
	@RequestMapping("receiveMail.do")
	public String receiveMailList() {
		return "mail/receiveMail";
	}
	
	@RequestMapping("sendMail.do")
	public String sendMailList() {
		return "mail/sendMail";
	}
	
	@RequestMapping("deleteMail.do")
	public String deleteMailList() {
		return "mail/deleteMail";
	}
	
	@RequestMapping("insertMail.do")
	public String insertMailForm() {
		return "mail/insertMail";
	}
	
	@RequestMapping("receiveDetail.do")
	public String receiveDetail() {
		return "mail/receiveDetail";
	}
	
	

}
