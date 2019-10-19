package com.kh.develoffice.reservation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.reservation.model.service.ReservationService;
import com.kh.develoffice.reservation.model.vo.Payment;
import com.kh.develoffice.reservation.model.vo.Reservation;

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
	public ModelAndView conferenceRoom(Reservation reserv, ModelAndView mv) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		
		ArrayList<Reservation> reservList = rService.selectReserv(reserv);
		
		JSONArray rArr = new JSONArray();
		
		for(Reservation r : reservList) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("reservNum", r.getReservNum());
			jObj.put("empId", r.getEmpId());
			jObj.put("reservType", r.getReservType());
			jObj.put("reservDate", sdf.format(r.getReservDate()));
			jObj.put("startTime", r.getStartTime());
			jObj.put("endTime", r.getEndTime());
			jObj.put("reason", r.getReason());
			
			rArr.add(jObj);			
		}
		
		mv.addObject("reservList", rArr).setViewName("reservation/confRoom");
		
		return mv;
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
	
	@ResponseBody
	@RequestMapping("insertReserv.do")
	public String insertReserv(Reservation reserv) {
		
		System.out.println(reserv);
		
		int result = rService.insertReserv(reserv);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	

}
