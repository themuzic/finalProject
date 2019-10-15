package com.kh.develoffice.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.reservation.model.dao.ReservationDao;
import com.kh.develoffice.reservation.model.vo.Payment;

@Service("rService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao rDao;

	@Override
	public int insertPayment(Payment payment) {
		
		return rDao.insertPayment(payment);
	}

}
