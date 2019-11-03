package com.kh.develoffice.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.free.model.vo.FreeReply;
import com.kh.develoffice.project.model.service.ProjectService;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.project.model.vo.ProjectMember;
import com.kh.develoffice.project.model.vo.ProjectReply;
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
		System.out.println("insertMem.do : " + pNo);
		for(int i = 0; i < empIds.length; i++) {
			System.out.println("insertMem-empId: " + empIds[i]);
		}
		
		int result = pService.insertMem(empIds, pNo);
		
		if(result > 0) {
			mv.addObject("pNo", pNo);
			mv.setViewName("redirect:projectDetail.do");
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
		
		// 전체 사원 호출
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
		ArrayList<ProjectMember> mlist = pService.selectMlist();
		
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
			jObj.put("workStatus", e.getWorkStatus());
			
			empArr.add(jObj);
		}
		
		
		mv.addObject("mlist", mlist);
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
		System.out.println("여기까지 넘어옴");
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	// 진행상황 수정
	@ResponseBody
	@RequestMapping("updateProgress.do")
	public String updateProgress(Project p, Model model, HttpSession session) {
		System.out.println(p);
		
		Employee e = (Employee)session.getAttribute("loginUser");
		int empId = e.getEmpId();
		//System.out.println("empId: " + empId);
		int result = pService.updateProgress(p);
		System.out.println("updateProgress 여기까지 넘어옴.");
		
		if(result > 0) {
			//model.addAttribute("pProgress", p.getpProgress());
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 업무 상세사항 뷰로 이동
	@RequestMapping("taskDetail.do")
	public ModelAndView taskDetail(int taskNo, ModelAndView mv) {
		
		ProjectTask taskDetail = pService.taskDetail(taskNo);
		ArrayList<Employee> empList = eService.selectAllEmp();
		
		if(taskDetail != null) {
			mv.addObject("empList",empList);
			mv.addObject("taskDetail", taskDetail);
			mv.setViewName("project/taskDetail");
		}else {
			mv.addObject("msg", "존재하지 않습니다.");
		}
		return mv;
	}
	
	// 댓글 리스트
	@RequestMapping("rlist.do")
	public void getReplyList(int taskNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<ProjectReply> list = pService.selectReplyList(taskNo);
		
//		System.out.println(list);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
		
	}
	
	// 댓글 생성
	@ResponseBody
	@RequestMapping("rinsert.do")
	public String insertReply(ProjectReply r, HttpSession session) {
		
		int id = ((Employee)session.getAttribute("loginUser")).getEmpId();
		
		r.settRwriter(id);	// 작성한 회원 아이디 담기
		
		int result = pService.insertReply(r);
		//System.out.println(r.gettRContent());
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("rupdate.do")
	public String rupdate(ProjectReply r, HttpServletRequest request) {
		
		int result = pService.rupdate(r);
		System.out.println("넘어왔나? " + r.gettRContent());
		System.out.println("con-rId : " + r.gettRId());
		System.out.println("con-taskNo : " + r.getTaskNo());
		
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("rdelete.do")
	public String rdelete(ProjectReply r, HttpServletRequest request) {
		/* System.out.println(r); */
		int result = pService.rdelete(r);
		/* System.out.println(result); */
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
	
	
	
	
	

}
