package com.kh.develoffice.mail.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.Message;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Pagination;
import com.kh.develoffice.mail.model.service.MailService;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.mail.model.vo.SearchCondition;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("receiveMail.do")
	public ModelAndView receiveMailList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		// 게시글 총 개수
		int listCount = mService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.receiveMailList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/receiveMail");
		
		return mv;
	}
	
	@RequestMapping("sendMail.do")
	public ModelAndView sendMailList(ModelAndView mv, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		// 게시글 총 개수
		int listCount = mService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.sendMailList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/sendMail");
		
		return mv;
	}
	
	@RequestMapping("deleteMail.do")
	public String deleteMailList() {
		return "mail/deleteMail";
	}
	
	@RequestMapping("insertMail.do")
	public String insertMailForm() {
		return "mail/insertMail";
	}
	
	// 메일 답장
	@RequestMapping("replyMail.do")
	public ModelAndView replyMail(ModelAndView mv, Mail m) {
		
		mv.addObject("m", m).setViewName("mail/insertMail");
		
		return mv;
	}
	
	// 메일 전체 답장
	@RequestMapping("allReplyMail.do")
	public ModelAndView allReplyMail(ModelAndView mv, Mail m) {
		
		mv.addObject("m", m).setViewName("mail/insertMail");
		
		return mv;
	}
	
	// 메일 보내기 
	@RequestMapping("mailSending.do")
	public String mailSending(Mail m, HttpServletRequest request, Model model, HttpSession session,
								@RequestParam(name="uploadFile", required=false) MultipartFile uploadFile) {
		
		System.out.println("넘어온 메일 객체 : "+m);
		System.out.println("넘어온 파일 정보 : "+uploadFile);

    	if(uploadFile!=null && !uploadFile.getOriginalFilename().equals("")) {	// 첨부파일이 넘어온 경우
		
    	System.out.println("파일유무 조건문 통과");
		
		String filename = saveFile(uploadFile, request);
		
		System.out.println("바뀐 파일명 : "+filename);
		   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(m.getMailFrom());  			// 보내는사람 생략하거나 하면 정상작동을 안함
	      message.setRecipients(Message.RecipientType.TO, m.getMailTo()); 	// 받는사람
	      message.setRecipients(Message.RecipientType.CC, m.getMailCc()); 	// 참조    
	      messageHelper.setSubject(m.getMailTitle());   	// 메일제목은 생략이 가능하다
	      messageHelper.setText(m.getMailContent());   		// 메일 내용
	      
	      String root = request.getSession().getServletContext().getRealPath("resources");
		  String savePath = root + "\\mupload";
		  
		  System.out.println(savePath + "\\" + filename);
	 
	      // 파일첨부
		  FileSystemResource fsr = new FileSystemResource(savePath + "\\" + filename); // 파일 경로
		  messageHelper.addAttachment(uploadFile.getOriginalFilename(), fsr);
		     
		      mailSender.send(message);
		  	} catch(Exception e){
		      System.out.println(e);
		  	}

		if(filename != null) {	// 파일이 잘 저장된 경우
			m.setOriginalFileName(uploadFile.getOriginalFilename());
			m.setRenameFileName(filename);
			}
		}  	
    	
		// mail 테이블에 insert
		int result = mService.insertMail(m);
		
		if(result > 0) {
			return "mail/successMail";
		}else {
			model.addAttribute("msg", "메일전송 실패!");
			return "common/errorPage";
		}		
	}
	 
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\mupload";
		
		File folder = new File(savePath);	// 저장될 폴더
		
		if(!folder.exists()) {	// 폴더가 없다면
			folder.mkdirs();	// 폴더를 생성해라
		}
		
		String originalFileName = file.getOriginalFilename();	// 원본명(확장자)
		
		// 파일명 수정작업 --> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) // 년월일시분초
							  + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 실제 저장될 경로 savePath + 저장하고자하는 파일명 renameFileName
		String renamePath = savePath + "\\" + renameFileName;	
		
		try {
			file.transferTo(new File(renamePath));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;	// 수정명 반환
	}	
	
	@RequestMapping("search.do")
	public ModelAndView receiveMailList(ModelAndView mv, HttpServletRequest request,
					@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		String condition = request.getParameter("condition"); // writer, title, content
		String search = request.getParameter("search");
		
		SearchCondition sc = new SearchCondition();
		
		if(condition.equals("writer")) {
			sc.setWriter(search);
		}else if(condition.equals("title")) {
			sc.setTitle(search);
		}else {
			sc.setContent(search);
		}
		
		// 게시글 총 개수
		int listCount = mService.getSearchListCount(sc);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.selectSearchList(sc, pi);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("sc", sc).addObject("condition", condition)
							  .addObject("search", search).setViewName("mail/receiveMail");
		
		return mv;
	}
	
	@RequestMapping("receiveDetail.do")
	public ModelAndView receiveDetail(int mailNum, ModelAndView mv) {
		
		Mail m = mService.receiveDetail(mailNum);
		
		if(m != null) {
			mv.addObject("m", m).setViewName("mail/receiveDetail");
		}else {
			mv.addObject("msg", "메일 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("mdelete.do")
	public String mailDelete(int mailNum, HttpServletRequest request, Model model) {
		
		Mail m = mService.selectMail(mailNum);
		
		if(m.getRenameFileName() != null) {
			
			deleteFile(m.getRenameFileName(), request);
		}
		
		int result = mService.deleteMail(mailNum);
		
		if(result > 0) {
			return "redirect:receiveMail.do";
		}else {
			model.addAttribute("msg", "메일 삭제 실패");
			
			return ("common/errorPage");
		}		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\mupload";
		
		File f = new File(savePath + "\\" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("transfer.do")
	public ModelAndView mailTransfer(int mailNum, HttpServletRequest request, ModelAndView mv) {
		
		Mail m = mService.selectMail(mailNum);
		
		int result = mService.transferMail(mailNum);
		
		
		return mv;
	}
	
	
	
	
	
	
	
//	// pop3 메일 수신
//	@RequestMapping("receiveMail.do")
//	public static void open() throws AddressException, MessagingException {
//
//        String host = "pop.gmail.com";
//
//        final String username = "sangyoon2ya"; // @naver.com 은 제외하고 아이디만.
//        final String password = "12Rjwlfua!";
//        int port=995;
//
//        Properties props = System.getProperties();
//
//        props.put("mail.pop3.host", host);
//        props.put("mail.pop3.port", port);
//        props.put("mail.pop3.auth", "true");
//        props.put("mail.pop3.ssl.enable", "true");
//        props.put("mail.pop3.ssl.trust", host);
//
//        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
//
//            String un=username;
//            String pw=password;
//
//            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
//
//                return new javax.mail.PasswordAuthentication(un, pw);
//            }
//        });
//
//        session.setDebug(false);
//        
//        Store store = session.getStore("pop3");
//        store.connect();
//
//        Folder folder = store.getFolder("INBOX");
//        folder.open(Folder.READ_ONLY);
//
//        Message[] messages = folder.getMessages();
//
//        if (messages.length == 0) System.out.println("No messages found.");
//
//        for(Message message : messages) {
//
//            System.out.println(":::::::::::::::::::::::::::::::::::");
//            
//            System.out.println("제목: " + message.getSubject());
//            System.out.println("보낸시간: " + message.getSentDate());
////          System.out.println(message.getDataHandler());
//            System.out.println("보낸사람 이메일: " + message.getFrom()[0].toString().split("=? <")[1].split(">")[0]);
//            try {
//				System.out.println("내용: " + message.getContent());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//        }
//        store.close();
//    }


}
