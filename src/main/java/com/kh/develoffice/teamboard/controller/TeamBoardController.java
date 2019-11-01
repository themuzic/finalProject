package com.kh.develoffice.teamboard.controller;

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
import com.kh.develoffice.teamboard.model.service.TeamBoardService;
import com.kh.develoffice.teamboard.model.vo.TeamBoard;
import com.kh.develoffice.teamboard.model.vo.TeamBoardReply;

@Controller
public class TeamBoardController {

	@Autowired
	private TeamBoardService tbSerivce;
	
	@RequestMapping("listTeamBoard.do")
	public ModelAndView TeamBoardList(ModelAndView mv, HttpSession session) {
		int deptCode = ((Employee)session.getAttribute("loginUser")).getDeptCode();
		ArrayList<TeamBoard> list = tbSerivce.selectList(deptCode);
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("teamboard/teamBoardListView");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다");
		}
		
		return mv;
	}
	
	@RequestMapping("insertTeamBoardView.do")
	public String insertFree() {
		return "teamboard/insertTeamBoard";
	}
	
	@RequestMapping("tbinsert.do")
	public String insertTeamBoard(TeamBoard tb, HttpServletRequest request, Model model,
							  @RequestParam(name="tbUploadFile", required = false) MultipartFile file) {
		
//		System.out.println(f);
//		System.out.println("원본명 : " + file.getOriginalFilename());
		

		
		if(file != null && !file.getOriginalFilename().equals("")) {     // 첨부 파일이 넘어온 경우
			
			// 서버에 파일을 등록(폴더에 저장)
			// 내가 저장하고자 하는 파일, request 전달하고 실제로 저장된 파일명 돌려주는 saveFile
			String renameFileName = saveFile(file, request);
			
			if(renameFileName != null) {	// 파일 이 잘 저장된 경우
				tb.setOriginalFileName(file.getOriginalFilename());
				tb.setRenameFileName(renameFileName);
			}
		}
		
		int result = tbSerivce.insertTeamBoard(tb);     
		
		if(result>0) {
			return "redirect:listTeamBoard.do";
		}else {
			model.addAttribute("msg", "게시판 작성실패");
			return "common/errorPage";
		}
		
		
	
	}
	
	
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\tbupload"; // 특수 기호로 인식하고자 한다면 \가 하나 더 필요함
		
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
	
	@RequestMapping("teamBoardDetail.do")
	public ModelAndView teamBoardDetail(int tbId, ModelAndView mv) {
		TeamBoard tb = tbSerivce.teamBoardDetail(tbId);
		
		if(tb != null) {
			mv.addObject("tb", tb).setViewName("teamboard/teamBoardDetailView");
		}else {
			mv.addObject("msg", "상세조회실패!");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("teamBoardDelete.do")
	public String teamBoardDelete(int tbId, HttpServletRequest request, Model model) {
		
		TeamBoard tb = tbSerivce.selectTeamBoard(tbId); 
		
		if(tb.getRenameFileName() != null) {  
			
			deleteFile(tb.getRenameFileName(), request);
		}
		int result = tbSerivce.deleteTeamBoard(tbId); 
		
		if(result >0) { 
			return "redirect:listTeamBoard.do";
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
		
	
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\tbupload"; 
		
		File fi = new File(savePath + "\\"+ fileName);
		
		if(fi.exists()) {   // file 존재한다면
			fi.delete();    // 삭제
		}
	}
	
	@RequestMapping("teamBoardUpdateView.do")
	public ModelAndView freeUpdateForm(int tbId, ModelAndView mv) {
		TeamBoard tb = tbSerivce.selectTeamBoard(tbId); 
		
		mv.addObject("tb", tb).setViewName("teamboard/teamBoardUpdate");
		
		return mv;
	}
	
	@RequestMapping("teamBoardUpdate.do")
	public ModelAndView freeUpdate(TeamBoard tb, ModelAndView mv,
								   HttpServletRequest request,
								   @RequestParam(name="tbReloadFile", required=false) MultipartFile file) {
		
		
		if(file != null && !file.isEmpty()) { 
			
			deleteFile(tb.getRenameFileName(), request); 	
			tb.setRenameFileName(null); 
			tb.setOriginalFileName(null); 
			
			String renameFileName = "";
			renameFileName =saveFile(file, request); 
			
			if(!(renameFileName.equals(""))){ 
				tb.setOriginalFileName(file.getOriginalFilename()); 
				tb.setRenameFileName(renameFileName); 
			}
		}		
			
		int result = tbSerivce.updateTeamBoard(tb);  
		
		if(result > 0) {
			mv.addObject("tbId", tb.getTbId())
			   .setViewName("redirect:teamBoardDetail.do");
		}else {
			mv.addObject("msg", "수정 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("teamBoardRlist.do")
	public void getReplyList(int tbId, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<TeamBoardReply> list = tbSerivce.selectTeamBoardReplyList(tbId); 
		
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
		
	}
	
	
	@ResponseBody
	@RequestMapping("teamBoardRinsert.do")
	public String insertReply(TeamBoardReply tbr, HttpSession session) {
		
		int id = ((Employee)session.getAttribute("loginUser")).getEmpId();
		
		
		tbr.setTbrWriter(id);  
		int result = tbSerivce.insertTeamBoardReply(tbr);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("teamBoardRupdate.do")
	public String teamBoardRupdate(TeamBoardReply tbr, HttpServletRequest request) {
		
		int result = tbSerivce.teamBoardRupdate(tbr);
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("teamBoardRdelete.do")
	public String teamBoardRdelete(TeamBoardReply tbr, HttpServletRequest request) {
		/* System.out.println(frr); */
		int result = tbSerivce.teamBoardRdelete(tbr); 
		/* System.out.println(result); */
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
}
