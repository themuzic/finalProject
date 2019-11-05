package com.kh.develoffice.reservation.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.reservation.model.service.ReservationService;
import com.kh.develoffice.reservation.model.vo.Payment;
import com.kh.develoffice.reservation.model.vo.Reservation;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	
	@RequestMapping("myReservListView.do")
	public ModelAndView myReservListView(int empId, ModelAndView mv) {
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		ArrayList<Reservation> reservList = rService.selectMyReserv(empId);
		ArrayList<Payment> payList = rService.selectPayList(empId);
		
		JSONArray rArr = new JSONArray();
		
		for(Reservation r : reservList) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("reservNum", r.getReservNum());
			jObj.put("empId", r.getEmpId());
			jObj.put("empName", r.getEmpName());
			jObj.put("jobName", r.getJobName());
			jObj.put("reservType", r.getReservType());
			jObj.put("insertDate", r.getInsertDate());
			jObj.put("reservDate", sdf.format(r.getReservDate()));
			jObj.put("startTime", r.getStartTime());
			jObj.put("endTime", r.getEndTime());
			jObj.put("reason", r.getReason());
			jObj.put("delStatus", r.getDelStatus());
			
			rArr.add(jObj);			
		}
		
		System.out.println(empId);
		System.out.println(payList);
		mv.addObject("reservList", reservList);
		mv.addObject("rList", rArr);
		mv.addObject("payList", payList).setViewName("reservation/myReservation");
		
		return mv;
	}
	/*
	@RequestMapping("updateReservList.do")
	public void updateReservList(HttpServletResponse response, HttpSession session) throws JsonIOException, IOException {
		
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		ArrayList<Reservation> reservList = rService.selectMyReserv(empId);
		ArrayList<Reservation> rList = rService.selectMyReserv(empId);
		ArrayList<Payment> payList = rService.selectPayList(empId);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		gson.toJson(reservList, response.getWriter());
		gson.toJson(payList, response.getWriter());
		gson.toJson(reservList, response.getWriter());
		
	}
	*/
	
	
	
	@RequestMapping("conferenceRoom.do")
	public ModelAndView conferenceRoom(Reservation reserv, ModelAndView mv) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		
		ArrayList<Reservation> reservList = rService.selectReserv(reserv);
		
		JSONArray rArr = new JSONArray();
		
		for(Reservation r : reservList) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("reservNum", r.getReservNum());
			jObj.put("empId", r.getEmpId());
			jObj.put("empName", r.getEmpName());
			jObj.put("jobName", r.getJobName());
			jObj.put("reservType", r.getReservType());
			jObj.put("insertDate", r.getInsertDate());
			jObj.put("reservDate", sdf.format(r.getReservDate()));
			jObj.put("startTime", r.getStartTime());
			jObj.put("endTime", r.getEndTime());
			jObj.put("reason", r.getReason());
			jObj.put("delStatus", r.getDelStatus());
			
			rArr.add(jObj);			
		}
		
		mv.addObject("reservList", rArr).setViewName("reservation/confRoom");
		
		return mv;
	}
	
	
	@RequestMapping("car.do")
	public ModelAndView car(Reservation reserv, ModelAndView mv) {

		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		
		ArrayList<Reservation> reservList = rService.selectReserv(reserv);
		
		JSONArray rArr = new JSONArray();
		
		for(Reservation r : reservList) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("reservNum", r.getReservNum());
			jObj.put("empId", r.getEmpId());
			jObj.put("empName", r.getEmpName());
			jObj.put("jobName", r.getJobName());
			jObj.put("reservType", r.getReservType());
			jObj.put("insertDate", r.getInsertDate());
			jObj.put("reservDate", sdf.format(r.getReservDate()));
			jObj.put("startTime", r.getStartTime());
			jObj.put("endTime", r.getEndTime());
			jObj.put("reason", r.getReason());
			jObj.put("delStatus", r.getDelStatus());
			
			rArr.add(jObj);			
		}
		
		mv.addObject("reservList", rArr).setViewName("reservation/car");
		
		return mv;
	}
	
	
	@RequestMapping("massage.do")
	public ModelAndView massage(Reservation reserv, ModelAndView mv) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		
		ArrayList<Reservation> reservList = rService.selectReserv(reserv);
		
		JSONArray rArr = new JSONArray();
		
		for(Reservation r : reservList) {
			JSONObject jObj = new JSONObject();
			
			jObj.put("reservNum", r.getReservNum());
			jObj.put("empId", r.getEmpId());
			jObj.put("empName", r.getEmpName());
			jObj.put("jobName", r.getJobName());
			jObj.put("reservType", r.getReservType());
			jObj.put("insertDate", r.getInsertDate());
			jObj.put("reservDate", sdf.format(r.getReservDate()));
			jObj.put("startTime", r.getStartTime());
			jObj.put("endTime", r.getEndTime());
			jObj.put("reason", r.getReason());
			jObj.put("delStatus", r.getDelStatus());
			
			rArr.add(jObj);			
		}
		
		mv.addObject("reservList", rArr).setViewName("reservation/massage");
		
		return mv;
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
	public void insertReserv(Reservation reserv, HttpServletResponse response) throws JsonIOException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
		Date nowDate = new Date(new java.util.Date().getTime());

		String insertDate = sdf.format(nowDate);
		
		reserv.setInsertDate(insertDate);
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		ArrayList<Reservation> reservList = new ArrayList<>();
		
		int result = rService.insertReserv(reserv);
		if(result > 0) {
			reservList = rService.selectReserv(reserv);
		}
		gson.toJson(reservList, response.getWriter());
	}
	
	
	@ResponseBody
	@RequestMapping("deleteReserv.do")
	public JSONArray deleteReserv(Reservation reserv) {
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		int result = rService.deleteReserv(reserv);
		JSONArray rList = new JSONArray();
		
		if(result > 0) {
			ArrayList<Reservation> reservList = rService.selectMyReserv(reserv.getEmpId());
			
			
			for(Reservation r : reservList) {
				JSONObject jObj = new JSONObject();
				
				jObj.put("reservNum", r.getReservNum());
				jObj.put("empId", r.getEmpId());
				jObj.put("empName", r.getEmpName());
				jObj.put("jobName", r.getJobName());
				jObj.put("reservType", r.getReservType());
				jObj.put("insertDate", r.getInsertDate());
				jObj.put("reservDate", sdf.format(r.getReservDate()));
				jObj.put("startTime", r.getStartTime());
				jObj.put("endTime", r.getEndTime());
				jObj.put("reason", r.getReason());
				jObj.put("delStatus", r.getDelStatus());
				
				rList.add(jObj);			
			}
			return rList;
			
		} else {
			return rList;
		}
	}
	

}
