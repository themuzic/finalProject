package com.kh.develoffice.employee.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;
import com.kh.develoffice.employee.model.vo.WorkTime;

@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	
	/**
	 * - 로그인 
	 * @param emp
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	   public ModelAndView loginMember(Employee emp, HttpSession session, ModelAndView mv) {
		
		Employee loginUser = eService.loginEmp(emp);	// 로그인 객체 정보 호출
		System.out.println(loginUser);
		   if(loginUser != null) {
			   
			   int id = loginUser.getEmpId();
			   session.setAttribute("loginUser", loginUser);	// 세션에 로그인 객체 담기
			   
//			   SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
//			   Date currentTime = new Date ();
//			   String today = sdf.format ( currentTime );
			   
			   ArrayList<Widget> widgetList = eService.selectWidget(id);	// 해당 계정의 위젯 정보 호출
			   
			   JSONArray jArr = new JSONArray();
				for(Widget w : widgetList) {
					JSONObject jObj = new JSONObject();
					jObj.put("widgetType", w.getWidgetType());
					jObj.put("empId", w.getEmpId());
					jObj.put("left", w.getLeft());
					jObj.put("top", w.getTop());
					jObj.put("fold", w.getFold());
					jObj.put("status", w.getStatus());
					
					jArr.add(jObj);
				}
				mv.addObject("widgetList", jArr);
				
				ArrayList<WorkTime> workList = eService.selectWorkList(id);
				JSONArray work = new JSONArray();
				for(WorkTime w : workList) {
					JSONObject jObj = new JSONObject();
					jObj.put("today", w.getToday());
					jObj.put("empId", w.getEmpId());
					jObj.put("checkIn", w.getCheckIn());
					jObj.put("checkOut", w.getCheckOut());
					
					work.add(jObj);
				}
				mv.addObject("workList", work).setViewName("main/mainPage");
			   
		   } else {			   
			   mv.addObject("msg", "로그인 실패");		// 전달하고자 하는 데이터 담기 addObject(key, value);
			   mv.setViewName("login");	// 뷰에 대한 정보 담기 setViewName(뷰명);
		   }
		return mv;
	}
	
	@RequestMapping("mainPage.do")
	public ModelAndView mainPage(int empId, ModelAndView mv) {
		
		ArrayList<Widget> widgetList = eService.selectWidget(empId);
		
//		System.out.println(empId);
//		System.out.println(widgetList);
		
		JSONArray jArr = new JSONArray();

		for(Widget w : widgetList) {
			JSONObject jObj = new JSONObject();
			jObj.put("widgetType", w.getWidgetType());
			jObj.put("empId", w.getEmpId());
			jObj.put("left", w.getLeft());
			jObj.put("top", w.getTop());
			jObj.put("fold", w.getFold());
			jObj.put("status", w.getStatus());
			
			jArr.add(jObj);
		}
		
		mv.addObject("widgetList", jArr).setViewName("main/mainPage");
		
		return mv;
	}
	
	/**
	 * - 로그아웃
	 * @param status
	 * @param mv
	 * @return
	 */
	@RequestMapping("logout.do")
	public ModelAndView logout(SessionStatus status, ModelAndView mv) {
		// SessionStatus : 세션의 상태를 관리하는 객체
		
		status.setComplete();
		
		mv.setViewName("login");
		
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping("saveWidget.do")
	public String saveWidget(Widget w) {
		
		int result = eService.saveWidget(w);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping("autocomplete.do")
	public JSONArray autocomplete(String key, Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		ArrayList<Employee> list = eService.autocomplete(key);
		//System.out.println(list);
		
		JSONArray jArr = new JSONArray();
		
		if(list != null) {
			
			for(Employee e : list) {
				JSONObject jObj = new JSONObject();
				jObj.put("empId", e.getEmpId());
				jObj.put("empName", e.getEmpName());
				jObj.put("empPwd", e.getEmpPwd());
				jObj.put("gender", e.getGender());
				jObj.put("birth", sdf.format(e.getBirth()));
				jObj.put("deptCode", e.getDeptCode());
				jObj.put("deptName", e.getDeptName());
				jObj.put("jobCode", e.getJobCode());
				jObj.put("jobName", e.getJobName());
				jObj.put("phone", e.getPhone());
				jObj.put("email", e.getEmail());
				jObj.put("address", e.getAddress());
				jObj.put("salary", e.getSalary());
				jObj.put("account", e.getAccount());
				jObj.put("star", e.getStar());
				jObj.put("empStatus", e.getEmpStatus());
				jObj.put("profilePath", e.getProfilePath());
				
				jArr.add(jObj);
			}
			return jArr;
			
		}else {
			return jArr;
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping("startWork.do")
	public String insertStartTime(WorkTime work,HttpSession session) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMdd", Locale.KOREA);
		Date temp = new Date();
		work.setToday(sdf.format(temp));
		System.out.println(work);
		
		int result = eService.insertStartTime(work);
		
		if(result > 0) {
			int result2 = eService.updateWorkStatus(work);
			
			if(result2 > 0) {
				Employee loginUser = eService.selectEmp(work.getEmpId());
				session.setAttribute("loginUser", loginUser);
				return "success";
			}else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("endWork.do")
	public JSONArray updateEndTime(WorkTime work,HttpSession session) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMdd", Locale.KOREA);
		SimpleDateFormat sdf2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
		Date temp = new Date();
		work.setToday(sdf.format(temp));
		System.out.println(work);
		
		int result = eService.updateEndTime(work);
		JSONArray workList = new JSONArray();
		
		if(result > 0) {
			int result2 = eService.updateWorkStatus2(work);
			
			if(result2 > 0) {
				Employee loginUser = eService.selectEmp(work.getEmpId());
				session.setAttribute("loginUser", loginUser);
				
				ArrayList<WorkTime> wList = eService.selectWorkList(work.getEmpId());
				for(WorkTime w : wList) {
					JSONObject jObj = new JSONObject();
					jObj.put("today", w.getToday());
					jObj.put("empId", w.getEmpId());
					jObj.put("checkIn", w.getCheckIn());
					jObj.put("checkOut", w.getCheckOut());
					
					workList.add(jObj);
				}
				System.out.println(workList);
				return workList;
			} else {
				return workList;
			}
		}else {
			return workList;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
