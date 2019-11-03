package com.kh.develoffice.insa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.develoffice.common.Department;
import com.kh.develoffice.common.Job;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.insa.model.service.InsaService;

@Controller
public class InsaController {
	@Autowired
	private InsaService iService;
	@Autowired
	private EmployeeService eService;
	@Autowired
	private DocumentService dService;
	
	@RequestMapping("insaUpdateForm.do")
	public ModelAndView insaUpdateForm(ModelAndView mv) {
		ArrayList<Department> deptList = dService.selectDept();
		ArrayList<Employee> empList = eService.selectAllEmp();
		ArrayList<Job> jobList = iService.selectJob();
		//System.out.println(deptList);
		//System.out.println(empList);
		for(Employee e : empList) {
			if(e.getEmpId() == 10001) {
				empList.remove(e);
				break;
			}
		}
		for(Job j : jobList) {
			if(j.getJobCode() == 1) {
				jobList.remove(j);
				break;
			}
		}
		String jobArr = new Gson().toJson(jobList);
		String deptArr = new Gson().toJson(deptList);
		String empArr = new Gson().toJson(empList);

		mv.addObject("empList", empArr);
		mv.addObject("empSize", empList.size());
		mv.addObject("deptList", deptArr);
		mv.addObject("deptSize", deptList.size());
		mv.addObject("jobList", jobArr);
		mv.setViewName("insa/empUpdateView");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("insaUpdate.do")
	public String insaUpdate(Employee e, HttpServletResponse response) {
		System.out.println(e);
		int result = iService.insaUpdate(e);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
}
