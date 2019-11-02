package com.kh.develoffice.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.free.model.vo.FreeLike;
import com.kh.develoffice.notice.model.service.NoticeService;
import com.kh.develoffice.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("listNotice.do")
	public ModelAndView noticeList(ModelAndView mv) {
		
		ArrayList<Notice> list = nService.selectList();
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("insertNoticeView.do")
	public String insertNotice() {
		return "notice/insertNotice";
	}
	
	@RequestMapping("ninsert.do")
	public String insertNoticeBoard(Notice n, HttpServletRequest request, Model model,
							  @RequestParam(name="nUploadFile", required = false) MultipartFile file) {
		
		if(file != null && !file.getOriginalFilename().equals("")) {     // 첨부 파일이 넘어온 경우
			
			// 서버에 파일을 등록(폴더에 저장)
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {	// 파일 이 잘 저장된 경우
				n.setOriginalFileName(file.getOriginalFilename());
				n.setRenameFileName(renameFileName);
			}
		}
		
		int result = nService.insertNoticeBoard(n);
		
		if(result>0) {
			return "redirect:listNotice.do";
		}else {
			model.addAttribute("msg", "게시판 작성실패");
			return "common/errorPage";
		}
		
		
	
	}
	
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nupload"; // 특수 기호로 인식하고자 한다면 \가 하나 더 필요함
		
		File folder = new File(savePath); // 저장될 폴더 지정 (java.io로 import)
		
		if(!folder.exists()) { // 폴더 존재x 경우
			folder.mkdirs();   // 폴더 생성 해라
		}
		
		String originalFileName = file.getOriginalFilename(); //원본명 (확장자)
		
		// 파일명 수정작업 --> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))    // 년월일시분초
							  + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 실제 저장될 경로 savaPath + 저장하고자 하는 파일명 renameFileName
		String renamePath = savePath + "\\" + renameFileName; 		// resources\bupload\201903111102033.jpg
		
		try {
			file.transferTo(new File(renamePath));			// 이때 서버에 업로드 됨
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	
	
		return renameFileName; 	// 수정명 반환
	}
	
	
	
	@RequestMapping("noticeDetail.do")
	public ModelAndView noticeDetail(int noId, ModelAndView mv) {
		Notice n = nService.boardNoticeDetail(noId);
		if(n != null) {
			mv.addObject("n", n).setViewName("notice/noticeDetailView");
		}else {
			mv.addObject("msg", "상세조회실패!");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(int noId, HttpServletRequest request, Model model) {
		
		Notice n = nService.selectNoticeBoard(noId);
		
		if(n.getRenameFileName() != null) {  
			
			deleteFile(n.getRenameFileName(), request);
		}
		int result = nService.deleteNoticeBoard(noId);
		
		if(result >0) { 
			return "redirect:listNotice.do";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
		
	
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\nupload"; 
		
		File fi = new File(savePath + "\\"+ fileName);
		
		if(fi.exists()) {   // file 존재한다면
			fi.delete();    // 삭제
		}
	}
	
	@RequestMapping("noticeUpdateView.do")
	public ModelAndView noticeUpdateForm(int noId, ModelAndView mv) {
		Notice n = nService.selectNoticeBoard(noId);
		
		mv.addObject("n", n).setViewName("notice/noticeUpdate");
		
		return mv;
	}
	
	@RequestMapping("noticeUpdate.do")
	public ModelAndView noticeUpdate(Notice n, ModelAndView mv,
								   HttpServletRequest request,
								   @RequestParam(name="noReloadFile", required=false) MultipartFile file) {
		
		
		if(file != null && !file.isEmpty()) { // 새로 업로드할 파일이 있으면
			
			deleteFile(n.getRenameFileName(), request); // 기존 파일 삭제하고
			n.setRenameFileName(null); //  수정명파일을 비워줌
			n.setOriginalFileName(null); // 원보명파일도 비어줌
			
			String renameFileName = "";
			renameFileName =saveFile(file, request); //  수정명파일을 서버에 저장
			
			if(!(renameFileName.equals(""))){ // 수정파일이 있다면
				n.setOriginalFileName(file.getOriginalFilename()); // 새로운 원본파일명 삽입
				n.setRenameFileName(renameFileName); // 새로운 수정파일명 삽입
			}
		}
		
//		System.out.println(f);
//		System.out.println("수정할 파일" + file);
			
		int result = nService.updateNoticeBoard(n); 
		
		if(result > 0) {
			mv.addObject("noId", n.getNoId())
			   .setViewName("redirect:noticeDetail.do");
		}else {
			mv.addObject("msg", "수정 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	
}
