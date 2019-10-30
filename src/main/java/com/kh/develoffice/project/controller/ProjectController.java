package com.kh.develoffice.project.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.project.model.service.ProjectService;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	@Autowired
	private DocumentService dService;
	@Autowired
	private EmployeeService eService;
	
	
	
	
	@RequestMapping("insertProject.do")
	public ModelAndView insertProject(ModelAndView mv) {
		
		ArrayList<Department> deptList = dService.selectDept();
		ArrayList<Employee> empList = eService.selectAllEmp();
		
		//System.out.println(deptList);
		//System.out.println(empList);
		
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
			
			empArr.add(jObj);
		}
		
		
		
		mv.addObject("empList", empArr);
		mv.addObject("deptList", deptArr);
		mv.addObject("deptSize", deptArr.size());
		mv.setViewName("project/insertProjectForm");
		
		
		return mv;
	}
	
	// 프로젝트 리스트 불러오기
	@RequestMapping("projectList.do")
	public ModelAndView projectList(ModelAndView mv, Project p) {

		//프로젝트 리스트 불러오기
		ArrayList<Project> plist = pService.selectPlist(p);
		
		if(plist != null) {
			mv.addObject("plist", plist);
			mv.setViewName("project/projectList");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	
	// 프로젝트 상세 페이지로 이동
	@RequestMapping("projectDetail.do")
	public ModelAndView projectDetail(ModelAndView mv, ProjectTask p) {
		
		// 업무 리스트 불러오기
		ArrayList<ProjectTask> taskList = pService.selectTaskList(p);
		
		if(taskList != null) {
			mv.addObject("taskList", taskList);
			mv.setViewName("project/projectDetail");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	
	// 업무 추가 버튼 클릭 시
	@RequestMapping("insertTaskView.do")
	public String insertTask() {
		return "project/insertTaskview";
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
