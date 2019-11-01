package com.kh.develoffice.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
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
	public ModelAndView teamSchedulelList(Schedule s, ModelAndView mv, HttpSession session, HttpServletResponse response,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		response.setCharacterEncoding("utf-8");
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		s.setEmpId(e.getEmpId());
		s.setSplan("T");

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
		
		System.out.println(s);
		int result = sService.insertSchedule(s);
		
		if(result > 0) {
			return "success";
		}else {
			
			return "fail";
		}
	}
	
	@RequestMapping("sRefresh.do")
	public void sRefresh(Schedule s, HttpServletResponse response, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) throws JsonIOException, IOException {
		
		
		response.setCharacterEncoding("utf-8");
		
//		Employee e = (Employee)session.getAttribute("loginUser");
//		s.setEmpId(e.getEmpId());
		
		int listCount = sService.getListCount(s);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Schedule> list = sService.teamScheduleList(pi,s);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(list, response.getWriter());
		
	}
	
	@RequestMapping("addCalendar.do")
	public void addCalendar(HttpServletResponse response) {
		
		response.setCharacterEncoding("utf-8");
		
	}
	
	
}
