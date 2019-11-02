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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.common.Pagination;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.service.MailService;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.mail.model.vo.PageInfo;

@Controller
public class MailController {
	
	@Autowired
	private MailService mService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private DocumentService dService;
	@Autowired
	private EmployeeService eService;
	
	// 받은 메일함 리스트
	@RequestMapping("receiveMail.do")
	public ModelAndView receiveMailList(ModelAndView mv, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
	
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setMailTo(e.getEmail());
		
		// 게시글 총 개수
		int listCount = mService.getListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.receiveMailList(pi, m);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/receiveMail");
		
		return mv;
	}
	
	// 보낸 메일함 리스트
	@RequestMapping("sendMail.do")
	public ModelAndView sendMailList(ModelAndView mv, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setMailFrom(e.getEmail());
		
		// 게시글 총 개수
		int listCount = mService.getListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.sendMailList(pi, m);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/sendMail");
		
		return mv;
	}
	
	// 휴지통 리스트
	@RequestMapping("deleteMail.do")
	public ModelAndView deleteMailList(ModelAndView mv, HttpSession session,
						@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setStatus("N");
		
		// 게시글 총 개수
		int listCount = mService.getListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.deleteMailList(pi, e);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/deleteMail");
		
		return mv;
	}
	
	// 중요 메일함 리스트
	@RequestMapping("importantMail.do")
	public ModelAndView importantMailList(ModelAndView mv, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setMailImportant(1);
		
		// 게시글 총 개수
		int listCount = mService.getListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.importantMailList(pi, e);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("mail/importantMail");
		
		return mv;
	}
	
