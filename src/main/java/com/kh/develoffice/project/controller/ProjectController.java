package com.kh.develoffice.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.project.model.service.ProjectService;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
import com.kh.develoffice.project.model.vo.ProjectTask;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	@Autowired
	private DocumentService dService;
	@Autowired
	private EmployeeService eService;
	
	
	
	// 프로젝트 멤버 추가하기
	@RequestMapping("insertMem.do")
	public ModelAndView insertMem(ModelAndView mv, 
			 					  @RequestParam("empId") String[] empIds, @RequestParam("pNo") int pNo) {
		System.out.println(pNo);
		for(int i = 0; i < empIds.length; i++) {
			System.out.println("empId: " + empIds[i]);
		}
		
		int result = pService.insertMem(empIds, pNo);
		
		if(result > 0) {
			mv.setViewName("project/projectDetail");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		return mv;
	}
	
	// 프로젝트 생성 뷰로 이동
	@RequestMapping("insertProjectForm.do")
	public String insertProjectForm() {
		return "project/insertProjectForm";
	}
	
	// 프로젝트 생성
	@RequestMapping("insertProject.do")
	public String insertProject(Project p, ProjectMember m, Model model) {
		
		int result = pService.insertProject(p);
		
		if(result > 0) {
			int result2 = pService.insertPm(m);
			if(result2 > 0) {
				return "redirect:projectList.do";
			} else {
				model.addAttribute("msg", "보드 생성에 실패하였습니다.");
				return "common/blankPage";
			}
		}else {
			model.addAttribute("msg", "보드 생성에 실패하였습니다.");
			return "common/blankPage";
		}
		
	}
	
	// 프로젝트 리스트 불러오기
	@RequestMapping("projectList.do")
	public ModelAndView projectList(ModelAndView mv, HttpSession session) {
		
		ArrayList<Employee> empList = eService.selectAllEmp();
		Employee e = (Employee)session.getAttribute("loginUser");
		
		int empId = e.getEmpId();
		//System.out.println(empList);
		//System.out.println("controller : " + empId);
		
		//프로젝트 리스트 불러오기
		ArrayList<Project> plist = pService.selectPlist(empId);
		
		// 프로젝트 멤버 리스트 불러오기
		ArrayList<ProjectMember> mlist = pService.selectMlist();
		
		
		if(plist != null) {
			mv.addObject("empList", empList);
			mv.addObject("plist", plist);
			mv.addObject("mlist", mlist);
			mv.setViewName("project/projectList");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	
	// 프로젝트 상세 페이지로 이동
	@RequestMapping("projectDetail.do")
	public ModelAndView projectDetail(@RequestParam("pNo") int pNo, ModelAndView mv, HttpSession session, ProjectTask p) {
		
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
		
		System.out.println("pNo: " + pNo);
		System.out.println(p);
		Employee e = (Employee)session.getAttribute("loginUser");
		p.setTaskWriter(e.getEmpId());
		
		// 프로젝트 상세 조회
		Project projectDetail = pService.projectDetail(pNo);
		
		// 업무 리스트 불러오기
		ArrayList<ProjectTask> taskList = pService.selectTaskList(pNo);
		System.out.println(p);
		
		if(projectDetail != null) {
			mv.addObject("projectDetail", projectDetail);
			mv.addObject("taskList", taskList);
			mv.setViewName("project/projectDetail");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("afterTask.do")
	public String afterTask(int pNo, HttpSession session, ProjectTask p, Model model) {
		System.out.println("afterTask");
		Employee e = (Employee)session.getAttribute("loginUser");
		p.setTaskWriter(e.getEmpId());
		
		Project projectDetail = pService.projectDetail(pNo);
		ArrayList<ProjectTask> taskList = pService.selectTaskList(pNo);
		
		System.out.println("afterTask2");
		
		if(taskList != null) {
			model.addAttribute(projectDetail);
			model.addAttribute(taskList);
			
			return "project/projectDetail"; 
		} else {
			model.addAttribute("msg", "보드 생성에 실패하였습니다.");
			return "common/blankPage";
		}
	}
	
	
	// 업무 추가 버튼 클릭 시
	@ResponseBody
	@RequestMapping("insertTask.do")
	public String insertTask(ProjectTask t, Model model, HttpSession session) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		t.setTaskWriter(e.getEmpId());
		
		System.out.println(t);
		
		int result = pService.insertTask(t);
		System.out.println(t);
		
		if(result > 0) {
			System.out.println("여기까지 넘어옴");
			return "redirect:projectDetail.do";
		} else {
			model.addAttribute("msg", "보드 생성에 실패하였습니다.");
			return "common/blankPage";
		}
		
	}
	
	// 진행상황 수정
	@ResponseBody
	@RequestMapping("updateProgress.do")
	public ModelAndView updateProgress(Project p, ModelAndView mv, HttpSession session) {
		
		Employee e = (Employee)session.getAttribute("loginUser");
		int empId = e.getEmpId();
		//System.out.println("empId: " + empId);
		int result = pService.updateProgress(empId);
			
		if(result > 0) {
			mv.addObject("pProgress", p.getpProgress());
			mv.setViewName("project/projectDetail");
		}else {
			mv.addObject("msg", "권한이 없습니다.");
		}
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
