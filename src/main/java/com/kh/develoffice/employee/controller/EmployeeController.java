package com.kh.develoffice.employee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;

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
		
		Employee loginUser = eService.loginEmp(emp);
		   
		   if(loginUser != null) {
			   
			   session.setAttribute("loginUser", loginUser);			   
			   mv.setViewName("main/mainPage");
			   
		   } else {			   
			   mv.addObject("msg", "로그인 실패");		// 전달하고자 하는 데이터 담기 addObject(key, value);
			   mv.setViewName("login");	// 뷰에 대한 정보 담기 setViewName(뷰명);
		   }
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

}
