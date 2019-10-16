package com.kh.develoffice.mail.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.mail.model.service.MailService;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	// mailSending 코드
	@RequestMapping("mailSending.do")
	public String mailSending(HttpServletRequest request) {
   
    String setfrom = "sangyoon2ya@gmail.com";         
    String tomail = request.getParameter("mailTo");    // 받는 사람 이메일
	String title = request.getParameter("mailTitle");      // 보내는 사람 이메일
	String content = request.getParameter("mailContent");  // 보내는 사람 이메일
	String filename = "D:/test.txt";                   // 파일 경로.
	   
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);   // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);      // 받는사람 이메일
      messageHelper.setSubject(title);  // 메일제목은 생략이 가능하다
      messageHelper.setText(content);   // 메일 내용
 
		  // 파일첨부
	  FileSystemResource fsr = new FileSystemResource(filename);
	  messageHelper.addAttachment("test2.txt", fsr);
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:receiveMail.do";
	  } 



}