	// 메일쓰기 이동
	@RequestMapping("insertMail.do")
	public ModelAndView insertMailForm(ModelAndView mv) {
		
		ArrayList<Department> deptList = dService.selectDept();
		ArrayList<Employee> empList = eService.selectAllEmp();
		
		JSONArray deptArr = new JSONArray();
		JSONArray empArr = new JSONArray();

		for(Department d : deptList) {
			JSONObject jObj = new JSONObject();
			jObj.put("deptCode", d.getDeptCode());
			jObj.put("deptName", d.getDeptName());
			jObj.put("count", d.getCount());
			
			deptArr.add(jObj);
		}
		
		for(Employee e : empList) {
			JSONObject jObj = new JSONObject();
			jObj.put("empId", e.getEmpId());
			jObj.put("empName", e.getEmpName());
			jObj.put("deptCode", e.getDeptCode());
			jObj.put("deptName", e.getDeptName());
			jObj.put("jobCode", e.getJobCode());
			jObj.put("jobName", e.getJobName());
			jObj.put("account", e.getAccount());
			jObj.put("email", e.getEmail());
			
			empArr.add(jObj);
		}
		mv.addObject("empList", empArr);
		mv.addObject("deptList", deptArr);
		mv.addObject("deptSize", deptArr.size());
		mv.setViewName("mail/insertMail");
		
		return mv;
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
		
		Employee emp = (Employee)session.getAttribute("loginUser");
		
		String email = emp.getEmail();
		
		System.out.println("넘어온 메일 객체 : "+m);
		System.out.println("넘어온 파일 정보 : "+uploadFile);
		
    	if(uploadFile!=null && !uploadFile.getOriginalFilename().equals("")) {	// 첨부파일이 넘어온 경우
		
    	System.out.println("파일유무 조건문 통과");
		
		String filename = saveFile(uploadFile, request);
		
		System.out.println("바뀐 파일명 : "+filename);
		   
	    try {
	      mailSender.setUsername(email); 					// 디비에서 메일 아이디 담고
	      mailSender.setPassword("develoffice1!");			// 디비에서 메일 비밀번호 담고
	      
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(email);
	      message.setRecipients(Message.RecipientType.TO, m.getMailTo()); 	// 받는사람
	      message.setRecipients(Message.RecipientType.CC, m.getMailCc()); 	// 참조    
	      messageHelper.setSubject(m.getMailTitle());   		// 메일제목은 생략이 가능하다
	      messageHelper.setText(m.getMailContent());   			// 메일 내용
	      
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
		
		}else {
			   
		    try {
		      mailSender.setUsername(email); 		// 디비에서 메일 아이디 담고
			  mailSender.setPassword("develoffice1!");			// 디비에서 메일 비밀번호 담고
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(email);
		      message.setRecipients(Message.RecipientType.TO, m.getMailTo()); 	// 받는사람
		      message.setRecipients(Message.RecipientType.CC, m.getMailCc()); 	// 참조    
		      messageHelper.setSubject(m.getMailTitle());   		// 메일제목은 생략이 가능하다
		      messageHelper.setText(m.getMailContent());   			// 메일 내용
			     
			    mailSender.send(message);
			    
			  	} catch(Exception e){
			      System.out.println(e);
			  	}	
		}
    	
		// mail 테이블에 insert
		int result = mService.insertMail(m);
		
		// 받는메일과 / from,to empId 불러오기
		String toEmail = m.getMailTo();
		String ccEmail = m.getMailCc();
		int fromEmpId = m.getEmpId();
		int toEmpId = mService.selectEmpId(toEmail);
		
		int ccEmpId = 0; // 없을 때 저장 안함
		
		if(ccEmail != null) {
			
			ccEmpId = mService.selectEmpId(ccEmail);
		}
			
		if(result > 0) {
			
			int result1 = mService.insertStatusMail(fromEmpId);
			
			int result2 = 1;
			
			if(toEmpId != 0) {
				
				result2 = mService.insertStatusMail(toEmpId);
			}
			
			int result3 = 1;
			
			if(ccEmpId !=0) {
				result3 = mService.insertStatusMail(ccEmpId);
			}
			
			if(result1 > 0 && result2 > 0 && result3 > 0) {
				return "mail/successMail";
			}else {
				model.addAttribute("msg", "메일전송 실패!");
				return "common/errorPage";
			}
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
	
	// 보낸 메일함 검색
	@RequestMapping("search.do")
	public ModelAndView searchMailList(ModelAndView mv, HttpServletRequest request, HttpSession session,
					@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setMailFrom(e.getEmail());
		
		String condition = request.getParameter("condition"); // writer, title, content
		String search = request.getParameter("search");
		
		if(condition.equals("writer")) {
			m.setWriter(search);
		}else if(condition.equals("title")) {
			m.setTitle(search);
		}else {
			m.setContent(search);
		}
		
		// 게시글 총 개수
		int listCount = mService.getSearchListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.selectSearchList(m, pi);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("m", m).addObject("condition", condition)
							  .addObject("search", search).setViewName("mail/sendMail");

		return mv;
	}
	
	// 받은 메일함 검색
	@RequestMapping("search2.do")
	public ModelAndView searchMailList2(ModelAndView mv, HttpServletRequest request, HttpSession session,
					@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setMailTo(e.getEmail());
		
		String condition = request.getParameter("condition"); // writer, title, content
		String search = request.getParameter("search");
		
		if(condition.equals("writer")) {
			m.setWriter(search);
		}else if(condition.equals("title")) {
			m.setTitle(search);
		}else {
			m.setContent(search);
		}
		
		// 게시글 총 개수
		int listCount = mService.getSearchListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.selectSearchList(m, pi);
			
		mv.addObject("pi", pi).addObject("list", list).addObject("m", m).addObject("condition", condition)
		  .addObject("search", search).setViewName("mail/receiveMail");
		
		return mv;
	}
	
	// 휴지통 검색
	@RequestMapping("search3.do")
	public ModelAndView searchMailList3(ModelAndView mv, HttpServletRequest request, HttpSession session,
					@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setStatus("N");
		
		String condition = request.getParameter("condition"); // writer, title, content
		String search = request.getParameter("search");
		
		if(condition.equals("writer")) {
			m.setWriter(search);
		}else if(condition.equals("title")) {
			m.setTitle(search);
		}else {
			m.setContent(search);
		}
		
		// 게시글 총 개수
		int listCount = mService.getSearchListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.deleteSearchList(m, pi);
			
		mv.addObject("pi", pi).addObject("list", list).addObject("m", m).addObject("condition", condition)
		  .addObject("search", search).setViewName("mail/deleteMail");
		
		return mv;
	}
	
	// 중요메일함 검색조회
	@RequestMapping("search4.do")
	public ModelAndView searchMailList4(ModelAndView mv, HttpServletRequest request, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		Mail m = new Mail();
		
		m.setEmpId(e.getEmpId());
		m.setMailImportant(1);
		
		String condition = request.getParameter("condition"); // writer, title, content
		String search = request.getParameter("search");
		
		if(condition.equals("writer")) {
			m.setWriter(search);
		}else if(condition.equals("title")) {
			m.setTitle(search);
		}else {
			m.setContent(search);
		}
		
		// 게시글 총 개수
		int listCount = mService.getSearchListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Mail> list = mService.importantSearchList(m, pi);
			
		mv.addObject("pi", pi).addObject("list", list).addObject("m", m).addObject("condition", condition)
		  .addObject("search", search).setViewName("mail/importantMail");
		
		return mv;
	}
	
	// 받은, 보낸 메일함 상세조회
	@RequestMapping("receiveDetail.do")
	public ModelAndView receiveDetail(Mail mail, ModelAndView mv, HttpSession session) {
		
		mail.setEmpId(((Employee)session.getAttribute("loginUser")).getEmpId());
		
		Mail m = mService.receiveDetail(mail);
		
		if(m != null) {
			m.getMailDate();
//			System.out.println(m.getMailDate());
			mv.addObject("m", m).setViewName("mail/receiveDetail");
		}else {
			mv.addObject("msg", "메일 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 휴지통 메일함 상세조회
	@RequestMapping("deleteDetail.do")
	public ModelAndView deleteDetail(Mail mail, ModelAndView mv, HttpSession session) {
		
		mail.setEmpId(((Employee)session.getAttribute("loginUser")).getEmpId());
		
		Mail m = mService.receiveDetail(mail);
		
		if(m != null) {
			m.getMailDate();
			mv.addObject("m", m).setViewName("mail/deleteDetail");
		}else {
			mv.addObject("msg", "메일 상세조회 실패").setViewName("common/errorpage");
		}
		return mv;
	}
	
	
	// 메일 지우기(휴지통으로)
	@RequestMapping("delete.do")
	public String delete(Mail m, HttpServletRequest request, Model model) {
		
		int result = mService.updateMail(m);
		
		if(result > 0) {
			return "redirect:deleteMail.do";
		}else {
			model.addAttribute("msg", "메일 이동 실패");
			
			return ("common/errorPage");
		}
	}
	
	//체크된 메일 지우기(휴지통으로)
	@ResponseBody // String으로 반환 --> 이거 없으면 아래에서 jsp로 찾음
	@RequestMapping("trash.do")
	public String trash(Mail m) {
		
		int result = mService.updateMail(m);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 체크된 메일 완전 삭제
	@ResponseBody
	@RequestMapping("deleteAll.do")
	public String deleteAll(Mail m, HttpServletRequest request) {
		
		if(m.getRenameFileName() != null) {
			
			deleteFile(m.getRenameFileName(), request);
		}
		
		int result = mService.deleteMail(m);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 체크된 메일 복구 ajax
	@ResponseBody
	@RequestMapping("restore.do")
	public String restore(Mail m) {
		
		int result = mService.restoreMail(m);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("mRestore.do")
	public String mRestore(Mail m, HttpServletRequest request, Model model) {
		
		int result = mService.restoreMail(m);
		
		if(result > 0) {
			return "mail/deleteMail";
		}else {
			model.addAttribute("msg", "메일 복구 실패");
			return "common/errorPage";
		}
	}
	
	// 메일 완전 삭제
	@RequestMapping("mdelete.do")
	public String mailDelete(Mail m, HttpServletRequest request, Model model) {
		
		if(m.getRenameFileName() != null) {
			
			deleteFile(m.getRenameFileName(), request);
		}
		
		int result = mService.deleteMail(m);
		
		if(result > 0) {
			return "redirect:deleteMail.do";
		}else {
			model.addAttribute("msg", "메일 삭제 실패");
			
			return "common/errorPage";
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
	
	// 메일 전달
	@RequestMapping("transfer.do")
	public ModelAndView transfer(Mail mail, ModelAndView mv, HttpSession session) {
		
		
		ArrayList<Department> deptList = dService.selectDept();
		ArrayList<Employee> empList = eService.selectAllEmp();
		
		JSONArray deptArr = new JSONArray();
		JSONArray empArr = new JSONArray();

		for(Department d : deptList) {
			JSONObject jObj = new JSONObject();
			jObj.put("deptCode", d.getDeptCode());
			jObj.put("deptName", d.getDeptName());
			jObj.put("count", d.getCount());
			
			deptArr.add(jObj);
		}
		
		for(Employee e : empList) {
			JSONObject jObj = new JSONObject();
			jObj.put("empId", e.getEmpId());
			jObj.put("empName", e.getEmpName());
			jObj.put("deptCode", e.getDeptCode());
			jObj.put("deptName", e.getDeptName());
			jObj.put("jobCode", e.getJobCode());
			jObj.put("jobName", e.getJobName());
			jObj.put("account", e.getAccount());
			jObj.put("email", e.getEmail());
			
			empArr.add(jObj);
		}
		
		mv.addObject("empList", empArr);
		mv.addObject("deptList", deptArr);
		mv.addObject("deptSize", deptArr.size());
//		mv.setViewName("mail/transfer");

		
		mail.setEmpId(((Employee)session.getAttribute("loginUser")).getEmpId());
		
		Mail m = mService.receiveDetail(mail);
		
		if(m != null) {
			m.getMailDate();
			mv.addObject("m", m).setViewName("mail/transfer");

		}else {
			mv.addObject("msg", "메일전달 실패").setViewName("common/errorPage");
		}

		return mv;
	}
	
	@ResponseBody
	@RequestMapping("updateImportant.do")
	public String updateImportant(int mailNum, int importantFlag, int empId) {
		
		Mail m = new Mail();
		
		m.setMailNum(mailNum);
		m.setMailImportant(importantFlag);
		m.setEmpId(empId);
		
		int result = mService.updateImportant(m);
		
		if(result > 0) {
//			System.out.println("성공");
			return "success";
		}else {
//			System.out.println("sdfdsfds");
			return "fail";
		}
		
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
