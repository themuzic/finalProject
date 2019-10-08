package com.kh.develoffice.reservation.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.develoffice.reservation.model.dao.ReservationDao;

@Service("rService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDao rDao;

}
