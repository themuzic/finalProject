package com.kh.develoffice.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.schedule.model.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;
	
	@RequestMapping("publicScheduleList.do")
	public String publicScheduleList() {
		return "schedule/publicScheduleList";
	}
	
	@RequestMapping("teamScheduleList.do")
	public String teamScheduleList() {
		return "schedule/teamScheduleList";
	}

}
