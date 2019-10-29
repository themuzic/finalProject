package com.kh.develoffice.free.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.free.model.service.FreeService;
import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.free.model.vo.FreeLike;
import com.kh.develoffice.free.model.vo.FreeReply;

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
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	
	}
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("insertFreeView.do")
	public String insertFree() {
		return "free/insertFree";
	}
	
	@RequestMapping("finsert.do")
	public String insertFreeBoard(Free f, HttpServletRequest request, Model model,
							  @RequestParam(name="fUploadFile", required = false) MultipartFile file) {
		
//		System.out.println(f);
//		System.out.println("원본명 : " + file.getOriginalFilename());
		

		
		if(file != null && !file.getOriginalFilename().equals("")) {     // 첨부 파일이 넘어온 경우
			
			// 서버에 파일을 등록(폴더에 저장)
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {	// 파일 이 잘 저장된 경우
				f.setOriginalFileName(file.getOriginalFilename());
				f.setRenameFileName(renameFileName);
			}
		}
		
		int result = fService.insertFreeBoard(f);
		
		if(result>0) {
			return "redirect:listFree.do";
		}else {
			model.addAttribute("msg", "게시판 작성실패");
			return "common/errorPage";
		}
		
		
	
	}
	
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\fupload"; // 특수 기호로 인식하고자 한다면 \가 하나 더 필요함
		
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
	
	
	//////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("freeDetail.do")
	public ModelAndView freeDetail(int frId, ModelAndView mv) {
		Free f = fService.boardFreeDetail(frId);
		if(f != null) {
			FreeLike count = fService.selectLikeCount(frId);
			mv.addObject("count", count.getCount());
			mv.addObject("f", f).setViewName("free/freeDetailView");
		}else {
			mv.addObject("msg", "상세조회실패!");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("freeDelete.do")
	public String freeDelete(int frId, HttpServletRequest request, Model model) {
		
		Free f = fService.selectFreeBoard(frId);
		
		if(f.getRenameFileName() != null) {  
			
			deleteFile(f.getRenameFileName(), request);
		}
		int result = fService.deleteFreeBoard(frId);
		
		if(result >0) { 
			return "redirect:listFree.do";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
		
	
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\fupload"; 
		
		File fi = new File(savePath + "\\"+ fileName);
		
		if(fi.exists()) {   // file 존재한다면
			fi.delete();    // 삭제
		}
	}
	
	@RequestMapping("freeUpdateView.do")
	public ModelAndView freeUpdateForm(int frId, ModelAndView mv) {
		Free f = fService.selectFreeBoard(frId);
		
		mv.addObject("f", f).setViewName("free/freeUpdate");
		
		return mv;
	}
	
	@RequestMapping("freeUpdate.do")
	public ModelAndView freeUpdate(Free f, ModelAndView mv,
								   HttpServletRequest request,
								   @RequestParam(name="frReloadFile", required=false) MultipartFile file) {
		
		
		if(file != null && !file.isEmpty()) { // 새로 업로드할 파일이 있으면
			
			deleteFile(f.getRenameFileName(), request); // 기존 파일 삭제하고
			f.setRenameFileName(null); //  수정명파일을 비워줌
			f.setOriginalFileName(null); // 원보명파일도 비어줌
			
			String renameFileName = "";
			renameFileName =saveFile(file, request); //  수정명파일을 서버에 저장
			
			if(!(renameFileName.equals(""))){ // 수정파일이 있다면
				f.setOriginalFileName(file.getOriginalFilename()); // 새로운 원본파일명 삽입
				f.setRenameFileName(renameFileName); // 새로운 수정파일명 삽입
			}
		}
		
//		System.out.println(f);
//		System.out.println("수정할 파일" + file);
			
		int result = fService.updateFreeBoard(f); 
		
		if(result > 0) {
			mv.addObject("frId", f.getFrId())
			   .setViewName("redirect:freeDetail.do");
		}else {
			mv.addObject("msg", "수정 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("freeRlist.do")
	public void getReplyList(int frId, HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<FreeReply> list = fService.selectFreeReplyList(frId);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
		
	}
	
	
	@ResponseBody
	@RequestMapping("freeRinsert.do")
	public String insertReply(FreeReply frr, HttpSession session) {
		
		int id = ((Employee)session.getAttribute("loginUser")).getEmpId();
		
		
		frr.setFrrWriter(id);
		int result = fService.insertFreeReply(frr);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("freeRupdate.do")
	public String freeRupdate(FreeReply frr, HttpServletRequest request) {
		
		int result = fService.freeRupdate(frr);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("freeRdelete.do")
	public String freeRdelete(FreeReply frr, HttpServletRequest request) {
		/* System.out.println(frr); */
		int result = fService.freeRdelete(frr);
		/* System.out.println(result); */
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("insertLike.do")
	public int insertLike(FreeLike like) {
		FreeLike fl = fService.checkLike(like);
		System.out.println("fl : "+fl);
		
		if(fl == null) {
			int result = fService.insertLike(like);
			if(result>0) {
				FreeLike count = fService.selectLikeCount(like.getFrId());
				return count.getCount();
			}else {
				return 0;
			}
		}else {
			int result =fService.deleteLike(like);
			if(result>0) {
				FreeLike count = fService.selectLikeCount(like.getFrId());
				return count.getCount();
			}else {
				return 0;
			}
		}
		
		
		
		
	}
	
	
	
	
	
	
	
}
