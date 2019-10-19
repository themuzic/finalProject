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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;

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
		
		   if(loginUser != null) {
			   
			   int id = loginUser.getEmpId();
			   session.setAttribute("loginUser", loginUser);	// 세션에 로그인 객체 담기
			   
//			   SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
//			   Date currentTime = new Date ();
//			   String today = sdf.format ( currentTime );
//			   
//			   session.setAttribute("today", today);	// 세션에 오늘 날짜 담기
			   
			   
			   ArrayList<Widget> widgetList = eService.selectWidget(id);	// 해당 계정의 위젯 정보 호출
			   
//			   System.out.println(widgetList);
			   
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
		
		System.out.println(w);
		
		int result = eService.saveWidget(w);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
	}

}
