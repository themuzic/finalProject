package com.kh.develoffice.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.develoffice.project.model.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@RequestMapping("projectList.do")
	public String projectList() {
		return "project/projectList";
	}
	
	@RequestMapping("insertProject.do")
	public String insertProject() {
		return "project/insertProjectForm";
	}
	
	@RequestMapping("projectDetail.do")
	public String projectDetail() {
		return "project/projectDetail";
	}

}
