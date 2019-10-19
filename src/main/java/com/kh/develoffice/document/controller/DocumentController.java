package com.kh.develoffice.document.controller;

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
import com.kh.develoffice.employee.model.vo.Widget;

@Controller
public class DocumentController {
	
	@Autowired
	private DocumentService dService;
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping("insertDocumentForm.do")
	public ModelAndView insertDocumentForm(ModelAndView mv) {
		
		ArrayList<Department> deptList = dService.selectDept();
		ArrayList<Employee> empList = eService.selectAllEmp();
		
		System.out.println(deptList);
		System.out.println(empList);
		
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
		mv.setViewName("document/document");
		
		return mv;
	}
	
	@RequestMapping("documentTable.do")
	public String documentTableList() {
		return "document/dcTable";
	}
		
	@RequestMapping("documentDetailView.do")
	public String documentDetailView() {
		return "document/dcDetailA";
		/* return "common/test"; */
	}
	
	

}
