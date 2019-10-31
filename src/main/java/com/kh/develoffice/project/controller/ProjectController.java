package com.kh.develoffice.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	
	//@RequestMapping("insertProject.do")
	/*public ModelAndView insertProject(ModelAndView mv, @RequestParam("empId") String[] empIds) {
		
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
	}*/
	
	// 프로젝트 생성 뷰로 이동
	@RequestMapping("insertProjectForm.do")
	public String insertProjectForm() {
		return "project/insertProjectForm";
	}
	
	// 프로젝트 생성
	@RequestMapping("insertProject.do")
	public String insertProject(Project p, ProjectMember m,Model model) {
		
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
		
		if(plist != null) {
			mv.addObject("empList", empList);
			mv.addObject("plist", plist);
			mv.setViewName("project/projectList");
		}else {
			mv.addObject("msg", "리스트가 존재하지 않습니다.");
		}
		
		return mv;
	}
	
	
	// 프로젝트 상세 페이지로 이동
	@RequestMapping("projectDetail.do")
	public ModelAndView projectDetail(int pNo, ModelAndView mv, HttpSession session, ProjectTask p) {
		System.out.println("pNo: " + pNo);
		System.out.println(p);
		Employee e = (Employee)session.getAttribute("loginUser");
		p.setTaskWriter(e.getEmpId());
		
		// 프로젝트 상세 조회
		Project projectDetail = pService.projectDetail(pNo);
		System.out.println(p);
		
		// 업무 리스트 불러오기
		ArrayList<ProjectTask> taskList = pService.selectTaskList(pNo);
		
		if(taskList != null) {
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
		Employee e = (Employee)session.getAttribute("loginUser");
		p.setTaskWriter(e.getEmpId());
		
		Project projectDetail = pService.projectDetail(pNo);
		ArrayList<ProjectTask> taskList = pService.selectTaskList(pNo);
		
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
		
		if(result > 0) {
			return "redirect:afterTask.do";
		} else {
			model.addAttribute("msg", "보드 생성에 실패하였습니다.");
			return "common/blankPage";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
