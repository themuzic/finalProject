package com.kh.develoffice.reservation.model.service;

import java.util.ArrayList;

import com.kh.develoffice.reservation.model.vo.Payment;

public interface ReservationService {
	
	// 결제 생성 서비스
	int insertPayment(Payment payment);
	
	// 내 결제내역 불러오기
	ArrayList<Payment> selectPayList(int empId);

}
