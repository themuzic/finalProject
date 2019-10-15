package com.kh.develoffice.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.reservation.model.service.ReservationService;
import com.kh.develoffice.reservation.model.vo.Payment;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	
	@RequestMapping("myReservListView.do")
	public ModelAndView myReservListView(int empId, ModelAndView mv) {
		
		
		ArrayList<Payment> payList = rService.selectPayList(empId);
		
		System.out.println(empId);
		System.out.println(payList);
		
		mv.addObject("payList", payList).setViewName("reservation/myReservation");
		
		return mv;
	}
	
	
	@RequestMapping("conferenceRoom.do")
	public String conferenceRoom() {
		return "reservation/confRoom";
	}
	
	
	@RequestMapping("car.do")
	public String car() {
		return "reservation/car";
	}
	
	
	@RequestMapping("massage.do")
	public String massage() {
		return "reservation/massage";
	}
	
	
	@RequestMapping("cafe.do")
	public String cafe() {
		return "reservation/cafe";
	}
	
	@ResponseBody
	@RequestMapping("payment.do")
	public String insertPayment(Payment payment) {
		
		System.out.println(payment);
				
		int result = rService.insertPayment(payment);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

}
