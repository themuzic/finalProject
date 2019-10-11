package com.kh.develoffice.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Reservation {
	
	private String reservNum;		//예약번호
	private int empId;				//예약한 직원ID
	private String reservType;		//예약한것 종류
	private Date startDate;			//예약시작시간
	private Date endDate;			//예약종료시간
	

}
