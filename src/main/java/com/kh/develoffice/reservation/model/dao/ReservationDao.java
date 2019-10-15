package com.kh.develoffice.reservation.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.develoffice.reservation.model.vo.Payment;

@Repository("rDao")
public class ReservationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertPayment(Payment payment) {
		
		return sqlSession.insert("reservationMapper.insertPayment", payment);
	}

}
