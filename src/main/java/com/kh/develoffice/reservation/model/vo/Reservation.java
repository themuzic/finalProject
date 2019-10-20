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
	
	private int reservNum;			//예약번호
	private int empId;				//예약한 직원ID
	private String empName;			//예약한 직원이름
	private String jobName;			//예약한 직원직급
	private String reservType;		//예약한것 종류
	private String insertDate;		//예약등록한날짜시간
	private Date reservDate;		//예약한 날짜
	private String startTime;		//예약시작시간
	private String endTime;			//예약종료시간
	private String reason;			//사용용도
	

}
