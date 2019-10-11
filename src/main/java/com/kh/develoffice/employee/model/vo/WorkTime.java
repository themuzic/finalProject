package com.kh.develoffice.employee.model.vo;

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
public class WorkTime {
	
	private String today;	//당일날짜(yyyyMMdd)
	private int empId;		//직원ID
	private Date checkIn;	//출근시간
	private Date checkOut;	//퇴근시간
	
	
	public WorkTime(String today, int empId, Date checkIn) {
		super();
		this.today = today;
		this.empId = empId;
		this.checkIn = checkIn;
	}
	
}
