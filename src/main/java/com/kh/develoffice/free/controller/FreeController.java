package com.kh.develoffice.free.controller;

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

import com.kh.develoffice.free.model.service.FreeService;
import com.kh.develoffice.free.model.vo.Free;

@Controller
public class FreeController {

	@Autowired
	private FreeService fService;
	
	@RequestMapping("listFree.do")
	public ModelAndView  freeList(ModelAndView mv) {
				
		ArrayList<Free> list = fService.selectList();
	
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("free/freeListView");
		}else {
			mv.addObject("msg", "글 작성에 실패 하였습니다.");
		}
		
		return mv;
	
	}
	
	@RequestMapping("insertFreeView.do")
	public String insertFree() {
		return "free/insertFree";
	}
	
///////////////////////////////////////////////////////////////////////////////////
	
	/*
	@RequestMapping("binsert.do")
	public String insertBoard(Free f, HttpServletRequest request, Model model,
							  @RequestParam(name="uploadFile", required = false) MultipartFile file) {
		
//		System.out.println(b);
//		System.out.println(file.getOriginalFilename());
		
		// 파일업로드 관된 라이브러리 추가
		// root-context.xml에 빈으로 등록해야됨. 이때 파일사이즈 지정 가능
		
		if(!file.getOriginalFilename().equals("")) {     // 첨부 파일이 넘어온 경우
			
			// 서버에 파일을 등록(폴더에 저장)
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {	// 파일 이 잘 저장된 경우
				f.setOriginalFileName(file.getOriginalFilename());
				f.setRenameFileName(renameFileName);
			}
		}
		
		int result = fService.insertBoard(f);
		
		if(result>0) {
			return "redirect:listFree.do";
		}else {
			model.addAttribute("msg", "게시판 작성실패");
			return "common/errorPage";
		}
		
		
	
	}
	
	
	 * public String testsaveFile(MultipartHttpServletRequest files) {
	 * 
	 * return null; }
	 
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\bupload"; // 특수 기호로 인식하고자 한다면 \가 하나 더 필요함
		
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
	*/
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("freeDetail.do")
	public ModelAndView freeDetail(int frId, ModelAndView mv) {
		Free f = fService.boardDetail(frId);
		
		if(f != null) {
			mv.addObject("f", f).setViewName("free/freeDetailView");
		}else {
			mv.addObject("msg", "상세조회실패!");
		}
		
		return mv;
	}
	
	
	@RequestMapping("freeUpdate.do")
	public String freeUpdate() {
		return "free/freeUpdate";
	}
	
}
