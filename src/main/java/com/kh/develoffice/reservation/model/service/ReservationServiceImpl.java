package com.kh.develoffice.reservation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.reservation.model.dao.ReservationDao;
import com.kh.develoffice.reservation.model.vo.Payment;
import com.kh.develoffice.reservation.model.vo.Reservation;

@Service("rService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao rDao;

	@Override
	public int insertPayment(Payment payment) {
		
		return rDao.insertPayment(payment);
	}

	@Override
	public ArrayList<Payment> selectPayList(int empId) {
		
		return rDao.selectPayList(empId);
	}

	@Override
	public int insertReserv(Reservation reserv) {
		return rDao.insertReserv(reserv);
	}

	@Override
	public ArrayList<Reservation> selectReserv(Reservation reserv) {
		return rDao.selectReserv(reserv);
	}

	@Override
	public ArrayList<Reservation> selectMyReserv(int empId) {
		return rDao.selectMyReserv(empId);
	}

	@Override
	public int deleteReserv(Reservation reserv) {
		return rDao.deleteReserv(reserv);
	}

}
