package com.kh.develoffice.reservation.model.service;

import java.util.ArrayList;

import com.kh.develoffice.reservation.model.vo.Payment;
import com.kh.develoffice.reservation.model.vo.Reservation;

public interface ReservationService {
	
	// 결제 생성 서비스
	int insertPayment(Payment payment);
	
	// 내 결제내역 불러오기
	ArrayList<Payment> selectPayList(int empId);
	
	// 예약 하기
	int insertReserv(Reservation reserv);
	
	// 타입에 따른 모든 예약 내역 호출하기
	ArrayList<Reservation> selectReserv(Reservation reserv);
	
	// 내 예약 내역 호출하기
	ArrayList<Reservation> selectMyReserv(int empId);
	
	// 예약 내역 삭제하기
	int deleteReserv(Reservation reserv);
	
}
