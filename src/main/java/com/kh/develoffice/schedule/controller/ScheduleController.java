package com.kh.develoffice.schedule.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Pagination;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.mail.model.vo.PageInfo;
import com.kh.develoffice.schedule.model.service.ScheduleService;
import com.kh.develoffice.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;
	
	// 게시판 페이징 카운트
	@RequestMapping("publicScheduleList.do")
	public String publicScheduleList() {
		
		return "schedule/publicScheduleList";
	}
	
	// 일정 셀렉
	@RequestMapping("teamScheduleList.do")
	public ModelAndView teamSchedulelList(Schedule s, ModelAndView mv, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		s.setEmpId(e.getEmpId());
		
		// 게시글 총 개수
		int listCount = sService.getListCount(s);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Schedule> list = sService.teamScheduleList(pi, s);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("schedule/teamScheduleList");
		
		return mv;
	}
	
	// 일정 등록
	@ResponseBody
	@RequestMapping("insertSchedule.do")
	public String insertSchedule(Schedule s) {
		
//		System.out.println(s);
		int result = sService.insertSchedule(s);
		
		if(result > 0) {
			return "success";
		}else {
			
			return "fail";
		}
	}
	
	
}
