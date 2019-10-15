package com.kh.develoffice.reservation.model.service;

import com.kh.develoffice.reservation.model.vo.Payment;

public interface ReservationService {
	
	// 결제 생성 서비스
	int insertPayment(Payment payment);

}
