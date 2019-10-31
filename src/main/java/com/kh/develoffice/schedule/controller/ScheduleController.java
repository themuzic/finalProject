package com.kh.develoffice.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.develoffice.common.Pagination2;
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
	
	// 게시판에 일정 셀렉
	@RequestMapping("teamScheduleList.do")
	public ModelAndView teamSchedulelList(Schedule s, ModelAndView mv, HttpSession session, HttpServletResponse response,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		
		response.setCharacterEncoding("utf-8");
		
		Employee e = (Employee)session.getAttribute("loginUser");
		
		s.setEmpId(e.getEmpId());
		s.setSplan("T");

		// 게시글 총 개수
		int listCount = sService.getListCount(s);
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
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
	
	// 새로고침
	@ResponseBody
	@RequestMapping("sRefresh.do")
	public void sRefresh(Schedule s, HttpServletResponse response, HttpSession session,
			@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) throws JsonIOException, IOException {
		
		response.setCharacterEncoding("utf-8");
		
		int listCount = sService.getListCount(s);
		
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		
		ArrayList<Schedule> list = sService.teamScheduleList(pi,s);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 캘린더에 셀렉
	@ResponseBody
	@RequestMapping("addCalendar.do")
	public void addCalendar(Schedule s, HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
		response.setCharacterEncoding("utf-8");
		
		ArrayList<Schedule> list = sService.addScheduleList(s);
//		System.out.println(list);
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
	}
	
	@ResponseBody
	@RequestMapping("deleteSchedule.do")
	public String deleteSchedule(Schedule s) {

		int result = sService.deleteSchedule(s);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateSchedule.do")
	public String updateSchedule(Schedule s) {
	
		int result = sService.updateSchedule(s);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("movingSchedule.do")
	public String movingSchedule(Schedule s) {
		
//		System.out.println(s);
		int result = sService.movingSchedule(s);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
}
