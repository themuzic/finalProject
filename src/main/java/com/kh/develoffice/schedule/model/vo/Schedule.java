package com.kh.develoffice.schedule.model.vo;

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
public class Schedule {
	
	private int sno;
	private int empId;
	private String empName;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String allDay;
	private String stitle;
	private String scontent;
	private String stype;
	private String backColor;
	private Date createDate;
	private String status;
	private String splan;
	
	private int deptCode;
	
	
	
	
	
	

}
