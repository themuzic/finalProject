package com.kh.develoffice.employee.model.vo;

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
	private String checkIn;	//출근시간
	private String checkOut;	//퇴근시간
	
	
	
}
